open Hello
open Practice1

let () = Say.hello "Taro";;

print_int (Number.squaresum 4) (*1^2+2^2+3^2+4^2=30*);;
print_newline ();;
print_int (Number.fib 6) (*6番目のフィボナッチ数は8*);;
print_newline ();;
print_int (Number.gcd (3355, 2379)) (*3355と2379の最大公約数は61*);;
print_newline ();;
print_int (Number.gcd (3315, 8177)) (*3315と8177の最大公約数は221*)
