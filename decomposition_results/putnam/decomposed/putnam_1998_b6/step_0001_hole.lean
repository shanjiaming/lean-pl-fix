theorem putnam_1998_b6  : ∀ (a b c : ℤ), ∃ n > 0, ¬∃ k, (↑k : ℝ) = √((↑n : ℝ) ^ 3 + (↑a : ℝ) * (↑n : ℝ) ^ 2 + (↑b : ℝ) * (↑n : ℝ) + (↑c : ℝ)) :=
  by
  --  intro a b c
  have h_main : ∃ (n : ℤ), n > 0 ∧ ¬(∃ (k : ℤ), (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c)) := by sorry
  --  rcases h_main with ⟨n, hn, hn'⟩
  --  refine' ⟨n, hn, _⟩
  --  intro h
  --  rcases h with ⟨k, hk⟩
  have h₁ : (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c) := by sorry
  have h₂ : ¬(∃ (k : ℤ), (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c)) := by sorry
  --  exact h₂ ⟨k, by simpa using h₁⟩
  hole