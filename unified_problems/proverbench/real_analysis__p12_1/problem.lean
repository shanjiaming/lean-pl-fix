theorem abs_sin_le_one (x : ℝ) : |Real.sin x| ≤ 1 := by
  have h : -1 ≤ Real.sin x ∧ Real.sin x ≤ 1 := by
    constructor
    · -- Prove -1 ≤ Real.sin x
      exact Real.neg_one_le_sin x
    · -- Prove Real.sin x ≤ 1
      exact Real.sin_le_one x
  
  have h₁ : |Real.sin x| ≤ 1 := by
    -- Use the fact that -1 ≤ Real.sin x ≤ 1 to prove |Real.sin x| ≤ 1
    apply abs_le.mpr
    exact ⟨h.1, h.2⟩
  
  exact h₁