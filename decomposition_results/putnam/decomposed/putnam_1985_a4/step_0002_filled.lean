theorem h_a2 (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) : a 2 = 27 :=
  by
  have h1 : a 2 = 3 ^ a 1 := by sorry
  --  --  rw [h1, ha1] <;> norm_num
  hole