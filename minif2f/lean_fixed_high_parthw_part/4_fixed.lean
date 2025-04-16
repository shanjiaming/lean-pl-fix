import Mathlib
import Aesop

set_option maxHeartbeats 0  -- Disable heartbeat limit to prevent timeout during proof checking

open BigOperators Real Nat Topology Rat  -- Open common mathematical namespaces

/--
Expand the following expression: $7(3y+2)$ Show that it is 21y+14.
This theorem states that for any complex number y, 7 multiplied by (3y + 2) equals 21y + 14.
-/
theorem mathd_algebra_182 (y : ℂ) : 7 * (3 * y + 2) = 21 * y + 14 := by
  -- The proof will use the distributive property of multiplication over addition
  -- First step: Apply the distributive property to multiply 7 across the terms inside the parentheses
  rw [mul_add]  -- Rewrites using the distributive property: a*(b+c) = a*b + a*c

  -- Now we have two multiplication terms: 7 * (3 * y) and 7 * 2
  -- Next step: Simplify both multiplications

  -- First multiplication: 7 * (3 * y) can be rewritten using associativity of multiplication
  rw [<- mul_assoc]

  -- Now we have (7 * 3) * y + 7 * 2
  -- Next step: Compute the constant multiplications

  -- Compute 7 * 3 to get 21
  norm_num  -- Normalizes numerical expressions, computing 7*3 to 21 and 7*2 to 14

  -- After norm_num, the expression is now 21 * y + 14
  -- No further simplification is needed as we've reached the desired form

  -- The proof is complete as both sides of the equation now match