theorem h_main (S : Finset ℤ) (h₀ : ∀ (x : ℤ), x ∈ S ↔ (↑|x| : ℝ) < 3 * π) (h_pi_lb : 9 < 3 * π) (h_pi_ub : 3 * π < 10) (h_S_eq : S = Finset.Icc (-9) 9) (h_finset_card : (Finset.Icc (-9) 9).card = 19) : S.card = 19 := by
  rw [h_S_eq]
  exact h_finset_card