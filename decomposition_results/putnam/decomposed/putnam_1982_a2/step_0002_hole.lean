theorem h₁ (B : ℕ → ℝ → ℝ) (hB : B = fun n x => ∑ k ∈ Finset.Icc 1 n, ↑k ^ x) (f : ℕ → ℝ) (hf : f = fun n => B n (logb (↑n) 2) / (↑n * logb 2 ↑n) ^ 2) : ∃ L, Tendsto (fun N => ∑ j ∈ Finset.Icc 2 N, f j) atTop (𝓝 L) :=
  by
  --  refine' ⟨∑' j : ℕ, if j ≥ 2 then f j else 0, _⟩
  have h₂ : Tendsto (fun N ↦ ∑ j in Finset.Icc 2 N, f j) atTop (𝓝 (∑' j : ℕ, if j ≥ 2 then f j else 0)) := by sorry
  --  exact h₂
  hole