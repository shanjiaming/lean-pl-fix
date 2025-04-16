import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- If $Q = 11-5i$, $E = 11+5i$, and $D = 2i$, find $Q\cdot E \cdot D$. Show that it is 292i.-/
theorem mathd_algebra_192 (q e d : ℂ) (h₀ : q = 11 - 5 * Complex.I) (h₁ : e = 11 + 5 * Complex.I)
    (h₂ : d = 2 * Complex.I) : q * e * d = 292 * Complex.I := by
  -- First, substitute the given values of q, e, and d into the expression q * e * d
  rw [h₀, h₁, h₂]
  -- Now we need to compute (11 - 5i) * (11 + 5i) * (2i)
  
  -- Step 1: Multiply the first two complex numbers (11 - 5i) and (11 + 5i)
  -- This is a difference of squares: (a - b)(a + b) = a² - b²
  -- Here a = 11, b = 5i, so we get 11² - (5i)²
  have step1 : (11 - 5 * Complex.I) * (11 + 5 * Complex.I) = 11^2 - (5 * Complex.I)^2 := by
    rw [npowRec'_succ]
  
  -- Simplify 11² - (5i)²
  -- 11² = 121, (5i)² = 25i² = 25*(-1) = -25 (since i² = -1)
  -- So 11² - (5i)² = 121 - (-25) = 146
  have step2 : 11^2 - (5 * Complex.I)^2 = 146 := by
    simp only [pow_two]
    rw [mul_mul_mul_comm, Complex.I_mul_I]
    simp
    norm_num
  
  -- Combine step1 and step2 to show the product of first two terms is 146
  have step3 : (11 - 5 * Complex.I) * (11 + 5 * Complex.I) = 146 := by
    rw [step1, step2]
  
  -- Now multiply this result by the third term 2i
  -- We have 146 * 2i = 292i
  have step4 : 146 * (2 * Complex.I) = 292 * Complex.I := by
    norm_num
    rw [mul_assoc]
  
  -- Combine all steps to complete the proof
  rw [step3]
  exact step4