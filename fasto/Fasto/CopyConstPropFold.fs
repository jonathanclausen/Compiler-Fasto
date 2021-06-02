module CopyConstPropFold


(*
    (* An optimisation takes a program and returns a new program. *)
    val optimiseProgram : Fasto.KnownTypes.Prog -> Fasto.KnownTypes.Prog
*)

open AbSyn

(* A propagatee is something that we can propagate - either a variable
   name or a constant value. *)
type Propagatee =
    ConstProp of Value
  | VarProp   of string

type VarTable = SymTab.SymTab<Propagatee>

let rec copyConstPropFoldExp (vtable : VarTable)
                             (e      : TypedExp) =
    match e with
        (* Copy propagation is handled entirely in the following three
        cases for variables, array indexing, and let-bindings. *)
        | Var (name, pos) ->
    

            match SymTab.lookup name vtable with
              | None   -> Var(name,pos)
              | Some a -> match a with
                            | ConstProp e -> Constant(e, pos)
                            | VarProp e   -> Var(e, pos)
                            

        | Index (name, e, t, pos) ->
          
            let e' = copyConstPropFoldExp vtable e

            match SymTab.lookup name vtable with
              | None   -> Index(name, e, t, pos)
              | Some a -> match a with
                            | VarProp f   -> Index(f, e', t, pos)
                            | _ -> (Index(name, e, t, pos))

        | Let (Dec (name, e, decpos), body, pos) ->
            let e' = copyConstPropFoldExp vtable e
            match e' with
                | Var (e_name, _) ->
                    let vtab = SymTab.bind name (VarProp(e_name)) vtable
                    let body' = copyConstPropFoldExp vtab body
                    Let (Dec (name, e', decpos), body', pos)
                    
                | Constant (value, _) ->
                    let vtab = SymTab.bind name (ConstProp(value)) vtable
                    let body' = copyConstPropFoldExp vtab body
                    Let (Dec (name, e', decpos), body', pos)

                   
                | Let (Dec (x, e1, posx), e2, _) ->
                    let body' = copyConstPropFoldExp vtable body
                    let e1' = copyConstPropFoldExp vtable e1
                    let e2' = copyConstPropFoldExp vtable e2
                    let inner = Let (Dec(name, e2', posx),body',pos)
                    copyConstPropFoldExp vtable (Let (Dec(x,e1',decpos),inner,pos))
                   
                | _ -> (* Fallthrough - for everything else, do nothing *)
                    let body' = copyConstPropFoldExp vtable body
                    Let (Dec (name, e', decpos), body', pos)

        | Times (e1, e2, pos) ->

            let e1' = copyConstPropFoldExp vtable e1
            let e2' = copyConstPropFoldExp vtable e2

            match (e1', e2') with
                | (Constant (IntVal 0, _), _) -> Constant (IntVal 0, pos)
                | (_, Constant (IntVal 0, _)) -> Constant (IntVal 0, pos)
                | (Constant (IntVal 1, _), _) -> e2'
                | (_, Constant (IntVal 1, _)) -> e1'
                | (Constant (IntVal x, _), Constant (IntVal y, _)) -> Constant (IntVal (x * y), pos)
                | _ -> Times (e1', e2', pos)

        | And (e1, e2, pos) ->
            let e1' = copyConstPropFoldExp vtable e1
            let e2' = copyConstPropFoldExp vtable e2
            match (e1', e2') with
                | (Constant (BoolVal false, _), _) -> Constant (BoolVal false, pos)
                | (Constant (BoolVal a, _), Constant (BoolVal b, _)) ->
                    Constant (BoolVal (a && b), pos)
                | _ -> Or (e1', e2', pos)
        | Constant (x,pos) -> Constant (x,pos)
        | StringLit (x,pos) -> StringLit (x,pos)
        | ArrayLit (es, t, pos) ->
            ArrayLit (List.map (copyConstPropFoldExp vtable) es, t, pos)
        | Plus (e1, e2, pos) ->
            let e1' = copyConstPropFoldExp vtable e1
            let e2' = copyConstPropFoldExp vtable e2
            match (e1', e2') with
                | (Constant (IntVal x, _), Constant (IntVal y, _)) ->
                    Constant (IntVal (x + y), pos)
                | (Constant (IntVal 0, _), _) -> e2'
                | (_, Constant (IntVal 0, _)) -> e1'
                | _ -> Plus (e1', e2', pos)
        | Minus (e1, e2, pos) ->
            let e1' = copyConstPropFoldExp vtable e1
            let e2' = copyConstPropFoldExp vtable e2
            match (e1', e2') with
                | (Constant (IntVal x, _), Constant (IntVal y, _)) ->
                    Constant (IntVal (x - y), pos)
                | (_, Constant (IntVal 0, _)) -> e1'
                | _ -> Minus (e1', e2', pos)
        | Equal (e1, e2, pos) ->
            let e1' = copyConstPropFoldExp vtable e1
            let e2' = copyConstPropFoldExp vtable e2
            match (e1', e2') with
                | (Constant (IntVal v1, _), Constant (IntVal v2, _)) ->
                    Constant (BoolVal (v1 = v2), pos)
                | _ ->
                    if false (* e1' = e2' *)  (* <- this would be unsafe! (why?) *)
                    then Constant (BoolVal true, pos)
                    else Equal (e1', e2', pos)
        | Less (e1, e2, pos) ->
            let e1' = copyConstPropFoldExp vtable e1
            let e2' = copyConstPropFoldExp vtable e2
            match (e1', e2') with
                | (Constant (IntVal v1, _), Constant (IntVal v2, _)) ->
                    Constant (BoolVal (v1 < v2), pos)
                | _ ->
                    if false (* e1' = e2' *)  (* <- as above *)
                    then Constant (BoolVal false, pos)
                    else Less (e1', e2', pos)
        | If (e1, e2, e3, pos) ->
            let e1' = copyConstPropFoldExp vtable e1
            match e1' with
                | Constant (BoolVal b, _) ->
                    if b
                    then copyConstPropFoldExp vtable e2
                    else copyConstPropFoldExp vtable e3
                | _ ->
                    If (e1',
                        copyConstPropFoldExp vtable e2,
                        copyConstPropFoldExp vtable e3,
                        pos)
        | Apply (fname, es, pos) ->
            Apply (fname, List.map (copyConstPropFoldExp vtable) es, pos)
        | Iota (e, pos) ->
            Iota (copyConstPropFoldExp vtable e, pos)
        | Replicate (n, e, t, pos) ->
            Replicate (copyConstPropFoldExp vtable n,
                       copyConstPropFoldExp vtable e,
                       t, pos)
        | Map (farg, e, t1, t2, pos) ->
            Map (copyConstPropFoldFunArg vtable farg,
                 copyConstPropFoldExp vtable e,
                 t1, t2, pos)
        | Filter (farg, e, t1, pos) ->
            Filter (copyConstPropFoldFunArg vtable farg,
                    copyConstPropFoldExp vtable e,
                    t1, pos)
        | Reduce (farg, e1, e2, t, pos) ->
            Reduce (copyConstPropFoldFunArg vtable farg,
                    copyConstPropFoldExp vtable e1,
                    copyConstPropFoldExp vtable e2,
                    t, pos)
        | Scan (farg, e1, e2, t, pos) ->
            Scan (copyConstPropFoldFunArg vtable farg,
                  copyConstPropFoldExp vtable e1,
                  copyConstPropFoldExp vtable e2,
                  t, pos)
        | Divide (e1, e2, pos) ->
            let e1' = copyConstPropFoldExp vtable e1
            let e2' = copyConstPropFoldExp vtable e2
            match (e1', e2') with
                | (Constant (IntVal x, _), Constant (IntVal 0, _)) -> Divide (e1', e2', pos)
                | (Constant (IntVal x, _), Constant (IntVal y, _)) -> Constant (IntVal (x / y), pos)
                | _ -> Divide (e1', e2', pos)
        | Or (e1, e2, pos) ->
            let e1' = copyConstPropFoldExp vtable e1
            let e2' = copyConstPropFoldExp vtable e2
            match (e1', e2') with
                | (Constant (BoolVal a, _), Constant (BoolVal b, _)) ->
                    Constant (BoolVal (a || b), pos)
                | _ -> Or (e1', e2', pos)
        | Not (e, pos) ->
            let e' = copyConstPropFoldExp vtable e
            match e' with
                | Constant (BoolVal a, _) -> Constant (BoolVal (not a), pos)
                | _ -> Not (e', pos)
        | Negate (e, pos) ->
            let e' = copyConstPropFoldExp vtable e
            match e' with
                | Constant (IntVal x, _) -> Constant (IntVal (-x), pos)
                | _ -> Negate (e', pos)
        | Read (t, pos) -> Read (t, pos)
        | Write (e, t, pos) -> Write (copyConstPropFoldExp vtable e, t, pos)

and copyConstPropFoldFunArg (vtable : VarTable)
                            (farg   : TypedFunArg) =
    match farg with
        | FunName fname -> FunName fname
        | Lambda (rettype, paramls, body, pos) ->
            (* Remove any bindings with the same names as the parameters. *)
            let paramNames = (List.map (fun (Param (name, _)) -> name) paramls)
            let vtable'    = SymTab.removeMany paramNames vtable
            Lambda (rettype, paramls, copyConstPropFoldExp vtable' body, pos)

let copyConstPropFoldFunDec = function
    | FunDec (fname, rettype, paramls, body, loc) ->
        let body' = copyConstPropFoldExp (SymTab.empty ()) body
        FunDec (fname, rettype, paramls, body', loc)

let optimiseProgram (prog : TypedProg) =
    List.map copyConstPropFoldFunDec prog
