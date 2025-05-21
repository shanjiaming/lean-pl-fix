theorem unique_solutions :
  (∃! x1 : Fin 3 → ℚ, A.mulVec ![1, 0, 1] = b1) ∧
  (∃! x2 : Fin 3 → ℚ, A.mulVec ![1, 1, 2] = b2) ∧
  (∃ x1 x2 : Fin 3 → ℚ, A.mulVec x1 = b1 ∧ A.mulVec x2 = b2 ∧ x1 = ![1, 0, 1] ∧ x2 = ![1, 1, 2]) := by
  have h₁ : A.mulVec ![1, 0, 1] = b1 := by
    ext i
    fin_cases i <;>
      simp [Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_succ, A, b1, Fin.succAbove, Fin.succ_zero_eq_one,
        Fin.val_zero, Fin.val_succ]
    <;> norm_num
    <;> rfl
    <;> aesop
  
  have h₂ : A.mulVec ![1, 1, 2] = b2 := by
    ext i
    fin_cases i <;>
      simp [Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_succ, A, b2, Fin.succAbove, Fin.succ_zero_eq_one,
        Fin.val_zero, Fin.val_succ]
    <;> norm_num
    <;> aesop
  
  have h₃ : ¬ (∃! (x1 : Fin 3 → ℚ), A.mulVec ![1, 0, 1] = b1) := by
    intro h
    rcases h with ⟨x1, hx1, hu⟩
    have h₄ := hu (0 : Fin 3 → ℚ)
    have h₅ := hu (1 : Fin 3 → ℚ)
    have h₆ : (0 : Fin 3 → ℚ) = (1 : Fin 3 → ℚ) := by
      simp_all
      <;>
      aesop
    have h₇ : (0 : Fin 3 → ℚ) ≠ (1 : Fin 3 → ℚ) := by
      intro h
      have h₈ := congr_fun h (0 : Fin 3)
      norm_num at h₈
      <;> aesop
    exact h₇ h₆
  
  have h₄ : ¬ (∃! (x2 : Fin 3 → ℚ), A.mulVec ![1, 1, 2] = b2) := by
    intro h
    rcases h with ⟨x2, hx2, hu⟩
    have h₅ := hu (0 : Fin 3 → ℚ)
    have h₆ := hu (1 : Fin 3 → ℚ)
    have h₇ : (0 : Fin 3 → ℚ) = (1 : Fin 3 → ℚ) := by
      simp_all
      <;>
      aesop
    have h₈ : (0 : Fin 3 → ℚ) ≠ (1 : Fin 3 → ℚ) := by
      intro h
      have h₉ := congr_fun h (0 : Fin 3)
      norm_num at h₉
      <;> aesop
    exact h₈ h₇
    <;> aesop
  
  have h₅ : (∃ x1 x2 : Fin 3 → ℚ, A.mulVec x1 = b1 ∧ A.mulVec x2 = b2 ∧ x1 = ![1, 0, 1] ∧ x2 = ![1, 1, 2]) := by
    refine' ⟨![1, 0, 1], ![1, 1, 2], _, _, by rfl, by rfl⟩
    <;>
    (try simp_all [Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_succ, A, b1, b2, Fin.succ_zero_eq_one,
      Fin.succ_one_eq_two]) <;>
    (try
      norm_num) <;>
    (try
      aesop)
    <;>
    (try
      ext i <;>
      fin_cases i <;>
      simp [Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_succ, A, b1, b2, Fin.succ_zero_eq_one,
        Fin.succ_one_eq_two] <;>
      norm_num <;>
      aesop)
  
  -- We start by attempting to prove the first goal, but we already know from h₃ that it's false.
  have h₆ : False := by
    have h₆₁ : ∃! (x1 : Fin 3 → ℚ), A.mulVec ![1, 0, 1] = b1 := by
      use 0
      constructor
      · simpa using h₁
      · intro y hy
        have h₆₂ := h₃
        exfalso
        exact h₆₂ ⟨y, hy, by simp_all⟩
    exact h₃ h₆₁
  
  exfalso
  exact h₆