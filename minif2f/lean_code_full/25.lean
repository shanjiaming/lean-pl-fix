import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Determine all values $x$ in the interval $0\leq x\leq 2\pi $ which satisfy the inequality
$2\cos x \leq \left| \sqrt{1+\sin 2x} - \sqrt{1-\sin 2x } \right| \leq \sqrt{2}.$-/
theorem imo_1965_p1 (x : ℝ) (h₀ : 0 ≤ x) (h₁ : x ≤ 2 * Real.pi)
  (h₂ : 2 * Real.cos x ≤ abs (Real.sqrt (1 + Real.sin (2 * x)) - Real.sqrt (1 - Real.sin (2 * x)))
  (h₃ : abs (Real.sqrt (1 + Real.sin (2 * x)) - Real.sqrt (1 - Real.sin (2 * x))) ≤ Real.sqrt 2) :
  Real.pi / 4 ≤ x ∧ x ≤ 7 * Real.pi / 4 := by
  -- First, let's simplify the expression inside the absolute value
  -- Let's denote y = √(1 + sin(2x)) - √(1 - sin(2x))
  -- We'll compute y² to eliminate the square roots
  have y_sq : (Real.sqrt (1 + Real.sin (2 * x)) - Real.sqrt (1 - Real.sin (2 * x))) ^ 2 =
      2 - 2 * Real.sqrt (1 - (Real.sin (2 * x)) ^ 2) := by
    -- Expand the square of the difference
    calc
      _ = (1 + Real.sin (2 * x)) + (1 - Real.sin (2 * x)) - 
            2 * Real.sqrt (1 + Real.sin (2 * x)) * Real.sqrt (1 - Real.sin (2 * x)) := by ring
      _ = 2 - 2 * Real.sqrt ((1 + Real.sin (2 * x)) * (1 - Real.sin (2 * x))) := by 
            rw [Real.sqrt_mul (by linarith) (by linarith)]
      _ = 2 - 2 * Real.sqrt (1 - (Real.sin (2 * x)) ^ 2) := by rw [mul_self_sub_one_sin_sq]

  -- Notice that √(1 - sin²(2x)) = |cos(2x)| by the Pythagorean identity
  have sqrt_identity : Real.sqrt (1 - (Real.sin (2 * x)) ^ 2) = |Real.cos (2 * x)| := by
    rw [Real.sqrt_sq_eq_abs, ← Real.cos_sq', sub_one_neg, neg_sub]
    exact abs_eq_self.mpr (Real.cos_sq_nonneg (2 * x))

  -- Now we can rewrite y² in terms of |cos(2x)|
  have y_sq_rewritten : (Real.sqrt (1 + Real.sin (2 * x)) - Real.sqrt (1 - Real.sin (2 * x))) ^ 2 =
      2 - 2 * |Real.cos (2 * x)| := by rw [y_sq, sqrt_identity]

  -- The original inequalities can now be written in terms of |cos(2x)|
  -- First inequality: 2cos(x) ≤ |y| ≤ √2
  -- From h₃, we have |y| ≤ √2, which gives us:
  have upper_bound : 2 - 2 * |Real.cos (2 * x)| ≤ 2 := by
    have := pow_le_pow_of_le_left (abs_nonneg _) h₃ 2
    simp only [sq_sqrt (by linarith), sq_abs] at this
    rw [y_sq_rewritten] at this
    linarith

  -- From h₂, we have 2cos(x) ≤ |y|, which gives us:
  have lower_bound : 4 * (Real.cos x) ^ 2 ≤ 2 - 2 * |Real.cos (2 * x)| := by
    have := pow_le_pow_of_le_left (abs_nonneg _) h₂ 2
    simp only [sq_abs] at this
    rw [y_sq_rewritten] at this
    exact this

  -- Now we'll use double angle identities to simplify further
  -- Recall that cos(2x) = 2cos²x - 1
  have cos2x_identity : Real.cos (2 * x) = 2 * (Real.cos x) ^ 2 - 1 := by
    rw [Real.cos_two_mul]

  -- Substitute this into our inequalities
  have lower_bound_rewritten : 4 * (Real.cos x) ^ 2 ≤ 2 - 2 * |2 * (Real.cos x) ^ 2 - 1| := by
    rw [cos2x_identity] at lower_bound
    exact lower_bound

  -- To solve this, we'll consider cases based on the sign of 2cos²x - 1
  -- Case 1: 2cos²x - 1 ≥ 0 ↔ cos²x ≥ 1/2 ↔ |cos x| ≥ √2/2
  -- Case 2: 2cos²x - 1 < 0 ↔ cos²x < 1/2 ↔ |cos x| < √2/2

  -- Let's first handle Case 1 where 2cos²x - 1 ≥ 0
  by_cases h_case : 2 * (Real.cos x) ^ 2 - 1 ≥ 0
  · -- In this case, |2cos²x - 1| = 2cos²x - 1
    simp only [abs_of_nonneg h_case] at lower_bound_rewritten
    -- Simplify the inequality
    have case1_ineq : 4 * (Real.cos x) ^ 2 ≤ 2 - 2 * (2 * (Real.cos x) ^ 2 - 1) := by
      exact lower_bound_rewritten
    -- This simplifies to 4cos²x ≤ 4 - 4cos²x ↔ 8cos²x ≤ 4 ↔ cos²x ≤ 1/2
    have case1_result : (Real.cos x) ^ 2 ≤ 1 / 2 := by linarith
    -- But in this case we also have cos²x ≥ 1/2, so cos²x = 1/2
    have case1_eq : (Real.cos x) ^ 2 = 1 / 2 := by
      apply le_antisymm case1_result
      rw [← mul_le_mul_left (zero_lt_two' ℝ)]
      exact h_case
    -- Therefore |cos x| = √2/2
    have case1_cos : |Real.cos x| = Real.sqrt 2 / 2 := by
      rw [eq_comm, ← sqrt_eq_iff_sq_eq] at case1_eq
      · rw [case1_eq, abs_eq_sqrt_sq]
      · positivity
    -- Now we can find the exact values of x
    -- The solutions to |cos x| = √2/2 in [0, 2π] are x = π/4, 3π/4, 5π/4, 7π/4
    -- We need to verify which of these satisfy the original inequality
    have x_values : x = Real.pi / 4 ∨ x = 3 * Real.pi / 4 ∨ x = 5 * Real.pi / 4 ∨ x = 7 * Real.pi / 4 := by
      -- This can be derived from the general solution of cos x = ±√2/2
      sorry  -- In a complete proof, we would enumerate these solutions here
    -- All these values satisfy π/4 ≤ x ≤ 7π/4
    refine' ⟨_, _⟩ <;> aesop  -- Using aesop to handle the case analysis

  · -- Case 2: 2cos²x - 1 < 0
    simp only [abs_of_neg (not_le.mp h_case)] at lower_bound_rewritten
    -- Simplify the inequality
    have case2_ineq : 4 * (Real.cos x) ^ 2 ≤ 2 - 2 * (1 - 2 * (Real.cos x) ^ 2) := by
      exact lower_bound_rewritten
    -- This simplifies to 4cos²x ≤ 4cos²x, which is always true
    -- But we need to find where the original inequality holds
    -- In this case, we need to ensure the upper bound is also satisfied
    -- From y_sq_rewritten and h₃, we have 2 - 2|cos(2x)| ≤ 2
    -- Which is always true since |cos(2x)| ≥ 0
    -- Therefore, in this case, the inequality holds for all x where cos²x < 1/2
    -- However, we also need to satisfy the lower bound 2cos(x) ≤ |y|
    -- After some analysis, we find that in this case, the inequality only holds
    -- when x is in [π/4, 3π/4] ∪ [5π/4, 7π/4], but with cos²x < 1/2
    -- This effectively gives us π/4 < x < 3π/4 or 5π/4 < x < 7π/4
    -- Combined with the equality cases from Case 1, we get π/4 ≤ x ≤ 7π/4
    refine' ⟨_, _⟩
    · -- Show π/4 ≤ x
      -- We know cos²x < 1/2 in this case, and from the bounds we can derive this
      sorry  -- Detailed angle comparison would go here
    · -- Show x ≤ 7π/4
      sorry  -- Detailed angle comparison would go here