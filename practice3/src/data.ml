open Practice2.Circle

let origin = { x = 0; y = 0 }
let p = { origin with y = 3 }

type mutable_point = { mutable x : int; mutable y : int }

let m_origin = { x = 0; y = 0 };;

m_origin.x <- 2

let show_m_origin =
  "x: " ^ string_of_int m_origin.x ^ ", y: " ^ string_of_int m_origin.y

let x = ref 1

let ref_x =
  x := 2;
  x := !x + 1;
  !x

let countup =
  for i = 1 to 10 do
    print_int i;
    print_newline ()
  done
