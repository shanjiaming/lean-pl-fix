import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- $
\textbf{(A)}\ 5 \qquad
\textbf{(B)}\ 6 \qquad
\textbf{(C)}\ 7 \qquad
\textbf{(D)}\ 8 \qquad
\textbf{(E)}\ 9 $ Show that it is \textbf{(D)}\ 8.-/
theorem amc12a_2011_p18 (x y : ℝ) (h₀ : abs (x + y) + abs (x - y) = 2) :
  x ^ 2 - 6 * x + y ^ 2 ≤ 8 := by
  -- First, we interpret the given condition |x + y| + |x - y| = 2
  -- This expression represents the sum of Manhattan distances, which for real numbers
  -- equals 2*max(|x|, |y|). Therefore, max(|x|, |y|) = 1.

  -- We can formalize this observation with the following lemma:
  have h₁ : max (|x|) (|y|) = 1 := by
    -- The key property is that for any real numbers a b, |a + b| + |a - b| = 2*max(|a|, |b|)
    -- We can prove this by considering cases based on the signs and magnitudes of a and b
    rw [← abs_add_max]
    exact h₀

  -- From h₁, we know both |x| and |y| are ≤ 1, since max(|x|, |y|) = 1
  have hx : |x| ≤ 1 := le_max_left_of_le h₁.le
  have hy : |y| ≤ 1 := le_max_right_of_le h₁.le

  -- Our goal is to maximize x^2 - 6x + y^2 under the constraints |x| ≤ 1, |y| ≤ 1
  -- Since y^2 is always non-negative, to maximize the expression we should minimize y^2
  -- The minimal y^2 is 0 (when y = 0), so we can focus on maximizing x^2 - 6x

  -- The expression x^2 - 6x is a quadratic function. To find its maximum on [-1, 1]:
  -- The vertex of the parabola is at x = -b/(2a) = 6/2 = 3, but 3 ∉ [-1, 1]
  -- Therefore, the maximum on [-1, 1] occurs at one of the endpoints

  -- Evaluate the expression at the endpoints:
  -- At x = 1: 1 - 6 + y^2 = -5 + y^2 ≤ -5 + 1 = -4 (since y^2 ≤ 1)
  -- At x = -1: 1 + 6 + y^2 = 7 + y^2 ≤ 7 + 1 = 8 (since y^2 ≤ 1)
  -- The maximum value occurs at x = -1, y = ±1, giving value 8

  -- Now we formalize this reasoning:
  -- First, note that y^2 ≤ 1 since |y| ≤ 1
  have y_sq_le : y^2 ≤ 1 := by
    rw [sq_abs]
    exact pow_le_one _ (abs_nonneg _) hy

  -- The expression x^2 - 6x + y^2 ≤ x^2 - 6x + 1 (since y^2 ≤ 1)
  -- So it suffices to show x^2 - 6x + 1 ≤ 8, or equivalently x^2 - 6x - 7 ≤ 0
  -- Let's define f(x) = x^2 - 6x - 7 and show it's ≤ 0 on [-1, 1]

  -- First, compute f at the endpoints:
  have f_at_1 : (1:ℝ)^2 - 6*1 - 7 = -12 := by norm_num
  have f_at_neg1 : (-1:ℝ)^2 - 6*(-1) - 7 = 0 := by norm_num

  -- The derivative f'(x) = 2x - 6 is negative for all x ≤ 3, so f is decreasing on [-1, 1]
  -- Therefore, the maximum of f on [-1, 1] is at x = -1, where f(-1) = 0

  -- Thus, x^2 - 6x - 7 ≤ 0 on [-1, 1], so x^2 - 6x + y^2 ≤ x^2 - 6x + 1 ≤ 7 + 1 = 8
  -- Now we can complete the proof:

  -- Start with the original expression
  calc x^2 - 6*x + y^2
    -- Bound y^2 by 1
    _ ≤ x^2 - 6*x + 1 := add_le_add_left y_sq_le _
    -- Rewrite as (x^2 - 6x - 7) + 8
    _ = (x^2 - 6*x - 7) + 8 := by ring
    -- Now we need to show x^2 - 6x - 7 ≤ 0
    -- Since |x| ≤ 1, and the function is decreasing, its maximum is at x = -1
    _ ≤ 0 + 8 := by
      -- The maximum of x^2 - 6x - 7 on [-1,1] is at x = -1
      have : ∀ x ∈ Set.Icc (-1:ℝ) 1, x^2 - 6*x - 7 ≤ 0 := by
        intro x ⟨hx1, hx2⟩
        -- The function is decreasing on this interval (derivative is negative)
        have deriv : ∀ x ∈ Set.Icc (-1:ℝ) 1, deriv (fun x => x^2 - 6*x - 7) x < 0 := by
          intro x _
          simp [deriv]
          linarith
        -- Therefore the maximum is at the left endpoint x = -1
        have : x^2 - 6*x - 7 ≤ (-1)^2 - 6*(-1) - 7 := by
          apply ConvexOn.le_on_segment'
          · exact fun x _ => DifferentiableAt.differentiableWithinAt (by simp)
          · intro x hx
            apply deriv x hx.1
          · exact ⟨hx1, hx2⟩
          · exact ⟨le_refl _, by linarith⟩
        rw [f_at_neg1] at this
        exact this
      -- Apply this fact using that |x| ≤ 1 implies x ∈ [-1,1]
      have : x ∈ Set.Icc (-1:ℝ) 1 := ⟨neg_le_abs_self x ▸ hx, abs_le.mp hx⟩
      exact add_le_add (this x this) (le_refl _)
    -- Final simplification
    _ = 8 := by simp