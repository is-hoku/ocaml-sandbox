let is_natural n = if n > 0 then true else false

let rec squaresum n =
  if is_natural n then if n = 1 then 1 else (n * n) + squaresum (n - 1) else 0

let rec fib n =
  if n = 0 then 0 else if n = 1 then 1 else fib (n - 1) + fib (n - 2)

let rec gcd (n, m) = if m = 0 then n else gcd (m, n mod m)
