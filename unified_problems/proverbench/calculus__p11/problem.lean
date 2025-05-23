theorem derivative_of_cube_at_four : deriv (fun x : ℝ => x ^ 3) 4 = 48 := by
  have h : deriv (fun x : ℝ => x ^ 3) 4 = 48 := by
    -- Apply the power rule to find the derivative of the function `fun x : ℝ => x ^ 3` at `x = 4`
    rw [show (deriv (fun x : ℝ => x ^ 3) 4) = deriv (fun x : ℝ => x ^ 3) 4 by rfl]
    -- Simplify the expression using the power rule and verify the numerical result
    norm_num [deriv_pow]
    <;>
    ring_nf
    <;>
    norm_num
    <;>
    linarith
  
  exact h