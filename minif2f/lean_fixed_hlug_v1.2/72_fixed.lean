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
  omega