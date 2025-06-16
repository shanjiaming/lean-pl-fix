theorem putnam_1986_a2
: (Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = ((3) : ℕ )) := by
  have h_main : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = 3 := by
    have h₁ : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = 3 := by
      -- Prove that 3^200 < 10^100 + 3
      have h₂ : (3 : ℕ) ^ 200 < 10 ^ 100 + 3 := by
        norm_num [pow_succ]
        <;>
        decide
      
      -- Prove that the floor is (10^20000 - 3^200) / (10^100 + 3)
      have h₃ : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) := by
        have h₄ : (10 : ℝ) ^ 20000 / (10 ^ 100 + 3) = ((10 : ℝ) ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) + (3 : ℝ) ^ 200 / (10 ^ 100 + 3) := by
          field_simp [add_comm]
          <;> ring_nf
          <;> norm_num
          <;> linarith
        have h₅ : (0 : ℝ) < (3 : ℝ) ^ 200 / (10 ^ 100 + 3) := by positivity
        have h₆ : (3 : ℝ) ^ 200 / (10 ^ 100 + 3) < 1 := by
          have h₇ : (3 : ℝ) ^ 200 < (10 : ℝ) ^ 100 + 3 := by
            norm_num [pow_succ] at h₂ ⊢
            <;>
            linarith
          have h₈ : (0 : ℝ) < (10 : ℝ) ^ 100 + 3 := by positivity
          rw [div_lt_one (by positivity)]
          <;>
          linarith
        have h₇ : (Nat.floor ((10 : ℝ) ^ 20000 / (10 ^ 100 + 3)) : ℝ) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) := by
          rw [h₄]
          have h₈ : (Nat.floor (((10 : ℝ) ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) + (3 : ℝ) ^ 200 / (10 ^ 100 + 3)) : ℝ) = ((10 : ℝ) ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) := by
            rw [Int.floor_eq_iff]
            constructor
            · -- Prove the lower bound
              norm_num at h₅ h₆ ⊢
              <;>
              norm_num [div_eq_mul_inv] at h₅ h₆ ⊢ <;>
              ring_nf at h₅ h₆ ⊢ <;>
              norm_num at h₅ h₆ ⊢ <;>
              linarith
            · -- Prove the upper bound
              norm_num at h₅ h₆ ⊢
              <;>
              norm_num [div_eq_mul_inv] at h₅ h₆ ⊢ <;>
              ring_nf at h₅ h₆ ⊢ <;>
              norm_num at h₅ h₆ ⊢ <;>
              linarith
          rw [h₈]
          <;>
          norm_num
        have h₈ : (Nat.floor ((10 : ℝ) ^ 20000 / (10 ^ 100 + 3)) : ℕ) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) := by
          norm_cast at h₇ ⊢
          <;>
          simp_all [Nat.floor_eq_iff]
          <;>
          norm_num
          <;>
          linarith
        exact h₈
      
      -- Prove that the units digit is 3
      rw [h₃]
      have h₄ : (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) % 10 = 3 := by
        -- Use norm_num to compute the units digit
        rfl
      exact h₄
    exact h₁
  exact h_main