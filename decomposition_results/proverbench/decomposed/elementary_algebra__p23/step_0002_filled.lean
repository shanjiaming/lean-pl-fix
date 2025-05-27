theorem h (i : ℕ) (hi : i ∈ S) : i = 0 ∨ i = 1 ∨ i = 2 ∨ i = 3 :=
  by
  have h₁ : i < 4 := by sorry
  have h₂ : i ≤ 3 := by sorry
  --  --  interval_cases i <;> simp_all (config := { decide := true }) <;> norm_num
  omega