theorem h₃ (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (r : ℝ) (h_tendsto : sorry) (h₁ : ∀ n ≥ 1, 0 < p n) (h₂ : ∀ n ≥ 1, 0 < ∑ i ∈ Finset.Icc 1 n, p i) : BddAbove (Set.range fun m => ∑ n ∈ Finset.Icc 1 m, p n * (↑n : ℝ) ^ 2 / (∑ i ∈ Finset.Icc 1 n, p i) ^ 2) :=
  by
  have h₄ : ∃ S : ℝ, ∀ m : ℕ, (∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) ≤ S := by sorry
  --  obtain ⟨S, hS⟩ := h₄
  --  refine' ⟨S, _⟩
  --  intro x hx
  --  rcases hx with ⟨m, rfl⟩
  --  exact hS m
  hole