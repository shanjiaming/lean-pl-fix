theorem derivative_of_exponential_function  : (deriv fun x => rexp (-x ^ 2 / 2)) = fun x => -x * rexp (-x ^ 2 / 2) :=
  by
  have h₀ : deriv (fun x => exp (-x ^ 2 / 2)) = fun x => -x * exp (-x ^ 2 / 2) := by sorry
  --  exact h₀
  hole