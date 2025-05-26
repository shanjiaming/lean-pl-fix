theorem h₈ (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (r : ℝ) (h_tendsto : sorry) (h₁ : ∀ n ≥ 1, 0 < p n) (h₂ : ∀ n ≥ 1, 0 < ∑ i ∈ Finset.Icc 1 n, p i) (h₃ : BddAbove (Set.range fun m => ∑ n ∈ Finset.Icc 1 m, p n * (↑n : ℝ) ^ 2 / (∑ i ∈ Finset.Icc 1 n, p i) ^ 2)) (h₅ : Monotone fun m => ∑ n ∈ Finset.Icc 1 m, p n * (↑n : ℝ) ^ 2 / (∑ i ∈ Finset.Icc 1 n, p i) ^ 2) (h₆ : BddAbove (Set.range fun m => ∑ n ∈ Finset.Icc 1 m, p n * (↑n : ℝ) ^ 2 / (∑ i ∈ Finset.Icc 1 n, p i) ^ 2)) : ∃ r, sorry :=
  by
  --  refine' ⟨⨆ m : ℕ, (∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 : ℝ), _⟩
  have h₉ :
    Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) atTop
      (𝓝 (⨆ m : ℕ, (∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 : ℝ))) := by sorry
  exact h₉
  hole