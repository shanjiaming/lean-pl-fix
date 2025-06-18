theorem amc12a_2003_p5 (A M C : ℕ) (h₀ : A ≤ 9 ∧ M ≤ 9 ∧ C ≤ 9)
    (h₁ : Nat.ofDigits 10 [0, 1, C, M, A] + Nat.ofDigits 10 [2, 1, C, M, A] = 123422) :
    A + M + C = 14 := by
  have h₂ : A = 6 := by
    have h₂₁ : A ≤ 9 := h₀.1
    have h₂₂ : M ≤ 9 := h₀.2.1
    have h₂₃ : C ≤ 9 := h₀.2.2
    have h₂₄ : Nat.ofDigits 10 [0, 1, C, M, A] = 10 + 100 * C + 1000 * M + 10000 * A := by
      admit
    have h₂₅ : Nat.ofDigits 10 [2, 1, C, M, A] = 12 + 100 * C + 1000 * M + 10000 * A := by
      admit
    rw [h₂₄, h₂₅] at h₁
    have h₂₆ : 10 + 100 * C + 1000 * M + 10000 * A + (12 + 100 * C + 1000 * M + 10000 * A) = 123422 := by
      linarith
    have h₂₇ : 22 + 200 * C + 2000 * M + 20000 * A = 123422 := by
      linarith
    have h₂₈ : 200 * C + 2000 * M + 20000 * A = 123400 := by
      linarith
    have h₂₉ : C + 10 * M + 100 * A = 617 := by
      linarith
    have h₃₀ : A ≥ 1 := by
      by_contra h
      push_neg at h
      have h₃₁ : A = 0 := by
        linarith
      rw [h₃₁] at h₂₉
      have h₃₂ : C + 10 * M = 617 := by
        linarith
      have h₃₃ : C + 10 * M ≤ 99 := by
        have h₃₄ : M ≤ 9 := h₀.2.1
        have h₃₅ : C ≤ 9 := h₀.2.2
        linarith
      linarith
    have h₃₁ : A ≤ 6 := by
      by_contra h
      push_neg at h
      have h₃₂ : A ≥ 7 := by linarith
      have h₃₃ : 100 * A ≥ 700 := by
        linarith
      have h₃₄ : C + 10 * M + 100 * A ≥ 700 := by
        linarith
      have h₃₅ : C + 10 * M + 100 * A = 617 := by
        linarith
      linarith
    omega
  
  have h₃ : M = 1 := by
    have h₃₁ : A ≤ 9 := h₀.1
    have h₃₂ : M ≤ 9 := h₀.2.1
    have h₃₃ : C ≤ 9 := h₀.2.2
    have h₃₄ : Nat.ofDigits 10 [0, 1, C, M, A] = 10 + 100 * C + 1000 * M + 10000 * A := by
      admit9
    have h₃₅ : Nat.ofDigits 10 [2, 1, C, M, A] = 12 + 100 * C + 1000 * M + 10000 * A := by
      admit
    rw [h₃₄, h₃₅] at h₁
    have h₃₆ : 10 + 100 * C + 1000 * M + 10000 * A + (12 + 100 * C + 1000 * M + 10000 * A) = 123422 := by
      linarith
    have h₃₇ : 22 + 200 * C + 2000 * M + 20000 * A = 123422 := by
      linarith
    have h₃₈ : 200 * C + 2000 * M + 20000 * A = 123400 := by
      linarith
    have h₃₉ : C + 10 * M + 100 * A = 617 := by
      linarith
    rw [h₂] at h₃₉
    have h₄₀ : C + 10 * M = 17 := by
      omega
    have h₄₁ : M ≤ 1 := by
      by_contra h
      push_neg at h
      have h₄₂ : M ≥ 2 := by omega
      have h₄₃ : C + 10 * M ≥ 20 := by
        have h₄₄ : C ≥ 0 := by norm_num
        omega
      omega
    omega
  
  have h₄ : C = 7 := by
    have h₄₁ : A ≤ 9 := h₀.1
    have h₄₂ : M ≤ 9 := h₀.2.1
    have h₄₃ : C ≤ 9 := h₀.2.2
    have h₄₄ : Nat.ofDigits 10 [0, 1, C, M, A] = 10 + 100 * C + 1000 * M + 10000 * A := by
      admit
    have h₄₅ : Nat.ofDigits 10 [2, 1, C, M, A] = 12 + 100 * C + 1000 * M + 10000 * A := by
      admit
    rw [h₄₄, h₄₅] at h₁
    have h₄₆ : 10 + 100 * C + 1000 * M + 10000 * A + (12 + 100 * C + 1000 * M + 10000 * A) = 123422 := by
      linarith
    have h₄₇ : 22 + 200 * C + 2000 * M + 20000 * A = 123422 := by
      linarith
    have h₄₈ : 200 * C + 2000 * M + 20000 * A = 123400 := by
      linarith
    have h₄₉ : C + 10 * M + 100 * A = 617 := by
      linarith
    omega
  
  have h₅ : A + M + C = 14 := by
    admit
  
  hole_1
