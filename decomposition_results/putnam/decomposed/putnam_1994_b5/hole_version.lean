macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)

theorem putnam_1994_b5
  (n : ℕ) (hn : n > 0)
  (f : ℝ → ℤ → ℤ)
  (hf : ∀ (α : ℝ) (x : ℤ), f α x = Int.floor (α * x)) :
  ∃ α : ℝ,
    ∀ k ∈ Set.Icc 1 n,
      ((f α)^[k] (n ^ 2) = n ^ 2 - k) ∧
      (f (α ^ k) (n ^ 2) = n ^ 2 - k) := by
  have h_main : ∃ (α : ℝ), ∀ k ∈ Set.Icc 1 n, ((f α)^[k] (n ^ 2) = n ^ 2 - k) ∧ (f (α ^ k) (n ^ 2) = n ^ 2 - k) := by
    use (1 - 1 / (n ^ 2 : ℝ))
    intro k hk
    have h₁ : 1 ≤ (k : ℕ) := by
      hole_1
    have h₂ : (k : ℕ) ≤ n := by
      hole_2
    have h₃ : 0 < (n : ℕ) := by hole_3
    have h₄ : 0 < (n : ℝ) := by hole_4
    have h₅ : 0 < (n : ℝ) ^ 2 := by hole_5
    have h₆ : (1 : ℝ) - 1 / (n ^ 2 : ℝ) < 1 := by
      have h₆₁ : (0 : ℝ) < 1 / (n ^ 2 : ℝ) := by hole_6
      hole_7
    have h₇ : ∀ m : ℕ, m ≤ n → ((f (1 - 1 / (n ^ 2 : ℝ)))^[m] (n ^ 2) = n ^ 2 - m) := by
      intro m hm
      have h₇₁ : m ≤ n := hm
      have h₇₂ : ∀ l : ℕ, l ≤ n → ((f (1 - 1 / (n ^ 2 : ℝ)))^[l] (n ^ 2) = n ^ 2 - l) := by
        intro l hl
        induction' l with l ih
        · simp [Function.iterate_zero_apply]
        · have h₇₃ : l ≤ n := by hole_8
          have h₇₄ : ((f (1 - 1 / (n ^ 2 : ℝ)))^[l] (n ^ 2) = n ^ 2 - l) := ih h₇₃
          have h₇₅ : ((f (1 - 1 / (n ^ 2 : ℝ)))^[l.succ] (n ^ 2) = (f (1 - 1 / (n ^ 2 : ℝ)) ((f (1 - 1 / (n ^ 2 : ℝ)))^[l] (n ^ 2))) := by
            simp [Function.iterate_succ_apply']
          rw [h₇₅, h₇₄]
          have h₇₆ : (f (1 - 1 / (n ^ 2 : ℝ)) ((n ^ 2 : ℤ) - l)) = (n ^ 2 : ℤ) - l - 1 := by
            have h₇₇ : (f (1 - 1 / (n ^ 2 : ℝ)) ((n ^ 2 : ℤ) - l)) = Int.floor ((1 - 1 / (n ^ 2 : ℝ)) * ((n ^ 2 : ℤ) - l : ℝ)) := by
              rw [hf]
              <;> simp [Int.cast_sub, Int.cast_pow]
            rw [h₇₇]
            have h₇₈ : (Int.floor ((1 - 1 / (n ^ 2 : ℝ)) * ((n ^ 2 : ℤ) - l : ℝ)) : ℤ) = (n ^ 2 : ℤ) - l - 1 := by
              have h₇₉ : ((n ^ 2 : ℝ) - l : ℝ) = (n ^ 2 : ℝ) - l := by simp
              rw [h₇₉]
              have h₇₁₀ : (1 - 1 / (n ^ 2 : ℝ)) * ((n ^ 2 : ℝ) - l) = (n ^ 2 : ℝ) - l - 1 + (l : ℝ) / (n ^ 2 : ℝ) := by
                field_simp
                <;> ring_nf
                <;> field_simp
                <;> ring_nf
                <;> nlinarith
              rw [h₇₁₀]
              have h₇₁₁ : (Int.floor ((n ^ 2 : ℝ) - l - 1 + (l : ℝ) / (n ^ 2 : ℝ)) : ℤ) = (n ^ 2 : ℤ) - l - 1 := by
                have h₇₁₂ : (l : ℝ) / (n ^ 2 : ℝ) < 1 := by
                  have h₇₁₃ : (l : ℝ) ≤ (n : ℝ) := by exact_mod_cast (by linarith)
                  have h₇₁₄ : (l : ℝ) / (n ^ 2 : ℝ) < 1 := by
                    have h₇₁₅ : (l : ℝ) < (n : ℝ) + 1 := by
                      have h₇₁₆ : (l : ℕ) ≤ n := by linarith
                      have h₇₁₇ : (l : ℝ) ≤ (n : ℝ) := by exact_mod_cast h₇₁₆
                      linarith
                    have h₇₁₈ : (l : ℝ) / (n ^ 2 : ℝ) < 1 := by
                      have h₇₁₉ : (l : ℝ) < (n : ℝ) + 1 := h₇₁₅
                      have h₇₂₀ : (n : ℝ) > 0 := by positivity
                      have h₇₂₁ : (l : ℝ) / (n ^ 2 : ℝ) < 1 := by
                        rw [div_lt_one (by positivity)]
                        have h₇₂₂ : (l : ℝ) ≤ (n : ℝ) := by exact_mod_cast (by linarith)
                        nlinarith
                      exact h₇₂₁
                    exact h₇₁₈
                  exact h₇₁₄
                have h₇₂₃ : (n ^ 2 : ℝ) - l - 1 + (l : ℝ) / (n ^ 2 : ℝ) < (n ^ 2 : ℝ) - l := by
                  linarith
                have h₇₂₄ : (n ^ 2 : ℝ) - l - 1 ≤ (n ^ 2 : ℝ) - l - 1 + (l : ℝ) / (n ^ 2 : ℝ) := by
                  have h₇₂₅ : 0 ≤ (l : ℝ) / (n ^ 2 : ℝ) := by positivity
                  linarith
                have h₇₂₆ : Int.floor ((n ^ 2 : ℝ) - l - 1 + (l : ℝ) / (n ^ 2 : ℝ)) = (n ^ 2 : ℤ) - l - 1 := by
                  rw [Int.floor_eq_iff]
                  constructor
                  · 
                    norm_num at h₇₂₄ h₇₂₃ ⊢
                    <;>
                    (try norm_num) <;>
                    (try ring_nf at h₇₂₄ h₇₂₃ ⊢) <;>
                    (try norm_num at h₇₂₄ h₇₂₃ ⊢) <;>
                    (try linarith) <;>
                    (try ring_nf) <;>
                    (try norm_num) <;>
                    (try linarith)
                  · 
                    norm_num at h₇₂₄ h₇₂₃ ⊢
                    <;>
                    (try norm_num) <;>
                    (try ring_nf at h₇₂₄ h₇₂₃ ⊢) <;>
                    (try norm_num at h₇₂₄ h₇₂₃ ⊢) <;>
                    (try linarith) <;>
                    (try ring_nf) <;>
                    (try norm_num) <;>
                    (try linarith)
                rw [h₇₂₆]
                <;> simp [Int.cast_sub, Int.cast_pow]
              <;> norm_num at h₇₁₂ ⊢ <;> linarith
            rw [h₇₁₁]
            <;> simp [Int.cast_sub, Int.cast_pow]
          rw [h₇₆]
          <;> simp [Int.cast_sub, Int.cast_pow]
          <;> ring_nf at *
          <;> norm_num at *
          <;> linarith
      have h₇₇ : m ≤ n := hm
      have h₇₈ : ((f (1 - 1 / (n ^ 2 : ℝ)))^[m] (n ^ 2) = n ^ 2 - m) := h₇₂ m h₇₇
      exact h₇₈
    have h₈ : ((f (1 - 1 / (n ^ 2 : ℝ)))^[k] (n ^ 2) = n ^ 2 - k) := by
      have h₈₁ : (k : ℕ) ≤ n := by exact_mod_cast h₂
      have h₈₂ : ((f (1 - 1 / (n ^ 2 : ℝ)))^[k] (n ^ 2) = n ^ 2 - k) := h₇ k h₈₁
      exact h₈₂
    have h₉ : (f ((1 - 1 / (n ^ 2 : ℝ)) ^ k) (n ^ 2) = n ^ 2 - k) := by
      have h₉₁ : (f ((1 - 1 / (n ^ 2 : ℝ)) ^ k) (n ^ 2) = Int.floor (((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ))) := by
        rw [hf]
        <;> simp [Int.cast_pow]
      rw [h₉₁]
      have h₉₂ : (Int.floor (((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ)) : ℤ) = (n ^ 2 : ℤ) - k := by
        have h₉₃ : (n ^ 2 : ℝ) - k ≤ ((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ) := by
          have h₉₄ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) ≥ (1 - (k : ℝ) / (n ^ 2 : ℝ)) := by
            have h₉₅ : (1 - 1 / (n ^ 2 : ℝ)) ^ k ≥ 1 - (k : ℝ) / (n ^ 2 : ℝ) := by
              
              have h₉₆ : (1 - 1 / (n ^ 2 : ℝ)) ^ k ≥ 1 - (k : ℝ) / (n ^ 2 : ℝ) := by
                have h₉₇ : (0 : ℝ) ≤ 1 / (n ^ 2 : ℝ) := by positivity
                have h₉₈ : (1 : ℝ) / (n ^ 2 : ℝ) ≤ 1 := by
                  have h₉₉ : (n : ℝ) ≥ 1 := by
                    exact_mod_cast Nat.one_le_iff_ne_zero.mpr (by omega)
                  have h₉₁₀ : (1 : ℝ) / (n ^ 2 : ℝ) ≤ 1 := by
                    rw [div_le_iff (by positivity)]
                    have h₉₁₁ : (n : ℝ) ^ 2 ≥ 1 := by
                      nlinarith
                    nlinarith
                  exact h₉₁₀
                
                exact?
              exact h₉₆
            exact h₉₅
          have h₉₉ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ) ≥ (1 - (k : ℝ) / (n ^ 2 : ℝ)) * (n ^ 2 : ℝ) := by
            exact mul_le_mul_of_nonneg_right h₉₄ (by positivity)
          have h₉₁₀ : (1 - (k : ℝ) / (n ^ 2 : ℝ)) * (n ^ 2 : ℝ) = (n ^ 2 : ℝ) - k := by
            field_simp
            <;> ring_nf
            <;> field_simp
            <;> ring_nf
            <;> nlinarith
          have h₉₁₁ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ) ≥ (n ^ 2 : ℝ) - k := by
            linarith
          linarith
        have h₉₄ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ) < (n ^ 2 : ℝ) - k + 1 := by
          have h₉₅ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) < 1 := by
            have h₉₆ : (1 - 1 / (n ^ 2 : ℝ)) < 1 := by
              have h₉₇ : (0 : ℝ) < 1 / (n ^ 2 : ℝ) := by positivity
              linarith
            have h₉₈ : (0 : ℝ) < 1 - 1 / (n ^ 2 : ℝ) := by
              have h₉₉ : (1 : ℝ) / (n ^ 2 : ℝ) < 1 := by
                have h₉₁₀ : (n : ℝ) ≥ 1 := by
                  exact_mod_cast Nat.one_le_iff_ne_zero.mpr (by omega)
                have h₉₁₁ : (1 : ℝ) / (n ^ 2 : ℝ) < 1 := by
                  rw [div_lt_one (by positivity)]
                  have h₉₁₂ : (n : ℝ) ^ 2 ≥ 1 := by
                    nlinarith
                  nlinarith
                exact h₉₁₁
              linarith
            have h₉₉ : (1 - 1 / (n ^ 2 : ℝ)) ^ k < 1 := by
              exact pow_lt_one (by linarith) (by linarith) (by
                have h₁₀₀ : (k : ℕ) ≥ 1 := by
                  exact_mod_cast h₁
                omega)
            exact h₉₉
          have h₉₁₀ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ) < 1 * (n ^ 2 : ℝ) := by
            exact mul_lt_mul_of_pos_right h₉₅ (by positivity)
          have h₉₁₁ : 1 * (n ^ 2 : ℝ) = (n ^ 2 : ℝ) := by ring
          have h₉₁₂ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ) < (n ^ 2 : ℝ) := by
            linarith
          have h₉₁₃ : (n ^ 2 : ℝ) - k + 1 > (n ^ 2 : ℝ) - k := by
            linarith
          have h₉₁₄ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ) < (n ^ 2 : ℝ) - k + 1 := by
            have h₉₁₅ : (k : ℝ) ≥ 1 := by
              exact_mod_cast h₁
            have h₉₁₆ : (n : ℝ) ≥ 1 := by
              exact_mod_cast Nat.one_le_iff_ne_zero.mpr (by omega)
            have h₉₁₇ : (n : ℝ) ^ 2 ≥ 1 := by
              nlinarith
            have h₉₁₈ : (k : ℝ) ≤ (n : ℝ) := by
              exact_mod_cast h₂
            have h₉₁₉ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ) < (n ^ 2 : ℝ) - k + 1 := by
              have h₉₂₀ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ) < (n ^ 2 : ℝ) := by
                linarith
              have h₉₂₁ : (n ^ 2 : ℝ) - k + 1 > (n ^ 2 : ℝ) - k := by linarith
              have h₉₂₂ : ((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ) < (n ^ 2 : ℝ) - k + 1 := by
                nlinarith
              exact h₉₂₂
            exact h₉₁₉
          exact h₉₁₄
        have h₉₅ : (Int.floor (((1 - 1 / (n ^ 2 : ℝ)) ^ k) * (n ^ 2 : ℝ)) : ℤ) = (n ^ 2 : ℤ) - k := by
          rw [Int.floor_eq_iff]
          constructor
          · 
            norm_num at h₉₃ h₉₄ ⊢
            <;>
            (try norm_num) <;>
            (try ring_nf at h₉₃ h₉₄ ⊢) <;>
            (try norm_num at h₉₃ h₉₄ ⊢) <;>
            (try linarith) <;>
            (try ring_nf) <;>
            (try norm_num) <;>
            (try linarith)
          · 
            norm_num at h₉₃ h₉₄ ⊢
            <;>
            (try norm_num) <;>
            (try ring_nf at h₉₃ h₉₄ ⊢) <;>
            (try norm_num at h₉₃ h₉₄ ⊢) <;>
            (try linarith) <;>
            (try ring_nf) <;>
            (try norm_num) <;>
            (try linarith)
        rw [h₉₅]
        <;> simp [Int.cast_sub, Int.cast_pow]
      rw [h₉₂]
      <;> simp [Int.cast_sub, Int.cast_pow]
    exact ⟨h₈, h₉⟩
  exact h_main