theorem putnam_2005_a1  : ∀ n > 0,
    ∃ k a, n = ∑ i, 2 ^ a i 0 * 3 ^ a i 1 ∧ ∀ (i j : Fin k), i ≠ j → ¬2 ^ a i 0 * 3 ^ a i 1 ∣ 2 ^ a j 0 * 3 ^ a j 1 :=
  by
  intro n hn
  have h_main :
    ∃ (k : ℕ) (a : Fin k → Fin 2 → ℕ),
      (n : ℤ) = ∑ i : Fin k, (2 ^ (a i 0) : ℤ) * 3 ^ (a i 1) ∧
        (∀ i j : Fin k, i ≠ j → ¬(2 ^ (a i 0) * 3 ^ (a i 1) ∣ 2 ^ (a j 0) * 3 ^ (a j 1))) := by sorry
  obtain ⟨k, a, h₁, h₂⟩ := h_main
  refine' ⟨k, a, _⟩
  simp_all [Fin.sum_univ_cast] <;> norm_num at * <;> simp_all [Fin.forall_fin_one] <;> aesop