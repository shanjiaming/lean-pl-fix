theorem putnam_2017_a4 (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ (k : Fin 11), ∃ i, score i = k) (havg : (∑ i, (↑(↑(score i) : ℕ) : ℝ)) / (2 * (↑N : ℝ)) = 7.4) : ∃ s,
    s.card = N ∧
      (∑ i ∈ s, (↑(↑(score i) : ℕ) : ℝ)) / (↑N : ℝ) = 7.4 ∧ (∑ i ∈ sᶜ, (↑(↑(score i) : ℕ) : ℝ)) / (↑N : ℝ) = 7.4 :=
  by
  have hN_pos : N > 0 := by sorry
  have hN_dvd : 5 ∣ N := by sorry
  have h_main :
    ∃ (s : Finset (Fin (2 * N))),
      s.card = N ∧ ((∑ i in s, (score i : ℝ)) / N = 7.4) ∧ ((∑ i in sᶜ, (score i : ℝ)) / N = 7.4) := by sorry
  --  exact h_main
  simpa