theorem putnam_1982_a2 (B : ℕ → ℝ → ℝ) (hB : B = fun n x => ∑ k ∈ Finset.Icc 1 n, (↑k : ℝ) ^ x) (f : ℕ → ℝ) (hf : f = fun n => B n (logb (↑n : ℝ) 2) / ((↑n : ℝ) * logb 2 (↑n : ℝ)) ^ 2) : (∃ L, sorry) ↔ True :=
  by
  have h₁ : (∃ L : ℝ, Tendsto (fun N ↦ ∑ j in Finset.Icc 2 N, f j) atTop (𝓝 L)) := by sorry
  constructor <;> simp_all <;> tauto