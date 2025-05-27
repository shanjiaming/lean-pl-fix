theorem no_division {x y k m n : PNat}
  (h : ∃ z : PNat, (x : ℕ)^(m : ℕ) + (y : ℕ)^(n : ℕ) = z) :
  ¬((4 * k * x * y - 1) ∣ z) :=