theorem h₃ (p r A B C α β γ : ℝ) (prbound : 0 ≤ p ∧ p ≤ 1 ∧ 0 ≤ r ∧ r ≤ 1) (id1 : ∀ (x y : ℝ), (p * x + (1 - p) * y) ^ 2 = A * x ^ 2 + B * x * y + C * y ^ 2) (id2 : ∀ (x y : ℝ), (p * x + (1 - p) * y) * (r * x + (1 - r) * y) = α * x ^ 2 + β * x * y + γ * y ^ 2) (hA : A = p ^ 2) (hB : B = 2 * p * (1 - p)) (hC : C = (1 - p) ^ 2) (h₁ : p ≤ 1) (h₂ : 0 ≤ p) : max (max A B) C ≥ 4 / 9 := by
  --  by_cases h₄ : p ≤ 1 / 3
  ·
    have h₅ : C ≥ 4 / 9 := by sorry
    have h₅' : max (max A B) C ≥ C := by sorry
  --    linarith
  --  · by_cases h₅ : p ≥ 2 / 3
    ·
      have h₆ : A ≥ 4 / 9 := by sorry
      have h₆' : max (max A B) C ≥ A := by
        apply le_trans _ (le_max_left (max A B) C) <;> simp [h₆] <;> apply le_max_left
  --      linarith
    ·
      have h₆ : B ≥ 4 / 9 := by sorry
      have h₆' : max (max A B) C ≥ B := by sorry
      have h₆' : max (max A B) C ≥ A := by sorry
have h₃ : max (max A B) C ≥ 4 / 9 := by
  by_cases h₄ : p ≤ 1 / 3
  ·
    have h₅ : C ≥ 4 / 9 := by sorry
    have h₅' : max (max A B) C ≥ C := by sorry
    linarith
  · by_cases h₅ : p ≥ 2 / 3
    ·
      have h₆ : A ≥ 4 / 9 := by sorry
      have h₆' : max (max A B) C ≥ A := by
        apply le_trans _ (le_max_left (max A B) C) <;> simp [h₆] <;> apply le_max_left
      linarith
    ·
      have h₆ : B ≥ 4 / 9 := by
        have h₆₁ : B = 2 * p * (1 - p) := hB
        rw [h₆₁]
        have h₆₂ : 1 / 3 ≤ p := by linarith
        have h₆₃ : p ≤ 2 / 3 := by linarith
        have h₆₄ : 0 ≤ p := by linarith
        have h₆₅ : 0 ≤ 1 - p := by linarith
        nlinarith [sq_nonneg (p - 1 / 3), sq_nonneg (p - 2 / 3)]
      have h₆' : max (max A B) C ≥ B := by apply le_trans _ (le_max_right A B) <;> simp [h₆] <;> apply le_max_left
      linarith
  hole