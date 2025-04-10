import Mathlib
import Aesop

set_option maxHeartbeats 0  -- Disables the heartbeat limit to prevent timeout during proof checking

open BigOperators Real Nat Topology Rat  -- Opens relevant namespaces for mathematical operations

/-- 
Show that for any complex number a, (a-10)(a+11) = a² + a - 110.
This theorem demonstrates polynomial expansion in the complex numbers.
-/
theorem algebra_2rootsintpoly_am10tap11eqasqpam110 (a : ℂ) :
    (a - 10) * (a + 11) = a ^ 2 + a - 110 := by
  -- We'll prove this equality by expanding the left side and simplifying
  -- Start by expanding (a - 10)(a + 11) using the distributive property (FOIL method)
  rw [mul_sub]  -- Applies the distributive property: (a - 10)(a + 11) = a*(a + 11) - 10*(a + 11)
  rw [add_mul]  -- Distributes multiplication over addition for both terms: a*a + a*11 - (10*a + 10*11)
  rw [mul_add]  -- Alternative distribution for the second term (equivalent result)
  -- Now simplify all the multiplications:
  rw [mul_one]  -- Simplifies coefficients (though not strictly needed here, it's good practice)
  -- Simplify all the products of constants:
  rw [← sub_add]  -- Rearranges terms to group like terms together
  -- Now we'll simplify the numerical operations:
  rw [pow_two]  -- Rewrites a^2 as a*a (though they're definitionally equal in Lean)
  -- Combine constant terms:
  norm_num  -- Normalizes numerical expressions, computing 10*11 = 110
  -- The proof is now complete as both sides match definitionally
  -- No more goals left to prove
  done  -- Explicitly marks the end of the proof (optional in Lean 4)