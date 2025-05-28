theorem h_main (pa : (ℕ → ℝ) → Prop) (hpa : ∀ (a : ℕ → ℝ), pa a ↔ (∀ (n : ℕ), a n > 0) ∧ ∃ L, Tendsto (fun N => ∑ n ∈ Finset.range N, 1 / a n) atTop (𝓝 L)) : ∃ k, ∀ (a : ℕ → ℝ), pa a → ∑' (n : ℕ), (↑n + 1) / ∑ i ∈ Finset.range (n + 1), a i ≤ k * ∑' (n : ℕ), 1 / a n :=
  by
  --  use 4
  --  intro a ha
  have h₁ : (∀ n : ℕ, a n > 0) ∧ ∃ L : ℝ, Tendsto (fun N ↦ ∑ n in Finset.range N, 1 / a n) atTop (𝓝 L) := by sorry
  have h₂ : ∀ n : ℕ, a n > 0 := h₁.1
  have h₃ : ∃ L : ℝ, Tendsto (fun N ↦ ∑ n in Finset.range N, 1 / a n) atTop (𝓝 L) := h₁.2
  have h₄ : Summable (fun n : ℕ ↦ (1 : ℝ) / a n) := by sorry
  have h₅ : (∑' n : ℕ, 1 / a n) > 0 := by sorry
  have h₆ : Summable (fun n : ℕ ↦ (n + 1 : ℝ) / (∑ i in Finset.range (n + 1), a i)) := by sorry
  have h₇ : (∑' n : ℕ, (n + 1 : ℝ) / (∑ i in Finset.range (n + 1), a i)) ≤ (4 : ℝ) * ∑' n : ℕ, 1 / a n := by sorry
  have h₈ : ∑' n : ℕ, (n + 1) / (∑ i in Finset.range (n + 1), a i) ≤ (4 : ℝ) * ∑' n : ℕ, 1 / a n := by simpa using h₇
  have h₉ : ∑' n : ℕ, (n + 1) / (∑ i in Finset.range (n + 1), a i) ≤ (4 : ℝ) * ∑' n : ℕ, 1 / a n := by exact h₈
  have h₁₀ : ∑' n : ℕ, (n + 1) / (∑ i in Finset.range (n + 1), a i) ≤ (4 : ℝ) * ∑' n : ℕ, 1 / a n := by exact h₉
  have h₁₁ : ∑' n : ℕ, (n + 1) / (∑ i in Finset.range (n + 1), a i) ≤ (4 : ℝ) * ∑' n : ℕ, 1 / a n := by exact h₁₀
  --  simpa [mul_assoc] using h₁₁
  hole