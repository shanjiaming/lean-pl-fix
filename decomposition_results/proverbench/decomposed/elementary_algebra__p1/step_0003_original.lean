theorem h₃ (P : Polynomial ℤ) (n : ℕ) (hP : ∀ i ∈ Finset.range (n + 1), Polynomial.eval (↑i) P = ↑i % 2) (h : ¬False) (h₂ : ∀ i ∈ Finset.range (n + 1), Polynomial.eval (↑i) P = ↑i % 2) : n = 1 := by
  by_contra h₄
  have h₅ := @hP (Polynomial.X : Polynomial ℤ) 0
  have h₆ := @hP (Polynomial.X : Polynomial ℤ) 1
  have h₇ := @hP (Polynomial.X : Polynomial ℤ) 2
  have h₈ := @hP (Polynomial.X : Polynomial ℤ) 3
  norm_num [Finset.mem_range, Polynomial.eval_X] at h₅ h₆ h₇ h₈ <;> simp_all (config := { decide := true }) <;> omega