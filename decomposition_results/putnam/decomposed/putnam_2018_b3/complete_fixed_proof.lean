theorem putnam_2018_b3 (n : ℕ) (hn : n < 0) :
  (n < 10 ^ 100 ∧ ((n : ℤ) ∣ (2 ^ n : ℤ) ∧ (n - 1 : ℤ) ∣ (2 ^ n - 1 : ℤ) ∧ (n - 2 : ℤ) ∣ (2 ^ n - 2 : ℤ))) ↔
    n ∈ (({2 ^ 2, 2 ^ 4, 2 ^ 16, 2 ^ 256}) : Set ℕ):=
  by
  have h_false : False:= by
    have h₁ : n ≥ 0:= by -- exact Nat.zero_le n
      norm_num
    have h₂ : n.succ ≤ 0:= by -- simpa [Nat.lt_iff_add_one_le] using hn
      linarith
    have h₃ : n.succ > 0 := Nat.succ_pos n
    --  omega
    linarith
  have h_main :
    (n < 10 ^ 100 ∧ ((n : ℤ) ∣ (2 ^ n : ℤ) ∧ (n - 1 : ℤ) ∣ (2 ^ n - 1 : ℤ) ∧ (n - 2 : ℤ) ∣ (2 ^ n - 2 : ℤ))) ↔
      n ∈ (({2 ^ 2, 2 ^ 4, 2 ^ 16, 2 ^ 256}) : Set ℕ) := by sorry
  exact h_main
  hole