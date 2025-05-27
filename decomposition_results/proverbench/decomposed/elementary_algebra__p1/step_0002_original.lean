theorem h₁ (P : Polynomial ℤ) (n : ℕ) (hP : ∀ i ∈ Finset.range (n + 1), Polynomial.eval (↑i) P = ↑i % 2) : False := by
  by_contra h
  have h₂ := hP
  have h₃ : n = 1 := by sorry
  have h₄ := hP
  have h₅ := @hP (Polynomial.X : Polynomial ℤ) 0
  have h₆ := @hP (Polynomial.X : Polynomial ℤ) 1
  have h₇ := @hP (Polynomial.X : Polynomial ℤ) 2
  have h₈ := @hP (Polynomial.X : Polynomial ℤ) 3
  norm_num [Finset.mem_range, Polynomial.eval_X, h₃] at h₄ h₅ h₆ h₇ h₈ <;> simp_all (config := { decide := true }) <;>
    omega