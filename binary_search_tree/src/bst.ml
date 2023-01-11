type tree = Leaf | Branch of { left : tree; value : int; right : tree }

let rec find (t, n) =
  match t with
  | Leaf -> false
  | Branch { left = l; value = v; right = r } ->
      if n = v then true else if n < v then find (l, n) else find (r, n)

let rec insert (t, n) =
  match t with
  | Leaf -> Branch { left = Leaf; value = n; right = Leaf }
  | Branch { left = l; value = v; right = r } ->
      if n = v then t
      else if n < v then Branch { left = insert (l, n); value = v; right = r }
      else Branch { left = l; value = v; right = insert (r, n) }

let rec min t =
  match t with
  | Leaf -> min_int
  | Branch { left = Leaf; value = v; right = _ } -> v
  | Branch { left = l; value = _; right = _ } -> min l

let rec delete (t, n) =
  match t with
  | Leaf -> t
  | Branch { left = l; value = v; right = r } ->
      if n = v then
        match (l, r) with
        | Leaf, Leaf -> Leaf
        | Branch _, Leaf -> l
        | Leaf, Branch _ -> r
        | Branch _, Branch _ ->
            let m = min r in
            Branch { left = l; value = m; right = delete (r, m) }
      else if n < v then Branch { left = delete (l, n); value = v; right = r }
      else Branch { left = l; value = v; right = delete (r, n) }
