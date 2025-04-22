import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $x$ be a positive real number. Show that $2 - \sqrt{2} \geq 2 - x - \frac{1}{2x}$.-/
theorem algebra_amgm_faxinrrp2msqrt2geq2mxm1div2x :
    ∀ x > 0, 2 - Real.sqrt 2 ≥ 2 - x - 1 / (2 * x) := by
  -- Introduce the positive real number x
  intro x hx
  -- The inequality can be simplified by subtracting 2 from both sides
  -- Original: 2 - √2 ≥ 2 - x - 1/(2x)
  -- Simplified: -√2 ≥ -x - 1/(2x)
  -- Which is equivalent to: x + 1/(2x) ≥ √2
  -- So we'll prove this equivalent inequality instead
  suffices x + 1 / (2 * x) ≥ Real.sqrt 2 by linarith
  -- To prove x + 1/(2x) ≥ √2, we'll use the AM-GM inequality
  -- First, let's rewrite 1/(2x) as (1/2)*(1/x) for clarity