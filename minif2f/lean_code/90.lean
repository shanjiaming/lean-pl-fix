import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- If $f(x)=4x^3+1$, find $f^{-1}(33)$. Show that it is 2.-/
theorem mathd_algebra_393 (σ : Equiv ℝ ℝ) (h₀ : ∀ x, σ.1 x = 4 * x ^ 3 + 1) : σ.2 33 = 2 := by
  -- We need to show that the inverse function σ⁻¹ maps 33 to 2
  -- First, let's extract the forward function f from σ
  let f := σ.1
  
  -- The given hypothesis tells us f(x) = 4x³ + 1 for all x
  have hf : ∀ x, f x = 4 * x ^ 3 + 1 := h₀
  
  -- To find f⁻¹(33), we need to find x such that f(x) = 33
  -- Let's set up the equation 4x³ + 1 = 33
  have eq : 4 * (2:ℝ) ^ 3 + 1 = 33 := by
    -- Calculate 2^3 = 8
    have h1 : (2:ℝ) ^ 3 = 8 := by norm_num
    -- Substitute back: 4*8 + 1 = 33
    rw [h1]
    norm_num
  
  -- Now we know f(2) = 33 by the equation above and hf
  have f2 : f 2 = 33 := by rw [hf, eq]
  
  -- Since σ is an equivalence (bijection), the inverse is well-defined
  -- The inverse function property tells us that if f(a) = b, then f⁻¹(b) = a
  -- Therefore, since f(2) = 33, we have f⁻¹(33) = 2
  -- In Lean, σ.2 is the inverse function, so we need to show σ.2 33 = 2
  
  -- Use the fact that σ is an equivalence to relate f and its inverse
  have inv_prop : ∀ x, σ.2 (f x) = x := σ.left_inv x
  
  -- Apply this property at x = 2
  have key : σ.2 (f 2) = 2 := inv_prop 2
  
  -- Now substitute f 2 with 33 using the f2 equality
  rw [f2] at key
  
  -- The key now exactly matches our goal: σ.2 33 = 2
  exact key