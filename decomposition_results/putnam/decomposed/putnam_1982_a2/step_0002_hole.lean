theorem h₁ (B : ℕ → ℝ → ℝ) (hB : B = fun n x => ∑ k ∈ Finset.Icc 1 n, (↑k : ℝ) ^ x) (f : ℕ → ℝ) (hf : f = fun n => B n (logb (↑n : ℝ) 2) / ((↑n : ℝ) * logb 2 (↑n : ℝ)) ^ 2) : ∃ L, sorry :=
  by
  --  refine' ⟨∑' j : ℕ, if j ≥ 2 then f j else 0, _⟩
  have h₂ : Tendsto (fun N ↦ ∑ j in Finset.Icc 2 N, f j) atTop (𝓝 (∑' j : ℕ, if j ≥ 2 then f j else 0)) := by sorry
  exact h₂
  hole