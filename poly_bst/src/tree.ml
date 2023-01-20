module Bst = struct
  type 'elm tree =
    | Leaf
    | Branch of { left : 'elm tree; value : 'elm; right : 'elm tree }

  let rec find cmp t n =
    match t with
    | Leaf -> false
    | Branch { left = l; value = v; right = r } ->
        if cmp n v = 0 then true
        else if cmp n v < 0 then find cmp l n
        else find cmp r n

  let rec min t =
    match t with
    | Leaf -> invalid_arg "Input can't be a leaf!"
    | Branch { left = Leaf; value = v; right = _ } -> v
    | Branch { left = l; value = _; right = _ } -> min l
end
