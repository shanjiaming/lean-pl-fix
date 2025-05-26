theorem h_sum_converges (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ (n : ℕ), a n > 0) (hb : b 0 = a 0 ∧ ∀ (n : ℕ), b (n + 1) = sorry) (h_b_pos : ∀ (n : ℕ), b n > 0) (h_b_mono : ∀ (n : ℕ), b n ≤ b (n + 1)) (h_b_exponential : ∀ (n : ℕ), b n ≥ 2 ^ n) : ∃ L, sorry :=
  by
  have h₁ : ∀ n : ℕ, (b n : ℝ) ≥ (2 : ℝ) ^ n := by sorry
  have h₂ : Summable (fun n : ℕ ↦ (1 : ℝ) / b n) := by sorry
  have h₃ : ∃ L : ℝ, Tendsto (fun N ↦ ∑ n in Finset.range N, (1 : ℝ) / b n) atTop (𝓝 L) := by sorry
  --  exact h₃
  hole