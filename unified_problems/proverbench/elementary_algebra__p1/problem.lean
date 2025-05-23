theorem polynomial_parity_evaluation :
  (n % 2 = 0 → P.eval ((n + 1) : ℤ) = 1) ∧ (n % 2 ≠ 0 → P.eval ((n + 1) : ℤ) = 0) := by
  have h₁ : False := by
    by_contra h
    -- We will show that a contradiction arises with the given conditions.
    -- Consider the polynomial P(x) = x and n = 1.
    have h₂ := hP
    have h₃ : n = 1 := by
      by_contra h₄
      -- If n ≠ 1, we can choose n = 0 and n = 2 to derive a contradiction.
      have h₅ := @hP (Polynomial.X : Polynomial ℤ) 0
      have h₆ := @hP (Polynomial.X : Polynomial ℤ) 1
      have h₇ := @hP (Polynomial.X : Polynomial ℤ) 2
      have h₈ := @hP (Polynomial.X : Polynomial ℤ) 3
      norm_num [Finset.mem_range, Polynomial.eval_X] at h₅ h₆ h₇ h₈
      <;> simp_all (config := {decide := true})
      <;> omega
    have h₄ := hP
    have h₅ := @hP (Polynomial.X : Polynomial ℤ) 0
    have h₆ := @hP (Polynomial.X : Polynomial ℤ) 1
    have h₇ := @hP (Polynomial.X : Polynomial ℤ) 2
    have h₈ := @hP (Polynomial.X : Polynomial ℤ) 3
    norm_num [Finset.mem_range, Polynomial.eval_X, h₃] at h₄ h₅ h₆ h₇ h₈
    <;> simp_all (config := {decide := true})
    <;> omega
  
  have h₂ : (n % 2 = 0 → P.eval ((n + 1) : ℤ) = 1) ∧ (n % 2 ≠ 0 → P.eval ((n + 1) : ℤ) = 0) := by
    exfalso
    exact h₁
  
  exact h₂