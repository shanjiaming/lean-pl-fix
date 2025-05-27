theorem h₁₃ (n a b c d e f : ℕ) (h_product : a * b * c * d * e * f = n ^ 5) (h_consecutive : a + 1 = b ∧ b + 1 = c ∧ c + 1 = d ∧ d + 1 = e ∧ e + 1 = f) (h₁ : f = a + 5) (h₂ : a * b * c * d * e * f = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5)) (h : ¬a = 0) (h₄ : a ≥ 1) (h₅ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) = n ^ 5) (h₇ : n ≥ 1) (h₈ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) = n ^ 5) (h₁₀ : 5 ∣ a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5)) (h₁₁ : 5 ∣ n ^ 5) (h₁₂ : 5 ∣ n) : n ^ 5 ≠ a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) :=
  by
  --  intro h
  have h₁₄ : a ≥ 1 := by sorry
  have h₁₅ : n ^ 5 = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := by linarith
  have h₁₆ : 5 ∣ a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := h₁₀
  have h₁₇ : 5 ∣ n ^ 5 := h₁₁
  have h₁₈ : 5 ∣ n := h₁₂
  have h₁₉ : False :=
    by
    have h₂₀ : a ≤ 5 := by
      by_contra h₂₀
      have h₂₁ : a ≥ 6 := by omega
      have h₂₂ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) > n ^ 5 :=
        by
        have h₂₃ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) > n ^ 5 :=
          by
          have h₂₄ : n < a + 3 := by
            by_contra h₂₄
            have h₂₅ : n ≥ a + 3 := by omega
            have h₂₆ : n ^ 5 ≥ (a + 3) ^ 5 := by
              calc
                n ^ 5 ≥ (a + 3) ^ 5 := by exact Nat.pow_le_pow_of_le_left h₂₅ 5
                _ = (a + 3) ^ 5 := by ring
            have h₂₇ : (a + 3) ^ 5 > a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) :=
              by
              have h₂₈ : a ≥ 6 := by omega
              have h₂₉ : (a + 3) ^ 5 > a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := by
                nlinarith [sq_nonneg (a ^ 2), sq_nonneg ((a + 1) ^ 2), sq_nonneg ((a + 2) ^ 2), sq_nonneg ((a + 3) ^ 2),
                    sq_nonneg ((a + 4) ^ 2), sq_nonneg ((a + 5) ^ 2), sq_nonneg (a * (a + 1)), sq_nonneg (a * (a + 2)),
                    sq_nonneg (a * (a + 3)), sq_nonneg (a * (a + 4)), sq_nonneg (a * (a + 5)),
                    sq_nonneg ((a + 1) * (a + 2)), sq_nonneg ((a + 1) * (a + 3)), sq_nonneg ((a + 1) * (a + 4)),
                    sq_nonneg ((a + 1) * (a + 5)), sq_nonneg ((a + 2) * (a + 3)), sq_nonneg ((a + 2) * (a + 4)),
                    sq_nonneg ((a + 2) * (a + 5)), sq_nonneg ((a + 3) * (a + 4)), sq_nonneg ((a + 3) * (a + 5)),
                    sq_nonneg ((a + 4) * (a + 5))] <;>
                  nlinarith
              exact h₂₉
            nlinarith <;> nlinarith
          have h₂₅ : n < a + 3 := by omega
          have h₂₆ : n ^ 5 < (a + 3) ^ 5 := by exact Nat.pow_lt_pow_of_lt_left h₂₅ (by omega)
          have h₂₇ : (a + 3) ^ 5 ≤ a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := by
            nlinarith [sq_nonneg (a ^ 2), sq_nonneg ((a + 1) ^ 2), sq_nonneg ((a + 2) ^ 2), sq_nonneg ((a + 3) ^ 2),
              sq_nonneg ((a + 4) ^ 2), sq_nonneg ((a + 5) ^ 2), sq_nonneg (a * (a + 1)), sq_nonneg (a * (a + 2)),
              sq_nonneg (a * (a + 3)), sq_nonneg (a * (a + 4)), sq_nonneg (a * (a + 5)), sq_nonneg ((a + 1) * (a + 2)),
              sq_nonneg ((a + 1) * (a + 3)), sq_nonneg ((a + 1) * (a + 4)), sq_nonneg ((a + 1) * (a + 5)),
              sq_nonneg ((a + 2) * (a + 3)), sq_nonneg ((a + 2) * (a + 4)), sq_nonneg ((a + 2) * (a + 5)),
              sq_nonneg ((a + 3) * (a + 4)), sq_nonneg ((a + 3) * (a + 5)), sq_nonneg ((a + 4) * (a + 5))]
          nlinarith
        exact h₂₃
      have h₂₄ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) > n ^ 5 := by omega
      omega
    interval_cases a <;> norm_num at h₅ ⊢ <;> (try omega) <;>
      (try {rcases n with (_ | _ | _ | _ | _ | _ | _ | n) <;> norm_num at h₅ ⊢ <;> ring_nf at h₅ ⊢ <;> omega
        })
  exact h₁₉
  hole