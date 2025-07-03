import Mathlib

open Set Real

-- 7 / 4
/--
Find
\[
\sum_{i=1}^{\infty} \sum_{j=1}^{\infty} \frac{1}{i^2j + 2ij + ij^2}.
\]
-/
theorem putnam_1978_b2
: (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2) = ((7 / 4) : ℚ )) := by
  have h_main : (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2)) = (7 / 4 : ℚ) := by
    -- We will compute the sum step by step using the given approach.
    have h₁ : (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2)) = (7 / 4 : ℚ) := by
      -- We use the fact that the sum can be computed using the given approach.
      have h₂ : (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2)) = (7 / 4 : ℚ) := by
        -- We use the fact that the sum can be computed using the given approach.
        rw [tsum_congr (fun i ↦ by
          rw [tsum_congr (fun j ↦ by
            have h₃ : (i : ℚ) ^ 2 * j + 2 * i * j + i * j ^ 2 = i * j * (i + j + 2) := by
              ring_nf
              <;> simp [mul_assoc, mul_comm, mul_left_comm]
              <;> ring_nf
              <;> norm_cast
              <;> simp [Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat]
              <;> ring_nf
            rw [h₃]
            <;> field_simp
            <;> ring_nf
            <;> simp [mul_assoc, mul_comm, mul_left_comm]
            <;> ring_nf
            <;> norm_cast
            <;> simp [Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat]
            <;> ring_nf
          )]
        )]
        -- We use the fact that the sum can be computed using the given approach.
        <;> norm_num
        <;> rfl
      -- We use the fact that the sum can be computed using the given approach.
      exact h₂
    -- We use the fact that the sum can be computed using the given approach.
    exact h₁
  -- We use the fact that the sum can be computed using the given approach.
  exact h_main