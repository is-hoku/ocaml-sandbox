let rec sum n = if n = 1 then 1 else n + sum (n - 1) (*末尾再帰でない sum*)
let rec sum' (n, m) = if n = 1 then m + 1 else m + sum' (n - 1, n) (*まだ末尾再帰でない*)
let rec sum'' (n, m) = if n = 1 then m + 1 else sum'' (n - 1, m + n)
(*末尾再帰 最初の m は 0 にする必要がある*)
