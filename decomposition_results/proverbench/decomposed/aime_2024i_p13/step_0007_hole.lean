theorem h_m_le_110 (p m : ℕ) (h₀ : isSolution p m) (h₁ : ∀ q < p, ¬∃ n, isSolution q n) (h₂ : ∀ k < m, ¬isSolution p k) (h_p_eq_17 : p = 17) : m ≤ 110 := by
  --  by_contra h
  have h₁₀ : m ≥ 111 := by sorry
  have h₁₁ : isSolution p 110 := by sorry
  have h₁₂ : 110 < m := by sorry
  have h₁₃ : isSolution p 110 := h₁₁
  have h₁₄ : ¬isSolution p 110 := h₂ 110 (by omega)
  --  exact h₁₄ h₁₃
  hole