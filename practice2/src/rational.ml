open Practice1

type rational = { num : int; (*分子*) den : int (*分母*) }

let sum ({ num = an; den = ad }, { num = bn; den = bd }) =
  let denominator = ad * bd in
  let numerator = (an * denominator / ad) + (bn * denominator / bd) in
  let gcd_num = Number.gcd (numerator, denominator) in
  { num = numerator / gcd_num; den = denominator / gcd_num }
