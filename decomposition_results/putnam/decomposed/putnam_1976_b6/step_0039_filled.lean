theorem h₄₆ (σ : ℕ → ℤ) (hσ : σ = fun N => ∑ d ∈ N.divisors, ↑d) (quasiperfect : ℕ → Prop) (quasiperfect_def : ∀ (N : ℕ), quasiperfect N ↔ σ N = 2 * ↑N + 1) (N : ℕ) (h_quasiperfect : quasiperfect N) (h₂ : ∑ d ∈ N.divisors, ↑d = 2 * ↑N + 1) (h₃ : σ N = ∑ d ∈ N.divisors, ↑d) (h₄ : ∑ d ∈ N.divisors, ↑d = 2 * ↑N + 1) (h₅ : N ≥ 2) (h₆ : ∑ d ∈ N.divisors, ↑d ≥ ↑N + 1) (h₇ : 2 * ↑N + 1 ≥ ↑N + 1) (h₉ : ∑ d ∈ N.divisors, ↑d ≥ ↑N + 1) (h₁₀ : ↑N ≥ 2) (h₁₂ : ∑ d ∈ N.divisors, ↑d ≤ 2 * ↑N + 1) (h₁₃ : ∑ d ∈ N.divisors, ↑d = 2 * ↑N + 1) (h₁₄ : ∑ d ∈ N.divisors, ↑d ≥ ↑N + 1) (h₁₅ : ↑N + 1 ≤ 2 * ↑N + 1) (h₁₆ : ↑N ≤ 2 * ↑N) (h₁₇ : ↑N ≥ 0) (h₁₈ : N ≥ 2) (d : ℕ) (hd : d ∈ N.divisors) (hd₁ : d ≠ 1) (hd₂ : d ≠ N) (h₄₂ : ↑d > 0) (h₄₃ : ↑d ≤ ↑N) (h₄₅ : sorry) : ∑ d ∈ N.divisors, ↑d ≥ ↑N + 1 + ↑d := by
  --  calc
  --    (∑ d in Nat.divisors N, (d : ℤ)) ≥ ∑ d in {(1 : ℕ), N, d}, (d : ℤ) :=
  --      by
  --      apply Finset.sum_le_sum_of_subset_of_nonneg
  --      · intro x hx
  --        simp only [Finset.mem_insert, Finset.mem_singleton, Nat.mem_divisors] at hx ⊢
  --        aesop
  --      · intro x _ _
  --        simp
  --    _ = (1 : ℤ) + (N : ℤ) + (d : ℤ) := by
  --      simp [Finset.sum_pair, Finset.sum_singleton, hd₁, hd₂] <;> (try omega) <;> (try ring_nf) <;> (try norm_num) <;>
  --        (try omega)
  --    _ = (N : ℤ) + 1 + (d : ℤ) := by ring
  linarith