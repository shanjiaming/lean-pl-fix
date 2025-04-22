import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the largest number $c$ such that $2x^2+5x+c=0$ has at least one real solution? 
    Express your answer as a common fraction. Show that it is \frac{25}{8}.-/
theorem mathd_algebra_28 (c : ℝ) (f : ℝ → ℝ) (h₀ : ∀ x, f x = 2 * x ^ 2 + 5 * x + c)
  (h₁ : ∃ x, f x ≤ 0) : c ≤ 25 / 8 := by
  -- We need to find the maximum c such that the quadratic equation has at least one real solution
  -- A quadratic equation ax² + bx + c = 0 has real solutions iff its discriminant D = b² - 4ac ≥ 0
  
  -- First, extract the coefficients from the function definition
  have a : ℝ := 2
  have b : ℝ := 5
  
  -- The discriminant condition for real roots is b² - 4ac ≥ 0
  -- We can rewrite this as c ≤ b²/(4a)
  
  -- Calculate the maximum allowed c value: 5² / (4*2) = 25/8
  have max_c : ℝ := b^2 / (4 * a)
  
  -- Now we need to show that any c satisfying the existence of a real root must be ≤ 25/8
  
  -- From the existence of a root (h₁), we know the discriminant must be non-negative
  -- First, let's get the witness point x where f(x) ≤ 0
  obtain ⟨x, hx⟩ := h₁
  
  -- The quadratic reaches its minimum at x = -b/(2a)
  -- The minimum value is f(-b/(2a)) = c - b²/(4a)
  
  -- For the quadratic to have a real root, the minimum must be ≤ 0
  -- Therefore c - b²/(4a) ≤ 0 → c ≤ b²/(4a)
  
  -- Let's compute the minimum point
  let x_min := -b / (2 * a)
  
  -- Express that this is indeed the minimum point
  have is_min : ∀ y, f x_min ≤ f y := by
    intro y
    rw [h₀, h₀]
    -- The quadratic 2x² + 5x + c has a minimum at x = -5/4 since the coefficient of x² is positive
    -- We can show this by completing the square or using calculus
    -- Here we'll use the fact that quadratics have their vertex at -b/2a
    apply quadratic_minimum
    · exact a
    · exact b
    · exact c
    · linarith -- a = 2 > 0
    
  -- Now we know f(x_min) is the global minimum
  -- Since there exists some x where f(x) ≤ 0, the minimum must also be ≤ 0
  have min_le_zero : f x_min ≤ 0 := by
    apply le_trans (is_min x) hx
    
  -- Now expand f(x_min) using the function definition
  rw [h₀] at min_le_zero
  -- f(x_min) = 2*(x_min)^2 + 5*x_min + c ≤ 0
  
  -- But we can compute f(x_min) exactly:
  -- f(x_min) = c - (b²)/(4a)
  have f_min_val : f x_min = c - (b^2)/(4*a) := by
    rw [h₀]
    -- Compute 2*(-b/(2a))² + 5*(-b/(2a)) + c
    field_simp
    ring
    
  -- Now substitute this into our inequality
  rw [f_min_val] at min_le_zero
  
  -- We now have c - (b²)/(4a) ≤ 0
  -- Which simplifies to c ≤ (b²)/(4a)
  
  -- Compute the exact value: b²/(4a) = 25/(4*2) = 25/8
  have final : c ≤ b^2 / (4 * a) := by linarith
  rw [←div_div] at final
  norm_num at final
  
  -- The exact calculation shows c ≤ 25/8
  exact final