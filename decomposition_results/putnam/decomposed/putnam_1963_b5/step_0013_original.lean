theorem h₅₇ (a : ℤ → ℝ) (haineq : ∀ n ≥ 1, ∀ (k : ℤ), n ≤ k ∧ k ≤ 2 * n → 0 ≤ a k ∧ a k ≤ 100 * a n) (haseries : ∃ S, Tendsto (fun N => ∑ n, a ↑↑n) atTop (𝓝 S)) (h₁ : ∀ n ≥ 1, 0 ≤ a n) (h₂ : ∀ n ≥ 1, a n ≥ 0) (h₃ h₅₁ : Tendsto (fun n => ∑ k, a ↑↑k) atTop (𝓝 (Classical.choose haseries))) (h₅₅ : Tendsto (fun n => n + 1) atTop atTop) : Tendsto (fun n => ∑ k, a ↑↑k) atTop (𝓝 (Classical.choose haseries)) := by
  convert h₅₁.comp_tendsto (tendsto_atTop_atTop.mpr fun n => ⟨n + 1, by simp [Fin.sum_univ_succ]⟩) using 1 <;>
          simp [Fin.sum_univ_succ] <;>
        ring_nf <;>
      simp_all [Fin.sum_univ_succ] <;>
    linarith