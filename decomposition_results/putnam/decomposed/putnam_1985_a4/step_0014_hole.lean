theorem h₂ (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) (h_a2 : a 2 = 27) (h_a3 : a 3 % 100 = 87) (h_a_ge_3 : ∀ i ≥ 3, a i % 100 = 87) (k : Fin 100) (hk : k ∈ {k | ∀ (N : ℕ), ∃ i ≥ N, a i % 100 = ↑k}) (h₁ : ∀ (N : ℕ), ∃ i ≥ N, a i % 100 = ↑k) : k = 87 := by
  --  by_contra h
  have h₃ : k ≠ 87 := h
  have h₄ : ∀ i ≥ 3, a i % 100 = 87 := h_a_ge_3
  have h₅ : ∃ i ≥ 3, a i % 100 = k := by sorry
  --  obtain ⟨i, hi, h₆⟩ := h₅
  have h₇ : a i % 100 = 87 := h_a_ge_3 i hi
  omega
  hole