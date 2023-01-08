open Hello
open Practice1
open Practice2

let () = Say.hello "Taro";;

(*練習問題 1*)
print_int (Number.squaresum 4) (*1^2+2^2+3^2+4^2=30*);;
print_newline ();;
print_int (Number.fib 6) (*6番目のフィボナッチ数は8*);;
print_newline ();;
print_int (Number.gcd (3355, 2379)) (*3355と2379の最大公約数は61*);;
print_newline ();;
print_int (Number.gcd (3315, 8177)) (*3315と8177の最大公約数は221*);;
print_newline ();;

(*練習問題 2*)
print_float (Circle.area ({ x = 0; y = 0 }, { x = 3; y = 4 })) (*39.25...*);;
print_newline ()

let sum = Rational.sum ({ num = 2; den = 3 }, { num = 5; den = 4 });;

(*23/12*)

print_int sum.num;;
print_string "/";;
print_int sum.den;;
print_newline ()

let sum2 = Rational.sum ({ num = 1; den = 2 }, { num = 2; den = 4 });;

(*1/1*)

print_int sum2.num;;
print_string "/";;
print_int sum2.den;;
print_newline ();;

print_string
  (if Menu.isVeggieDish (Menu.Rice Shake) = true then
   "This is a vegetarian diet"
  else "This is not a vegetarian diet")
(*This is not a vegetarian diet*)
;;

print_newline ()

let menu =
  Menu.Add
    {
      d = Rice Nori;
      next =
        Add
          {
            d = Soup { m = Aka; g = Tofu };
            next = Add { d = PorkCutlet; next = Smile };
          };
    }
;;

print_string
  (if Menu.isVeggieMenu menu then "This is a vegetarian diet"
  else "This is not a vegetarian diet")
(*This is not a vegetarian diet*)
