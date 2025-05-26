theorem putnam_2016_b1
(x : ℕ → ℝ)
(hx0 : x 0 = 1)
(hxn : ∀ n : ℕ, x (n + 1) = log (exp (x n) - (x n)))
: (∑' n : ℕ, x n = ((exp 1 - 1) : ℝ )) := by