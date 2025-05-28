theorem h₂ (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ (k : Fin 11), ∃ i, score i = k) (havg : (∑ i, ↑↑(score i)) / (2 * ↑N) = 7.4) (hN_pos : N > 0) (h₁ : ∑ i, ↑↑(score i) = 2 * ↑N * 7.4) : ∑ i, ↑↑(score i) = 2 * ↑N * 74 / 10 :=
  by
  have h₃ : (∑ i : Fin (2 * N), (score i : ℤ)) = (∑ i : Fin (2 * N), (score i : ℝ)) := by sorry
  rw [h₃]
  rw [h₁] <;> norm_num <;> ring_nf at * <;> field_simp at * <;> ring_nf at * <;> norm_cast at * <;>
                simp_all [Finset.sum_congr] <;>
              norm_num <;>
            ring_nf at * <;>
          field_simp at * <;>
        ring_nf at * <;>
      norm_cast at * <;>
    omega