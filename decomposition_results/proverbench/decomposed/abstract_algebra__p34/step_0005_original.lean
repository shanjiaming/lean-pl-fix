theorem h4 (n : ℕ) (x : ℝ) (hx h1 : x = 0) : ∀ k ∈ range (2 * n + 1), ↑(n.choose (k / 2)) * 0 ^ k = if k = 0 then ↑(n.choose 0) else 0 :=
  by
  intro k hk
  have h5 : k < 2 * n + 1 := by sorry
  by_cases hk0 : k = 0
  · rw [hk0]
    norm_num <;> simp_all [Nat.choose_zero_right, Nat.zero_eq] <;> norm_num
  ·
    have h6 : k ≥ 1 := by sorry
    have h7 : (0 : ℝ) ^ k = 0 := by sorry
    rw [h7]
    simp_all [Nat.choose_zero_right, Nat.zero_eq] <;> norm_num <;> aesop