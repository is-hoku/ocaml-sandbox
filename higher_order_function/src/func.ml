open Binary_search_tree

let rec sigma (f, n) = if n < 1 then f 0 else sigma (f, n - 1) + f n

type gender = Male | Female

let greeting (gen, name) =
  match gen with Male -> "Hello, Mr." ^ name | Female -> "Hello, Ms." ^ name

let curried_greeting gen name =
  match gen with Male -> "Hello, Mr." ^ name | Female -> "Hello, Ms." ^ name

let rec treemap f t =
  match t with
  | Bst.Leaf -> Bst.Leaf
  | Bst.Branch { left = l; value = v; right = r } ->
      Bst.Branch { left = treemap f l; value = f v; right = treemap f r }

let rec treefold e f t =
  match t with
  | Bst.Leaf -> e
  | Bst.Branch { left = l; value = v; right = r } ->
      f (treefold e f l) v (treefold e f r)
