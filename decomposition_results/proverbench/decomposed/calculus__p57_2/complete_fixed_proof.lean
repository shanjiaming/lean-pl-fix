theorem f_second_deriv (x : ℝ) : deriv (deriv f) x = (50 * x ^ 2 - 525 * x - 175) / ((5 * x ^ 2 + 35) ^ (5 / 2)):=
  by
  have h₁ : deriv (deriv f) x = (50 * x ^ 2 - 525 * x - 175) / ((5 * x ^ 2 + 35) ^ 2):= by -- sorry
    hole
  have h₂ : ((5 * x ^ 2 + 35) : ℝ) ^ (5 / 2) = (5 * x ^ 2 + 35) ^ 2:= by -- sorry
    norm_num
  have h₃ : deriv (deriv f) x = (50 * x ^ 2 - 525 * x - 175) / ((5 * x ^ 2 + 35) ^ (5 / 2)):= by -- sorry
    hole
  --  exact h₃
  hole