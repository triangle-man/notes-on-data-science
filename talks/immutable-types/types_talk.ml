open Int (* Pay no attention to the man behind the curtain *)


(** Five little programs in OCaml
 *  -----------------------------
 *
 *  1. Introduction
 *  2. Types and programs
 *  3. Advent of Code, 2022, day 1
 *)




 (** Types
     -----
  *)

(* Program 1 *)

(* let add2 x = *)
(*   succ (succ x) *)

(* Program 2 *)

let add2 = (add 2)

type port =
  Port of int

type string_option  =
  | None
  | Some of string

let name_of_port p =
  match p with
  | Port 20 -> Some "FTP"
  | Port 80 -> Some "HTTP"
  | Port _       -> None



 (** Advent of Code puzzle
     ---------------------
 *)

type 'a list =
  | Nil
  | Cons of ('a * 'a list)

(* Program 3 *)

let rec fold f init xs =
  match xs with
  | Nil -> init
  | Cons (x, rest) -> f x (fold f init rest)

let sum = fold add 0








