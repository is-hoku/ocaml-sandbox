type furikake = Shake | Katsuo | Nori
type miso = Aka | Shiro | Awase
type gu = Wakame | Tofu | Radish
type dish = PorkCutlet | Soup of { m : miso; g : gu } | Rice of furikake

let isVeggieDish d =
  match d with
  | Soup _ | Rice Nori -> true
  | PorkCutlet | Rice (Shake | Katsuo) -> false

type menu = Smile | Add of { d : dish; next : menu }

let rec isVeggieMenu m =
  match m with
  | Smile -> true
  | Add { d = d1; next = m' } -> isVeggieDish d1 && isVeggieMenu m'
