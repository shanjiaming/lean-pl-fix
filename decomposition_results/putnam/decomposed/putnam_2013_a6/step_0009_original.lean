theorem h₈ (w : ℤ → ℤ → ℤ) (A : Finset (ℤ × ℤ) → ℤ) (hwn1 : w (-2) (-2) = -1 ∧ w 2 (-2) = -1 ∧ w (-2) 2 = -1 ∧ w 2 2 = -1) (hwn2 :  w (-1) (-2) = -2 ∧    w 1 (-2) = -2 ∧ w (-2) (-1) = -2 ∧ w 2 (-1) = -2 ∧ w (-2) 1 = -2 ∧ w 2 1 = -2 ∧ w (-1) 2 = -2 ∧ w 1 2 = -2) (hw2 : w 0 (-2) = 2 ∧ w (-2) 0 = 2 ∧ w 2 0 = 2 ∧ w 0 2 = 2) (hw4 : w (-1) (-1) = 4 ∧ w 1 (-1) = 4 ∧ w (-1) 1 = 4 ∧ w 1 1 = 4) (hwn4 : w 0 (-1) = -4 ∧ w (-1) 0 = -4 ∧ w 1 0 = -4 ∧ w 0 1 = -4) (hw12 : w 0 0 = 12) (hw0 : ∀ (a b : ℤ), |a| > 2 ∨ |b| > 2 → w a b = 0) (hA : ∀ (S : Finset (ℤ × ℤ)), A S = ∑ s ∈ S, ∑ s' ∈ S, w (s - s').1 (s - s').2) (S : Finset (ℤ × ℤ)) (hS : Nonempty { x // x ∈ S }) (h₂ : A S = ∑ s ∈ S, ∑ s' ∈ S, w (s - s').1 (s - s').2) (s : ℤ × ℤ) (hs : s ∈ S) (h₆ : w (s - s).1 (s - s).2 = 12) : ∑ s' ∈ S, w (s - s').1 (s - s').2 ≥ w (s - s).1 (s - s).2 := by
  apply
    Finset.single_le_sum
      (fun s' _ =>
        by
        have h₉ : w (s - s').1 (s - s').2 ≥ -4 :=
          by
          have h₁₀ : (|(s - s').1| > 2 ∨ |(s - s').2| > 2) → w (s - s').1 (s - s').2 = 0 :=
            by
            intro h
            exact hw0 _ _ h
          have h₁₁ : w (s - s').1 (s - s').2 ≥ -4 :=
            by
            by_cases h₁₂ : |(s - s').1| > 2 ∨ |(s - s').2| > 2
            ·
              have h₁₃ : w (s - s').1 (s - s').2 = 0 := h₁₀ h₁₂
              rw [h₁₃]
              norm_num
            ·
              have h₁₄ : ¬(|(s - s').1| > 2 ∨ |(s - s').2| > 2) := h₁₂
              have h₁₅ : |(s - s').1| ≤ 2 := by
                by_contra h
                have h₁₆ : |(s - s').1| > 2 := by linarith
                have h₁₇ : |(s - s').1| > 2 ∨ |(s - s').2| > 2 := Or.inl h₁₆
                contradiction
              have h₁₆ : |(s - s').2| ≤ 2 := by
                by_contra h
                have h₁₇ : |(s - s').2| > 2 := by linarith
                have h₁₈ : |(s - s').1| > 2 ∨ |(s - s').2| > 2 := Or.inr h₁₇
                contradiction
              have h₁₇ : (s - s').1 = 0 ∨ (s - s').1 = 1 ∨ (s - s').1 = -1 ∨ (s - s').1 = 2 ∨ (s - s').1 = -2 :=
                by
                have h₁₈ : |(s - s').1| ≤ 2 := h₁₅
                have h₁₉ : (s - s').1 ≤ 2 := by linarith [abs_le.mp h₁₈]
                have h₂₀ : (s - s').1 ≥ -2 := by linarith [abs_le.mp h₁₈]
                interval_cases (s - s').1 <;> norm_num at h₁₈ ⊢ <;> omega
              have h₁₈ : (s - s').2 = 0 ∨ (s - s').2 = 1 ∨ (s - s').2 = -1 ∨ (s - s').2 = 2 ∨ (s - s').2 = -2 :=
                by
                have h₁₉ : |(s - s').2| ≤ 2 := h₁₆
                have h₂₀ : (s - s').2 ≤ 2 := by linarith [abs_le.mp h₁₉]
                have h₂₁ : (s - s').2 ≥ -2 := by linarith [abs_le.mp h₁₉]
                interval_cases (s - s').2 <;> norm_num at h₁₉ ⊢ <;> omega
              rcases h₁₇ with (h₁₉ | h₁₉ | h₁₉ | h₁₉ | h₁₉) <;> rcases h₁₈ with (h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀) <;>
                        simp [h₁₉, h₂₀, hwn1, hwn2, hw2, hw4, hwn4, hw12, hw0] at * <;>
                      norm_num <;>
                    omega <;>
                  omega <;>
                omega
        linarith)
      (by simp [hs])