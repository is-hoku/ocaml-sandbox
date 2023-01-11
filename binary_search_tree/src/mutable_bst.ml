type tree =
  | Leaf
  | Branch of { mutable left : tree; mutable value : int; mutable right : tree }

let rec find (t, n) =
  match t with
  | Leaf -> false
  | Branch { left = l; value = v; right = r } ->
      if n = v then true else if n < v then find (l, n) else find (r, n)

let rec insert (t, n) =
  match t with
  | Leaf -> Branch { left = Leaf; value = n; right = Leaf }
  | Branch br ->
      if n = br.value then t
      else if n < br.value then (
        br.left <- insert (br.left, n);
        t)
      else (
        br.right <- insert (br.right, n);
        t)

let rec min t =
  match t with
  | Leaf -> min_int
  | Branch { left = Leaf; value = v; right = _ } -> v
  | Branch { left = l; value = _; right = _ } -> min l

let rec delete (t, n) =
  match t with
  | Leaf -> t
  | Branch br ->
      if n = br.value then (
        match (br.left, br.right) with
        | Leaf, Leaf -> Leaf
        | Branch _, Leaf -> br.left
        | Leaf, Branch _ -> br.right
        | Branch _, Branch _ ->
            let m = min br.right in
            br.value <- m;
            br.right <- delete (br.right, m);
            t)
      else if n < br.value then (
        br.left <- delete (br.left, n);
        t)
      else (
        br.right <- delete (br.right, n);
        t)
