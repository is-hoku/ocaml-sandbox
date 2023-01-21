open Binary_search_tree

module Func : sig
  type gender = Male | Female

  val sigma : (int -> int) * int -> int
  val greeting : gender * string -> string
  val curried_greeting : gender -> string -> string
  val treemap : (int -> int) -> Bst.tree -> Bst.tree
end
