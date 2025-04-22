import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find $x^2+y^2_{}$ if $x_{}^{}$ and $y_{}^{}$ are positive integers such that
$\begin{align*}
xy+x+y&=71, \\
x^2y+xy^2&=880.
\end{align*}$ Show that it is 146.-/
theorem aime_1991_p1 (x y : ℕ) (h₀ : 0 < x ∧ 0 < y) (h₁ : x * y + (x + y) = 71)
  (h₂ : x ^ 2 * y + x * y ^ 2 = 880) : x ^ 2 + y ^ 2 = 146 := by
  -- First, we extract the positivity assumptions for x and y
  have hx : 0 < x := h₀.left
  have hy : 0 < y := h₀.right
  
  -- Rewrite the first equation h₁ to the form xy + x + y = 71
  -- Add 1 to both sides to factor: xy + x + y + 1 = 72
  have h₁' : x * y + x + y + 1 = 72 := by omega
  
  -- Factor the left side as (x + 1)(y + 1) = 72
  have h_factor : (x + 1) * (y + 1) = 72 := by
    rw [add_mul]
    rw [one_mul]
    linarith
  have h₂' : x * y * (x + y) = 880 := by
    rw [← h₂, pow_two, pow_two, mul_add, mul_comm (x * y) x, mul_comm (x * y) y]
  
  -- Let s = x + y and p = xy, then we have:
  -- p + s = 71 (from h₁)
  -- p * s = 880 (from h₂')
  let s := x + y
  let p := x * y
  
  -- From p + s = 71, we can express s as 71 - p
  have h_sum : p + s = 71 := by
    rw [← h₁]
  have h_quad : p ^ 2 - 71 * p + 880 = 0 := by
    rw [← h₂']
    rw [h_sum]
    rw [add_sub_cancel_left]
    ring
  
  -- Solve the quadratic equation for p
  -- The discriminant is 71² - 4*880 = 5041 - 3520 = 1521
  -- The roots are (71 ± 39)/2, giving p = 55 or p = 16
  have p_cases : p = 55 ∨ p = 16 := by
    have discr : 71 ^ 2 - 4 * 880 = 1521 := by norm_num
    have sqrt_discr : Nat.sqrt 1521 = 39 := by norm_num
    norm_num
    omega
  
  -- Consider both cases for p
  cases p_cases with
  | inl hp =>
    -- Case 1: p = 55
    -- Then s = 71 - 55 = 16
    have hs : s = 16 := by
      omega
    have x_case : x = 5 ∨ x = 11 := by
      omega
    cases x_case with
    | inl hx' =>
      have hy' : y = 11 := by
        omega
      rw [hx', hy', pow_two, pow_two]
      norm_num
    | inr hx' =>
      have hy' : y = 5 := by
        omega
      rw [hx', hy', pow_two, pow_two]
      norm_num
    
  | inr hp =>
    -- Case 2: p = 16
    -- Then s = 71 - 16 = 55
    have hs : s = 55 := by
      omega
    have no_sol : False := by
      -- From (x+1)(y+1)=72 and x+y=55 → (x+1)(56-x)=72
      have h_contradiction : (x + 1) * (56 - x) = 72 := by
        omega
      norm_num
      all_goals { simp [h_contradiction] at * }
    
    -- Since we've reached a contradiction, this case is impossible
    exact False.elim no_sol