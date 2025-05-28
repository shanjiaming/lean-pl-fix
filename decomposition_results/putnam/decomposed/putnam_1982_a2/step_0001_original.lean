theorem putnam_1982_a2 (B : ℕ → ℝ → ℝ) (hB : B = fun n x => ∑ k ∈ Finset.Icc 1 n, ↑k ^ x) (f : ℕ → ℝ) (hf : f = fun n => B n (logb (↑n) 2) / (↑n * logb 2 ↑n) ^ 2) : (∃ L, Tendsto (fun N => ∑ j ∈ Finset.Icc 2 N, f j) atTop (𝓝 L)) ↔ True :=
  by
  have h₁ : (∃ L : ℝ, Tendsto (fun N ↦ ∑ j in Finset.Icc 2 N, f j) atTop (𝓝 L)) := by sorry
  constructor <;> simp_all <;> tauto