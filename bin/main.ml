open Hello
open Practice1
open Practice2
open Practice3
open Binary_search_tree
open Tail_recursive_function
open Higher_order_function.Func

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
;;

(*その 3*)
print_newline ();;
print_string Data.show_m_origin;;
print_newline ();;
print_int Data.ref_x;;
print_newline ()

(*二分探索木*)
let t1 = Bst.Branch { left = Leaf; value = 10; right = Leaf }
let t2 = Bst.Branch { left = Leaf; value = 25; right = Leaf }
let t3 = Bst.Branch { left = t1; value = 15; right = t2 }
let t4 = Bst.Branch { left = Leaf; value = 60; right = Leaf }
let t5 = Bst.Branch { left = Leaf; value = 48; right = t4 }
let t6 = Bst.Branch { left = t3; value = 30; right = t5 };;

print_string "Find(25): ";;
print_string (if Bst.find (t6, 25) then "Found 25!" else "Not Found 25!");;
print_newline ();;
print_string "Find(0): ";;
print_string (if Bst.find (t6, 0) then "Found 0!" else "Not Found 0!");;
print_newline ()

let new_t6 = Bst.insert (t6, 1000);;

print_string "Find(1000): ";;
print_string (if Bst.find (t6, 1000) then "Found 1000!" else "Not Found 1000!")
;;
print_newline ();;
print_string "Find(1000): ";;

print_string
  (if Bst.find (new_t6, 1000) then "Found 1000!" else "Not Found 1000!")
;;

print_newline ();;

(*末尾再帰*)
print_int (Rec.sum'' (10, 0));;

(*多相性*)
print_newline ();;
print_int (Poly_bst.size Poly_bst.t16);;
print_string (Poly_bst.string_of_int_tree Poly_bst.t6)

(*高階関数*)
let square n = n * n;;

print_newline ();;
print_int (Func.sigma (square, 20));;
print_newline ();;
print_int (Func.sigma ((fun n -> n * n * n), 20));;

(*カリー化*)
print_newline ();;
print_string (Func.greeting (Male, "Taro"));;
print_newline ();;

print_string
  (let g1 = Func.curried_greeting Female in
   g1 "Goro");

(*2 分木の高階関数*)
print_newline ();
print_string "Find(120): ";
print_string
  (if Bst.find (Func.treemap (fun n -> n * 2) t6, 120) then "Found 120"
  else "Not Found 120");
print_newline ()
(*print_int (Func.treefold 0 (fun l v r -> l + v + r) t6)*)
(*↑ mli で定義していないため公開されない*)
