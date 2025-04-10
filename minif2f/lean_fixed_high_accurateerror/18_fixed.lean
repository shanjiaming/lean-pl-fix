import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Evaluate: $\left( \frac{1}{2} + \frac{1}{3} \right) \left( \frac{1}{2} - \frac{1}{3} \right)$ Show that it is \frac{5}{36}.-/
theorem mathd_algebra_462 : ((1 : ℚ) / 2 + 1 / 3) * (1 / 2 - 1 / 3) = 5 / 36 := by
  -- First, let's simplify the expression by recognizing it as a difference of squares pattern: (a + b)(a - b) = a² - b²
  -- Here, a = 1/2 and b = 1/3
  -- So we can rewrite the original expression as (1/2)² - (1/3)²
  
  -- Step 1: Apply the difference of squares identity
  have h1 : ((1 : ℚ)/2 + 1/3) * (1/2 - 1/3) = (1/2)^2 - (1/3)^2 := by
    -- This follows from the algebraic identity (a + b)(a - b) = a² - b²
    exact sub_eq_add_neg (1/2)^2 (1/3)^2 ▸ (mul_add (1/2) (1/3) (1/2 - 1/3)).symm

  -- Step 2: Compute (1/2)²
  have h2 : (1/2 : ℚ)^2 = 1/4 := by
    -- Squaring a fraction means squaring both numerator and denominator
    -- (1/2)² = (1²)/(2²) = 1/4
    rw [pow_two, mul_rat, one_mul]
    norm_num

  -- Step 3: Compute (1/3)²
  have h3 : (1/3 : ℚ)^2 = 1/9 := by
    -- Similarly, (1/3)² = (1²)/(3²) = 1/9
    rw [pow_two, mul_rat, one_mul]
    norm_num

  -- Step 4: Substitute the squared terms back into the expression
  have h4 : (1/2 : ℚ)^2 - (1/3)^2 = 1/4 - 1/9 := by
    -- Replace (1/2)² with 1/4 and (1/3)² with 1/9
    rw [h2, h3]

  -- Step 5: Find a common denominator (36) for the subtraction
  have h5 : (1/4 : ℚ) - 1/9 = (9 - 4)/36 := by
    -- Convert both fractions to have denominator 36:
    -- 1/4 = 9/36 and 1/9 = 4/36
    -- So 1/4 - 1/9 = 9/36 - 4/36 = (9-4)/36 = 5/36
    rw [sub_eq_add_neg, add_rat, neg_rat]
    -- Find common denominator
    rw [← Rat.div_num_den (1/4), ← Rat.div_num_den (-(1/9))]
    simp only [Rat.num_neg, Rat.den_neg]
    rw [Rat.add_def'' (num := 1) (den := 4) (num := -1) (den := 9)]
    -- Simplify the resulting fraction
    norm_num

  -- Step 6: Simplify the numerator (9 - 4 = 5)
  have h6 : (9 - 4)/36 = 5/36 := by
    -- Direct computation of the numerator
    norm_num

  -- Step 7: Chain all the equalities together to complete the proof
  norm_num