theorem h_main (p m : ℕ) (h₀ : isSolution p m) (h₁ : ∀ q < p, ¬∃ n, isSolution q n) (h₂ : ∀ k < m, ¬isSolution p k) (h_p_eq_17 : p = 17) (h_m_le_110 : m ≤ 110) (h_m_ge_110 : m ≥ 110) : m = 110 := by
  have h₁₁ : m ≤ 110 := h_m_le_110
  have h₁₂ : m ≥ 110 := h_m_ge_110
  --  linarith
  linarith