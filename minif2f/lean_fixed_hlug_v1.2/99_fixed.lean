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
  ring