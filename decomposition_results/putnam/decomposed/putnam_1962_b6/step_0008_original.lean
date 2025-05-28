theorem h_main (n : ℕ) (a b : ℕ → ℝ) (xs : Set ℝ) (f : ℝ → ℝ) (hf : f = fun x => ∑ k ∈ Finset.Icc 0 n, (a k * sin (↑k * x) + b k * cos (↑k * x))) (hf1 : ∀ x ∈ Set.Icc 0 (2 * π), |f x| ≤ 1) (hxs : xs.ncard = 2 * n ∧ xs ⊆ Set.Ico 0 (2 * π)) (hfxs : ∀ x ∈ xs, |f x| = 1) (h_no_constant : ¬∃ c, f = fun x => c) (h_n_ge_one : n ≥ 1) : ∃ α, f = fun x => cos (↑n * x + α) :=
  by
  have h₁ := hxs.1
  have h₂ := hxs.2
  have h₃ := hfxs
  have h₄ := hf1
  have h₅ : n ≥ 1 := h_n_ge_one
  have h₆ : ¬∃ c : ℝ, f = fun x : ℝ => c := h_no_constant
  exfalso
  exact
    h₆
      ⟨(f 0), by
        funext x
        have h₇ := hf
        have h₈ := h₅
        have h₉ := h₁
        have h₁₀ := h₂
        have h₁₁ := h₃
        have h₁₂ := h₄
        simp_all [Finset.sum_Icc_succ_top, Nat.cast_add, Nat.cast_one, Nat.cast_zero, add_assoc] <;> (try ring_nf) <;>
                  (try norm_num) <;>
                (try linarith) <;>
              (try simp_all) <;>
            (try (aesop)) <;>
          (try (simp_all [Real.sin_add, Real.cos_add, mul_comm] <;> ring_nf at * <;> norm_num at * <;> linarith))⟩