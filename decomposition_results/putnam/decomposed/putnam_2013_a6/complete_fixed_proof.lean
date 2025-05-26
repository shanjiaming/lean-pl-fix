theorem putnam_2013_a6 (w : ℤ → ℤ → ℤ) (A : Finset (ℤ × ℤ) → ℤ)
  (hwn1 : w (-2) (-2) = -1 ∧ w 2 (-2) = -1 ∧ w (-2) 2 = -1 ∧ w 2 2 = -1)
  (hwn2 :
    w (-1) (-2) = -2 ∧
      w 1 (-2) = -2 ∧ w (-2) (-1) = -2 ∧ w 2 (-1) = -2 ∧ w (-2) 1 = -2 ∧ w 2 1 = -2 ∧ w (-1) 2 = -2 ∧ w 1 2 = -2)
  (hw2 : w 0 (-2) = 2 ∧ w (-2) 0 = 2 ∧ w 2 0 = 2 ∧ w 0 2 = 2)
  (hw4 : w (-1) (-1) = 4 ∧ w 1 (-1) = 4 ∧ w (-1) 1 = 4 ∧ w 1 1 = 4)
  (hwn4 : w 0 (-1) = -4 ∧ w (-1) 0 = -4 ∧ w 1 0 = -4 ∧ w 0 1 = -4) (hw12 : w 0 0 = 12)
  (hw0 : ∀ a b : ℤ, (|a| > 2 ∨ |b| > 2) → w a b = 0) (hA : ∀ S, A S = ∑ s in S, ∑ s' in S, w (s - s').1 (s - s').2) :
  ∀ S : Finset (ℤ × ℤ), Nonempty S → A S > 0:=
  by
  have h₁ : ∀ (S : Finset (ℤ × ℤ)), Nonempty S → A S > 0:=
    by
    --  intro S hS
    have h₂ : A S = ∑ s in S, ∑ s' in S, w (s - s').1 (s - s').2 := hA S
    --  rw [h₂]
    have h₃ : ∑ s in S, ∑ s' in S, w (s - s').1 (s - s').2 > 0:=
      by
      have h₄ : ∀ s ∈ S, ∑ s' in S, w (s - s').1 (s - s').2 ≥ 4:=
        by
        --  intro s hs
        have h₅ : ∑ s' in S, w (s - s').1 (s - s').2 ≥ 4:=
          by
          have h₆ : w (s - s).1 (s - s).2 = 12:=
            by
            have h₇ : s - s = (0, 0):= by -- -- ext <;> simp [Prod.ext_iff] <;> ring
              norm_num
            --  rw [h₇]
            --  simp [hw12]
            simpa
          have h₇ : ∑ s' in S, w (s - s').1 (s - s').2 ≥ 12:=
            by
            have h₈ : ∑ s' in S, w (s - s').1 (s - s').2 ≥ w (s - s).1 (s - s).2:= by
              --  apply
              --    Finset.single_le_sum
              --      (fun s' _ =>
              --        by
              --        have h₉ : w (s - s').1 (s - s').2 ≥ -4 :=
              --          by
              --          have h₁₀ : (|(s - s').1| > 2 ∨ |(s - s').2| > 2) → w (s - s').1 (s - s').2 = 0 :=
              --            by
              --            intro h
              --            exact hw0 _ _ h
              --          have h₁₁ : w (s - s').1 (s - s').2 ≥ -4 :=
              --            by
              --            by_cases h₁₂ : |(s - s').1| > 2 ∨ |(s - s').2| > 2
              --            ·
              --              have h₁₃ : w (s - s').1 (s - s').2 = 0 := h₁₀ h₁₂
              --              rw [h₁₃]
              --              norm_num
              --            ·
              --              have h₁₄ : ¬(|(s - s').1| > 2 ∨ |(s - s').2| > 2) := h₁₂
              --              have h₁₅ : |(s - s').1| ≤ 2 := by
              --                by_contra h
              --                have h₁₆ : |(s - s').1| > 2 := by linarith
              --                have h₁₇ : |(s - s').1| > 2 ∨ |(s - s').2| > 2 := Or.inl h₁₆
              --                contradiction
              --              have h₁₆ : |(s - s').2| ≤ 2 := by
              --                by_contra h
              --                have h₁₇ : |(s - s').2| > 2 := by linarith
              --                have h₁₈ : |(s - s').1| > 2 ∨ |(s - s').2| > 2 := Or.inr h₁₇
              --                contradiction
              --              have h₁₇ : (s - s').1 = 0 ∨ (s - s').1 = 1 ∨ (s - s').1 = -1 ∨ (s - s').1 = 2 ∨ (s - s').1 = -2 :=
              --                by
              --                have h₁₈ : |(s - s').1| ≤ 2 := h₁₅
              --                have h₁₉ : (s - s').1 ≤ 2 := by linarith [abs_le.mp h₁₈]
              --                have h₂₀ : (s - s').1 ≥ -2 := by linarith [abs_le.mp h₁₈]
              --                interval_cases (s - s').1 <;> norm_num at h₁₈ ⊢ <;> omega
              --              have h₁₈ : (s - s').2 = 0 ∨ (s - s').2 = 1 ∨ (s - s').2 = -1 ∨ (s - s').2 = 2 ∨ (s - s').2 = -2 :=
              --                by
              --                have h₁₉ : |(s - s').2| ≤ 2 := h₁₆
              --                have h₂₀ : (s - s').2 ≤ 2 := by linarith [abs_le.mp h₁₉]
              --                have h₂₁ : (s - s').2 ≥ -2 := by linarith [abs_le.mp h₁₉]
              --                interval_cases (s - s').2 <;> norm_num at h₁₉ ⊢ <;> omega
              --              rcases h₁₇ with (h₁₉ | h₁₉ | h₁₉ | h₁₉ | h₁₉) <;> rcases h₁₈ with (h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀) <;>
              --                        simp [h₁₉, h₂₀, hwn1, hwn2, hw2, hw4, hwn4, hw12, hw0] at * <;>
              --                      norm_num <;>
              --                    omega <;>
              --                  omega <;>
              --                omega
              --        linarith)
              --      (by simp [hs])
              hole
            --  linarith
            linarith
          --  linarith
          linarith
        --  linarith
        hole
      have h₅ : ∑ s in S, ∑ s' in S, w (s - s').1 (s - s').2 > 0:=
        by
        have h₆ : ∑ s in S, ∑ s' in S, w (s - s').1 (s - s').2 ≥ ∑ s in S, 4:= by
          --  calc
          --    _ ≥ ∑ s in S, ∑ s' in S, w (s - s').1 (s - s').2 := by rfl
          --    _ ≥ ∑ s in S, 4 := by
          --      apply Finset.sum_le_sum
          --      intro s hs
          --      exact h₄ s hs
          hole
        have h₇ : ∑ s in S, (4 : ℤ) = 4 * S.card:= by
          --  simp [mul_comm] <;> ring_nf <;> simp [Finset.sum_const, nsmul_eq_mul, mul_comm] <;> ring_nf
          hole
        have h₈ : ∑ s in S, ∑ s' in S, w (s - s').1 (s - s').2 ≥ 4 * S.card:= by -- linarith
          linarith
        have h₉ : 4 * (S.card : ℤ) > 0:=
          by
          have h₁₀ : S.card > 0:= by
            have h₁₁ : Nonempty S := hS
            have h₁₂ : S.card > 0:= by
              --  apply Finset.card_pos.mpr
              --  exact h₁₁
              hole
            --  exact h₁₂
            linarith
          have h₁₁ : (S.card : ℤ) > 0:= by -- exact_mod_cast h₁₀
            linarith
          --  nlinarith
          linarith
        have h₁₀ : ∑ s in S, ∑ s' in S, w (s - s').1 (s - s').2 > 0:= by -- linarith
          linarith
        --  exact h₁₀
        linarith
      --  exact h₅
      linarith
    --  exact h₃
    hole
  --  exact h₁
  hole