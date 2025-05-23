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
  have h₁' : x * y + x + y + 1 = 72 := by rw [← h₁, add_assoc]
  
  -- Factor the left side as (x + 1)(y + 1) = 72
  have h_factor : (x + 1) * (y + 1) = 72 := by
    rw [add_mul, one_mul, mul_one, ← add_assoc, h₁']
  
  -- Rewrite the second equation h₂: x²y + xy² = 880
  -- Factor out xy to get xy(x + y) = 880
  have h₂' : x * y * (x + y) = 880 := by
    rw [← h₂, pow_two, pow_two, mul_add, mul_comm (x * y) x, mul_comm (x * y) y]
  
  -- Let s = x + y and p = xy, then we have:
  -- p + s = 71 (from h₁)
  -- p * s = 880 (from h₂')
  let s := x + y
  let p := x * y
  
  -- From p + s = 71, we can express s as 71 - p
  have h_sum : p + s = 71 := by
    rw [← h₁, add_assoc, add_comm y x]
  
  -- From p * s = 880 and s = 71 - p, we get p(71 - p) = 880
  -- This gives us a quadratic equation: p² - 71p + 880 = 0
  have h_quad : p ^ 2 - 71 * p + 880 = 0 := by
    rw [← h₂', h_sum, add_sub_cancel_left]
    ring
  
  -- Solve the quadratic equation for p
  -- The discriminant is 71² - 4*880 = 5041 - 3520 = 1521
  -- The roots are (71 ± 39)/2, giving p = 55 or p = 16
  have p_cases : p = 55 ∨ p = 16 := by
    have discr : 71 ^ 2 - 4 * 880 = 1521 := by norm_num
    have sqrt_discr : Nat.sqrt 1521 = 39 := by norm_num
    apply quadratic_eq_zero_iff.1
    exact h_quad
  
  -- Consider both cases for p
  cases p_cases with
  | inl hp =>
    -- Case 1: p = 55
    -- Then s = 71 - 55 = 16
    have hs : s = 16 := by
      rw [← h_sum, hp, add_comm, add_tsub_cancel_right]
    
    -- Now x and y are roots of t² - st + p = 0 → t² - 16t + 55 = 0
    -- Solutions would be (16 ± √(256 - 220))/2 = (16 ± 6)/2 → 11 and 5
    -- Check if (x,y) = (5,11) or (11,5) satisfies all conditions
    
    -- However, we need to verify that these are the only possible natural number solutions
    -- From the factored form (x+1)(y+1) = 72 and x+y=16
    -- Possible factor pairs of 72 where x+1 + y+1 = 18 (since (x+1)+(y+1)=x+y+2=18)
    -- Possible pairs (x+1,y+1): (6,12), (5,13), (4,18), etc. but only (6,12) sums to 18
    -- Thus x+1=6 → x=5, y+1=12 → y=11 or vice versa
    
    -- Verify that x=5, y=11 satisfies all original equations
    have x_case : x = 5 ∨ x = 11 := by
      rw [← hs, add_comm] at h_factor
      have h_fact : (x + 1) * (16 - x + 1) = 72 := by
        rw [add_comm y x] at hs
        rw [hs, add_comm y x, add_sub_cancel, h_factor]
      -- Solve (x+1)(17-x) = 72
      -- Expand: -x² + 16x + 17 = 72 → x² - 16x + 55 = 0
      -- Solutions are x=5 or x=11
      interval_cases x
      · left; rfl
      · right; rfl
    
    -- In both subcases, x² + y² = 146
    cases x_case with
    | inl hx' =>
      have hy' : y = 11 := by
        rw [hx', hs] at h_sum
        simp [hp, hx'] at h_sum
        exact (add_left_inj 55).1 h_sum
      rw [hx', hy', pow_two, pow_two]
      norm_num
    | inr hx' =>
      have hy' : y = 5 := by
        rw [hx', hs] at h_sum
        simp [hp, hx'] at h_sum
        exact (add_left_inj 55).1 h_sum
      rw [hx', hy', pow_two, pow_two]
      norm_num
    
  | inr hp =>
    -- Case 2: p = 16
    -- Then s = 71 - 16 = 55
    have hs : s = 55 := by
      rw [← h_sum, hp, add_comm, add_tsub_cancel_right]
    
    -- Now x and y are roots of t² - 55t + 16 = 0
    -- But the discriminant 55² - 64 = 3025 - 64 = 2961 is not a perfect square
    -- Moreover, from (x+1)(y+1)=72 and x+y=55, we'd need (x+1)(56-x)=72
    -- The maximum product when x+1=28 is 28*28=784 > 72, but no natural solutions
    -- Thus this case leads to no natural number solutions
    
    -- To formally rule out this case, we can show that there are no natural numbers x,y
    -- satisfying both (x+1)(y+1)=72 and x+y=55
    have no_sol : False := by
      -- From (x+1)(y+1)=72 and x+y=55 → (x+1)(56-x)=72
      have h_contradiction : (x + 1) * (56 - x) = 72 := by
        rw [add_comm y x] at hs
        rw [hs, add_comm y x, add_sub_cancel, h_factor]
      -- The maximum of (x+1)(56-x) occurs at x=27.5
      -- At x=27: (28)(29) = 812 > 72
      -- At x=0: (1)(56) = 56 < 812 but still > 72
      -- Thus no natural x satisfies this equation
      -- We can prove this by showing all possible x values fail
      interval_cases x
      all_goals { simp [h_contradiction] at * }
    
    -- Since we've reached a contradiction, this case is impossible
    exact False.elim no_sol