import Mathlib

open Set Nat

-- (fun n ↦ (1 : ℚ) / (2 ^ (n - 1)) * (n * (n - 1).choose ⌊n / 2⌋₊))

/--
Evaluate in closed form: $\frac{1}{2^{n-1}} \sum_{k < n/2} (n-2k)*{n \choose k}$.
-/
theorem putnam_1974_a4
    (n : ℕ)
    (hn : 0 < n) :
    (1 : ℚ) / (2 ^ (n - 1)) * ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n - 2 * k) * (n.choose k) =
    ((fun n ↦ (1 : ℚ) / (2 ^ (n - 1)) * (n * (n - 1).choose ⌊n / 2⌋₊)) : ℕ → ℚ ) n := by
  have h_sum : (∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n - 2 * k : ℕ) * (n.choose k) : ℕ) = n * (n - 1).choose ⌊n / 2⌋₊ := by
    have h₁ : ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n - 2 * k : ℕ) * (n.choose k) = n * (n - 1).choose ⌊n / 2⌋₊ := by
      have h₂ : ∀ k : ℕ, k ∈ Finset.Icc 0 ⌊n / 2⌋₊ → (n - 2 * k : ℕ) * (n.choose k) = n * ((n - 1).choose k - (n - 1).choose (k - 1)) := by
        intro k hk
        have h₃ : k ≤ ⌊n / 2⌋₊ := Finset.mem_Icc.mp hk |>.2
        have h₄ : 0 ≤ k := Finset.mem_Icc.mp hk |>.1
        have h₅ : k ≤ n := by
          have h₅₁ : ⌊n / 2⌋₊ ≤ n := by
            have h₅₂ : ⌊n / 2⌋₊ ≤ n := by
              have h₅₃ : ⌊n / 2⌋₊ ≤ n / 2 := by
                exact Nat.floor_le (by omega)
              have h₅₄ : n / 2 ≤ n := by
                omega
              omega
            exact h₅₂
          omega
        have h₆ : (n - 2 * k : ℕ) * (n.choose k) = n * ((n - 1).choose k - (n - 1).choose (k - 1)) := by
          have h₇ : (n - 2 * k : ℕ) * (n.choose k) = n * (n.choose k) - 2 * k * (n.choose k) := by
            have h₇₁ : (n - 2 * k : ℕ) = n - 2 * k := rfl
            rw [h₇₁]
            have h₇₂ : n - 2 * k ≤ n := by omega
            have h₇₃ : n - 2 * k ≥ 0 := by
              have h₇₄ : k ≤ ⌊n / 2⌋₊ := h₃
              have h₇₅ : k ≤ n / 2 := by
                have h₇₆ : ⌊n / 2⌋₊ ≤ n / 2 := Nat.floor_le (by omega)
                omega
              omega
            have h₇₄ : (n - 2 * k : ℕ) * (n.choose k) = (n - 2 * k : ℕ) * (n.choose k) := rfl
            rw [h₇₄]
            have h₇₅ : n * (n.choose k) - 2 * k * (n.choose k) = (n - 2 * k : ℕ) * (n.choose k) := by
              have h₇₆ : n * (n.choose k) - 2 * k * (n.choose k) = (n - 2 * k : ℕ) * (n.choose k) := by
                have h₇₇ : n * (n.choose k) ≥ 2 * k * (n.choose k) := by
                  have h₇₈ : n ≥ 2 * k := by
                    have h₇₉ : k ≤ ⌊n / 2⌋₊ := h₃
                    have h₇₁₀ : k ≤ n / 2 := by
                      have h₇₁₁ : ⌊n / 2⌋₊ ≤ n / 2 := Nat.floor_le (by omega)
                      omega
                    omega
                  have h₇₉ : n.choose k ≥ 0 := by positivity
                  nlinarith
                have h₇₈ : n * (n.choose k) - 2 * k * (n.choose k) = (n - 2 * k : ℕ) * (n.choose k) := by
                  have h₇₉ : n * (n.choose k) - 2 * k * (n.choose k) = (n - 2 * k : ℕ) * (n.choose k) := by
                    rw [Nat.mul_comm]
                    <;>
                    simp [Nat.mul_sub_left_distrib, Nat.mul_sub_right_distrib, Nat.mul_assoc]
                    <;>
                    ring_nf at *
                    <;>
                    omega
                  exact h₇₉
                exact h₇₈
              exact h₇₆
            rw [h₇₅]
          rw [h₇]
          have h₈ : n * (n.choose k) - 2 * k * (n.choose k) = n * ((n - 1).choose k - (n - 1).choose (k - 1)) := by
            have h₉ : n * (n.choose k) - 2 * k * (n.choose k) = (n - 2 * k) * (n.choose k) := by
              have h₉₁ : n * (n.choose k) - 2 * k * (n.choose k) = (n - 2 * k) * (n.choose k) := by
                rw [Nat.mul_comm]
                <;>
                simp [Nat.mul_sub_left_distrib, Nat.mul_sub_right_distrib, Nat.mul_assoc]
                <;>
                ring_nf at *
                <;>
                omega
              exact h₉₁
            rw [h₉]
            have h₁₀ : (n - 2 * k) * (n.choose k) = n * ((n - 1).choose k - (n - 1).choose (k - 1)) := by
              have h₁₁ : (n - 2 * k) * (n.choose k) = n * ((n - 1).choose k - (n - 1).choose (k - 1)) := by
                have h₁₂ : n.choose k = (n - 1).choose k + (n - 1).choose (k - 1) := by
                  cases k with
                  | zero =>
                    simp [Nat.choose_succ_succ]
                  | succ k' =>
                    cases n with
                    | zero =>
                      simp_all [Nat.choose_succ_succ, Nat.div_eq_of_lt]
                      <;> omega
                    | succ n' =>
                      simp_all [Nat.choose_succ_succ, Nat.div_eq_of_lt]
                      <;> ring_nf at *
                      <;> omega
                have h₁₃ : (n - 2 * k) * (n.choose k) = (n - 2 * k) * ((n - 1).choose k + (n - 1).choose (k - 1)) := by
                  rw [h₁₂]
                rw [h₁₃]
                have h₁₄ : (n - 2 * k) * ((n - 1).choose k + (n - 1).choose (k - 1)) = (n - 2 * k) * (n - 1).choose k + (n - 2 * k) * (n - 1).choose (k - 1) := by
                  ring_nf
                  <;>
                  simp [Nat.mul_add, Nat.add_mul]
                  <;>
                  ring_nf at *
                  <;>
                  omega
                rw [h₁₄]
                have h₁₅ : (n - 2 * k) * (n - 1).choose k + (n - 2 * k) * (n - 1).choose (k - 1) = n * ((n - 1).choose k - (n - 1).choose (k - 1)) := by
                  have h₁₆ : k ≤ n := by omega
                  have h₁₇ : k ≤ n - 1 ∨ k = n := by omega
                  cases h₁₇ with
                  | inl h₁₇ =>
                    have h₁₈ : k ≤ n - 1 := h₁₇
                    have h₁₉ : (n - 2 * k) * (n - 1).choose k + (n - 2 * k) * (n - 1).choose (k - 1) = n * ((n - 1).choose k - (n - 1).choose (k - 1)) := by
                      have h₂₀ : (n - 2 * k) * (n - 1).choose k + (n - 2 * k) * (n - 1).choose (k - 1) = (n - 2 * k) * ((n - 1).choose k + (n - 1).choose (k - 1)) := by
                        ring_nf
                        <;>
                        simp [Nat.mul_add, Nat.add_mul]
                        <;>
                        ring_nf at *
                        <;>
                        omega
                      rw [h₂₀]
                      have h₂₁ : (n - 2 * k) * ((n - 1).choose k + (n - 1).choose (k - 1)) = n * ((n - 1).choose k - (n - 1).choose (k - 1)) := by
                        have h₂₂ : (n - 2 * k) * ((n - 1).choose k + (n - 1).choose (k - 1)) = n * ((n - 1).choose k - (n - 1).choose (k - 1)) := by
                          cases k with
                          | zero =>
                            simp [Nat.choose_succ_succ]
                            <;>
                            ring_nf at *
                            <;>
                            omega
                          | succ k' =>
                            cases n with
                            | zero =>
                              simp_all [Nat.choose_succ_succ, Nat.div_eq_of_lt]
                              <;> omega
                            | succ n' =>
                              simp_all [Nat.choose_succ_succ, Nat.div_eq_of_lt]
                              <;> ring_nf at *
                              <;> omega
                        exact h₂₂
                      rw [h₂₁]
                    exact h₁₉
                  | inr h₁₇ =>
                    have h₁₈ : k = n := h₁₇
                    have h₁₉ : (n - 2 * k) * (n - 1).choose k + (n - 2 * k) * (n - 1).choose (k - 1) = n * ((n - 1).choose k - (n - 1).choose (k - 1)) := by
                      have h₂₀ : k = n := h₁₇
                      rw [h₂₀]
                      <;>
                      simp [Nat.choose_succ_succ, Nat.div_eq_of_lt]
                      <;>
                      ring_nf at *
                      <;>
                      omega
                    exact h₁₉
                rw [h₁₅]
              exact h₁₀
            rw [h₁₀]
          rw [h₈]
        exact h₆
      have h₃ : ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n - 2 * k : ℕ) * (n.choose k) = ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n * ((n - 1).choose k - (n - 1).choose (k - 1)) : ℕ) := by
        apply Finset.sum_congr rfl
        intro k hk
        rw [h₂ k hk]
      rw [h₃]
      have h₄ : ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n * ((n - 1).choose k - (n - 1).choose (k - 1)) : ℕ) = n * ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, ((n - 1).choose k - (n - 1).choose (k - 1)) := by
        simp [Finset.mul_sum]
        <;>
        ring_nf
        <;>
        simp [Nat.mul_sub_left_distrib, Nat.mul_sub_right_distrib, Nat.mul_assoc]
        <;>
        ring_nf at *
        <;>
        omega
      rw [h₄]
      have h₅ : ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose ⌊n / 2⌋₊ := by
        have h₅₁ : ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose ⌊n / 2⌋₊ := by
          have h₅₂ : ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose ⌊n / 2⌋₊ := by
            have h₅₃ : ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose ⌊n / 2⌋₊ := by
              -- Use the fact that the sum telescopes to (n - 1).choose ⌊n / 2⌋₊
              have h₅₄ : ∀ m : ℕ, ∑ k in Finset.Icc 0 m, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose m := by
                intro m
                have h₅₅ : ∑ k in Finset.Icc 0 m, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose m := by
                  have h₅₆ : ∑ k in Finset.Icc 0 m, ((n - 1).choose k - (n - 1).choose (k - 1)) = ∑ k in Finset.Icc 0 m, ((n - 1).choose k - (n - 1).choose (k - 1)) := rfl
                  rw [h₅₆]
                  -- Use the fact that the sum telescopes to (n - 1).choose m
                  have h₅₇ : ∑ k in Finset.Icc 0 m, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose m := by
                    -- Use the fact that the sum telescopes to (n - 1).choose m
                    have h₅₈ : ∑ k in Finset.Icc 0 m, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose m := by
                      -- Use the fact that the sum telescopes to (n - 1).choose m
                      have h₅₉ : ∑ k in Finset.Icc 0 m, ((n - 1).choose k - (n - 1).choose (k - 1)) = ∑ k in Finset.Icc 0 m, ((n - 1).choose k - (n - 1).choose (k - 1)) := rfl
                      rw [h₅₉]
                      -- Use the fact that the sum telescopes to (n - 1).choose m
                      have h₆₀ : ∑ k in Finset.Icc 0 m, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose m := by
                        -- Use the fact that the sum telescopes to (n - 1).choose m
                        have h₆₁ : ∀ m : ℕ, ∑ k in Finset.Icc 0 m, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose m := by
                          intro m
                          induction m with
                          | zero =>
                            simp [Nat.choose_succ_succ]
                          | succ m ih =>
                            rw [Finset.sum_Icc_succ_top (by omega : 0 ≤ m.succ)]
                            simp_all [Nat.choose_succ_succ, Nat.sub_sub, Nat.add_sub_assoc]
                            <;>
                            ring_nf at *
                            <;>
                            omega
                        exact h₆₁ m
                      exact h₆₀
                    exact h₅₈
                  exact h₅₇
                exact h₅₅
              have h₅₆ : ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose ⌊n / 2⌋₊ := by
                have h₅₇ : ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, ((n - 1).choose k - (n - 1).choose (k - 1)) = (n - 1).choose ⌊n / 2⌋₊ := by
                  apply h₅₄
                exact h₅₇
              exact h₅₆
            exact h₅₃
          exact h₅₂
        exact h₅₁
      rw [h₅]
      <;>
      simp [Nat.mul_comm]
      <;>
      ring_nf at *
      <;>
      omega
    exact h₁
  
  have h_main : (1 : ℚ) / (2 ^ (n - 1)) * ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n - 2 * k) * (n.choose k) = (1 : ℚ) / (2 ^ (n - 1)) * (n * (n - 1).choose ⌊n / 2⌋₊) := by
    have h₁ : (∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n - 2 * k : ℕ) * (n.choose k) : ℕ) = n * (n - 1).choose ⌊n / 2⌋₊ := h_sum
    have h₂ : (∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n - 2 * k) * (n.choose k) : ℚ) = (n * (n - 1).choose ⌊n / 2⌋₊ : ℚ) := by
      norm_cast at h₁ ⊢
      <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_mul, Nat.cast_sub, Nat.cast_one]
      <;> ring_nf at *
      <;> norm_num at *
      <;> linarith
    rw [h₂]
    <;> ring_nf
    <;> field_simp
    <;> norm_cast
    <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_mul, Nat.cast_sub, Nat.cast_one]
    <;> ring_nf at *
    <;> norm_num at *
    <;> linarith
  
  have h_final : (1 : ℚ) / (2 ^ (n - 1)) * ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n - 2 * k) * (n.choose k) = ((fun n ↦ (1 : ℚ) / (2 ^ (n - 1)) * (n * (n - 1).choose ⌊n / 2⌋₊)) : ℕ → ℚ ) n := by
    rw [h_main]
    <;> simp [Function.funext_iff]
    <;> norm_num
    <;> ring_nf
    <;> field_simp
    <;> norm_cast
    <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_mul, Nat.cast_sub, Nat.cast_one]
    <;> ring_nf at *
    <;> norm_num at *
    <;> linarith
  
  exact h_final