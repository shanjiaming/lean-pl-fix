macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem amc12a_2003_p5 (A M C : ℕ) (h₀ : A ≤ 9 ∧ M ≤ 9 ∧ C ≤ 9)
    (h₁ : Nat.ofDigits 10 [0, 1, C, M, A] + Nat.ofDigits 10 [2, 1, C, M, A] = 123422) :
    A + M + C = 14 := by
  have h₂ : A = 6 := by
    have h₂₁ : A ≤ 9 := h₀.1
    have h₂₂ : M ≤ 9 := h₀.2.1
    have h₂₃ : C ≤ 9 := h₀.2.2
    have h₂₄ : Nat.ofDigits 10 [0, 1, C, M, A] = 10 + 100 * C + 1000 * M + 10000 * A := by
      hole_3
    have h₂₅ : Nat.ofDigits 10 [2, 1, C, M, A] = 12 + 100 * C + 1000 * M + 10000 * A := by
      hole_4
    rw [h₂₄, h₂₅] at h₁
    have h₂₆ : 10 + 100 * C + 1000 * M + 10000 * A + (12 + 100 * C + 1000 * M + 10000 * A) = 123422 := by
      hole_5
    have h₂₇ : 22 + 200 * C + 2000 * M + 20000 * A = 123422 := by
      hole_6
    have h₂₈ : 200 * C + 2000 * M + 20000 * A = 123400 := by
      hole_7
    have h₂₉ : C + 10 * M + 100 * A = 617 := by
      hole_8
    have h₃₀ : A ≥ 1 := by
      by_contra h
      push_neg at h
      have h₃₁ : A = 0 := by
        hole_10
      rw [h₃₁] at h₂₉
      have h₃₂ : C + 10 * M = 617 := by
        hole_11
      have h₃₃ : C + 10 * M ≤ 99 := by
        have h₃₄ : M ≤ 9 := h₀.2.1
        have h₃₅ : C ≤ 9 := h₀.2.2
        hole_12
      hole_9
    have h₃₁ : A ≤ 6 := by
      by_contra h
      push_neg at h
      have h₃₂ : A ≥ 7 := by hole_14
      have h₃₃ : 100 * A ≥ 700 := by
        hole_15
      have h₃₄ : C + 10 * M + 100 * A ≥ 700 := by
        hole_16
      have h₃₅ : C + 10 * M + 100 * A = 617 := by
        hole_17
      hole_13
    hole_2
  
  have h₃ : M = 1 := by
    have h₃₁ : A ≤ 9 := h₀.1
    have h₃₂ : M ≤ 9 := h₀.2.1
    have h₃₃ : C ≤ 9 := h₀.2.2
    have h₃₄ : Nat.ofDigits 10 [0, 1, C, M, A] = 10 + 100 * C + 1000 * M + 10000 * A := by
      hole_19
    have h₃₅ : Nat.ofDigits 10 [2, 1, C, M, A] = 12 + 100 * C + 1000 * M + 10000 * A := by
      hole_20
    rw [h₃₄, h₃₅] at h₁
    have h₃₆ : 10 + 100 * C + 1000 * M + 10000 * A + (12 + 100 * C + 1000 * M + 10000 * A) = 123422 := by
      hole_21
    have h₃₇ : 22 + 200 * C + 2000 * M + 20000 * A = 123422 := by
      hole_22
    have h₃₈ : 200 * C + 2000 * M + 20000 * A = 123400 := by
      hole_23
    have h₃₉ : C + 10 * M + 100 * A = 617 := by
      hole_24
    rw [h₂] at h₃₉
    have h₄₀ : C + 10 * M = 17 := by
      hole_25
    have h₄₁ : M ≤ 1 := by
      by_contra h
      push_neg at h
      have h₄₂ : M ≥ 2 := by hole_27
      have h₄₃ : C + 10 * M ≥ 20 := by
        have h₄₄ : C ≥ 0 := by hole_29
        hole_28
      hole_26
    hole_18
  
  have h₄ : C = 7 := by
    have h₄₁ : A ≤ 9 := h₀.1
    have h₄₂ : M ≤ 9 := h₀.2.1
    have h₄₃ : C ≤ 9 := h₀.2.2
    have h₄₄ : Nat.ofDigits 10 [0, 1, C, M, A] = 10 + 100 * C + 1000 * M + 10000 * A := by
      hole_31
    have h₄₅ : Nat.ofDigits 10 [2, 1, C, M, A] = 12 + 100 * C + 1000 * M + 10000 * A := by
      hole_32
    rw [h₄₄, h₄₅] at h₁
    have h₄₆ : 10 + 100 * C + 1000 * M + 10000 * A + (12 + 100 * C + 1000 * M + 10000 * A) = 123422 := by
      hole_33
    have h₄₇ : 22 + 200 * C + 2000 * M + 20000 * A = 123422 := by
      hole_34
    have h₄₈ : 200 * C + 2000 * M + 20000 * A = 123400 := by
      hole_35
    have h₄₉ : C + 10 * M + 100 * A = 617 := by
      hole_36
    hole_30
  
  have h₅ : A + M + C = 14 := by
    hole_37
  
  hole_1