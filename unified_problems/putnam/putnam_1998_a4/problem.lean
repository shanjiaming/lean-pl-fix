def Nat.ofDigits (b : ℕ) (L : List ℕ) : ℕ :=
  L.foldr (fun x y => x + b * y) 0