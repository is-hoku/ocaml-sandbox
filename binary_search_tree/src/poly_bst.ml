type 'elm tree =
  | Leaf
  | Branch of { left : 'elm tree; value : 'elm; right : 'elm tree }

let t1 = Branch { left = Leaf; value = 10; right = Leaf }
let t2 = Branch { left = Leaf; value = 25; right = Leaf }
let t3 = Branch { left = t1; value = 15; right = t2 }
let t4 = Branch { left = Leaf; value = 60; right = Leaf }
let t5 = Branch { left = Leaf; value = 48; right = t4 }
let t6 = Branch { left = t3; value = 30; right = t5 }
let t11 = Branch { left = Leaf; value = "I"; right = Leaf }
let t12 = Branch { left = Leaf; value = "love"; right = Leaf }
let t13 = Branch { left = t11; value = "OCaml"; right = t12 }
let t14 = Branch { left = Leaf; value = "How"; right = Leaf }
let t15 = Branch { left = Leaf; value = "about"; right = t14 }
let t16 = Branch { left = t13; value = "you?"; right = t15 }

let rec size t =
  match t with
  | Leaf -> 0
  | Branch { left = l; value = _; right = r } -> size l + size r + 1

let max (n, m) = if n < m then m else n

let rec depth t =
  match t with
  | Leaf -> 0
  | Branch { left = l; value = _; right = r } -> max (depth l, depth r) + 1

let rec reflect t =
  match t with
  | Leaf -> Leaf
  | Branch { left = l; value = v; right = r } ->
      Branch { left = reflect r; value = v; right = reflect l }

let rec add (t, e) =
  match t with
  | Leaf -> t
  | Branch { left = l; value = v; right = r } ->
      Branch { left = add (l, e); value = v; right = r }

let rec string_of_int_tree t =
  match t with
  | Leaf -> "Leaf"
  | Branch { left = l; value = v; right = r } ->
      "Branch(" ^ string_of_int_tree l ^ "," ^ string_of_int v ^ ","
      ^ string_of_int_tree r ^ ")"
