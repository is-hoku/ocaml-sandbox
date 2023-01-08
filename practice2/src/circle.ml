type point = { x : int; y : int }

let pi = 3.14
let square n = n * n
let squaref n = n *. n

let area ({ x = ax; y = ay }, { x = bx; y = by }) =
  pi
  *. squaref (sqrt (float_of_int (square (ax - bx) + square (ay - by)) /. 2.))
