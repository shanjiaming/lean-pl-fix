import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the least possible value of $(xy-1)^2+(x+y)^2$ for real numbers $x$ and $y$?

$\textbf{(A)} ~0\qquad\textbf{(B)} ~\frac{1}{4}\qquad\textbf{(C)} ~\frac{1}{2} \qquad\textbf{(D)} ~1 \qquad\textbf{(E)} ~2$ -/
theorem amc12a_2021_p7 (x y : ℝ) : 1 ≤ (x * y - 1) ^ 2 + (x + y) ^ 2 := by
  -- Our strategy is to find the minimum value of the expression (xy-1)² + (x+y)²
  -- First, let's simplify the expression by expanding both terms
  
  -- Expand (xy - 1)² to x²y² - 2xy + 1
  -- Expand (x + y)² to x² + 2xy + y²
  -- So the expression becomes x²y² - 2xy + 1 + x² + 2xy + y²
  -- The -2xy and +2xy terms cancel out, leaving x²y² + x² + y² + 1
  
  -- Now we can rewrite the expression as:
  -- x²y² + x² + y² + 1 = x²y² + x² + y² + 1 = x²(y² + 1) + (y² + 1) = (x² + 1)(y² + 1)
  -- However, this doesn't directly help us find the minimum
  
  -- Alternative approach: Let's consider substitution
  -- Let s = x + y and p = xy (elementary symmetric polynomials)
  -- Then our expression becomes (p - 1)² + s²
  
  -- We know that for real x, y, s² ≥ 4p (from the inequality (x+y)² ≥ 4xy)
  -- So we can consider minimizing (p - 1)² + s² subject to s² ≥ 4p
  
  -- Let's find the minimum of f(p, s) = (p-1)² + s² under constraint s² ≥ 4p
  -- For fixed p, the minimal s² is max(0, 4p) since s² ≥ 4p and s² ≥ 0
  
  -- Case 1: When p ≤ 0, minimal s² = 0 (since 4p ≤ 0)
  -- Then f(p, s) = (p-1)² ≥ 1 (since (p-1)² is minimized when p=1, but p≤0)
  
  -- Case 2: When p > 0, minimal s² = 4p
  -- Then f(p, s) = (p-1)² + 4p = p² - 2p + 1 + 4p = p² + 2p + 1 = (p + 1)²
  -- The minimum occurs when p is minimized (p > 0), but as p → 0+, f(p, s) → 1
  
  -- The global minimum is therefore 1, achieved when p = 0 and s = 0 (x = y = 0)
  
  -- Now let's verify this in Lean:
  
  -- First approach: Direct computation when x = y = 0
  have zero_case : (0 * 0 - 1) ^ 2 + (0 + 0) ^ 2 = 1 := by norm_num
  
  -- To show this is indeed the minimum, we'll rewrite the expression
  let expr := (x * y - 1) ^ 2 + (x + y) ^ 2
  
  -- Expand the expression
  have expr_expanded : expr = x^2 * y^2 + x^2 + y^2 + 1 := by
    ring
  
  -- Rewrite in terms of (x² + 1)(y² + 1) - x² - y²
  have expr_factored : expr = (x^2 + 1) * (y^2 + 1) - x^2 - y^2 := by
    rw [expr_expanded]
    ring
  
  -- But a better approach is to complete the square for one variable
  -- Let's treat this as a quadratic in x:
  -- x²(y² + 1) + x(2y) + (y² - 2y + 1)
  
  -- The minimum of ax² + bx + c is c - b²/4a when a > 0
  -- Here a = y² + 1 > 0 for all real y
  -- So the minimum value would be (y² - 2y + 1) - (2y)²/(4(y²+1))
  
  -- However, this seems complicated. Instead, let's use calculus:
  
  -- The minimum occurs when partial derivatives are zero
  -- ∂/∂x = 2(xy-1)y + 2(x+y) = 0
  -- ∂/∂y = 2(xy-1)x + 2(x+y) = 0
  
  -- Let's solve the system:
  -- 2(xy-1)y + 2(x+y) = 0 → (xy-1)y + (x+y) = 0 → xy² - y + x + y = 0 → xy² + x = 0 → x(y² + 1) = 0
  -- Similarly, y(x² + 1) = 0
  
  -- The only real solution is x = y = 0
  
  -- At x = y = 0, the expression equals 1
  
  -- To confirm this is indeed a minimum, we can check the second derivatives
  -- or observe that the expression is always ≥ 1
  
  -- Final proof:
  -- The expression is minimized when x = y = 0, where it equals 1
  -- Therefore, for all real x, y, the expression is ≥ 1
  
  -- In Lean, we can prove this by considering the expression as a sum of squares:
  have key_inequality : 1 ≤ (x * y - 1)^2 + (x + y)^2 := by
    -- The minimum is achieved at x = y = 0
    -- We can show that the value at any point is ≥ 1
    -- Let's consider two cases:
    
    -- Case 1: x = 0
    have case_x_zero : x = 0 → 1 ≤ (0 * y - 1)^2 + (0 + y)^2 := by
      intro hx
      rw [hx]
      simp
      linarith [pow_two_nonneg y]
    
    -- Case 2: x ≠ 0
    have case_x_nonzero : x ≠ 0 → 1 ≤ (x * y - 1)^2 + (x + y)^2 := by
      intro hx
      -- Rewrite as quadratic in y
      let f := (x * y - 1)^2 + (x + y)^2
      have f_expr : f = (x^2 + 1) * y^2 + (2 * x - 2 * x) * y + (1 + x^2) := by ring
      simp at f_expr
      rw [f_expr]
      -- Now f = (x² + 1)y² + (1 + x²)
      -- Since x² + 1 ≥ 1 > 0, and y² ≥ 0, we have f ≥ 1 + x² ≥ 1
      have x_sq_nonneg : 0 ≤ x^2 := by apply pow_two_nonneg
      have x_sq_plus_one_ge_one : 1 ≤ x^2 + 1 := by linarith
      have term1_nonneg : 0 ≤ (x^2 + 1) * y^2 := by nlinarith
      linarith
    
    -- Combine both cases
    by_cases h : x = 0
    · apply case_x_zero h
    · apply case_x_nonzero h
  
  exact key_inequality