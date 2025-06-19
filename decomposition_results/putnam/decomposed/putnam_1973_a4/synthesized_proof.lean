theorem putnam_1973_a4
(f : ℝ → ℝ)
(hf : f = fun x => 2^x - 1 - x^2)
: ((3) : ℕ ) = {x : ℝ | f x = 0}.ncard := by
  have h₁ : f = fun x => (2 : ℝ)^x - 1 - x^2 := by
    simpa

  have h₂ : {x : ℝ | f x = 0} = {0, 1, 4} := by
    admit

  have h₃ : ({x : ℝ | f x = 0}.ncard : ℕ) = 3 := by
    admit

  linarith
