let rec sigma (f, n) = if n < 1 then f 0 else sigma (f, n - 1) + f n

type gender = Male | Female

let greeting (gen, name) =
  match gen with Male -> "Hello, Mr." ^ name | Female -> "Hello, Ms." ^ name

let curried_greeting gen name =
  match gen with Male -> "Hello, Mr." ^ name | Female -> "Hello, Ms." ^ name
