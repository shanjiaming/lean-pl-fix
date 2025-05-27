theorem putnam_1994_b5
  (n : ℕ) (hn : n > 0)
  (f : ℝ → ℤ → ℤ)
  (hf : ∀ (α : ℝ) (x : ℤ), f α x = Int.floor (α * x)) :
  ∃ α : ℝ,
    ∀ k ∈ Set.Icc 1 n,
      ((f α)^[k] (n ^ 2) = n ^ 2 - k) ∧
      (f (α ^ k) (n ^ 2) = n ^ 2 - k) := by