theorem h₃₆ (n k : ℕ) (hnk : n > 0 ∧ k > 0) (h₁ : n > 0) (h₂ : k > 0) (h₃ : 2 * k + 1 > 0) (h : n ≤ k + 1) (h₄ h₅ : n ≤ k + 1) (s : Equiv.Perm (Fin n)) (i : Fin n) (h₈ : ↑(s i) < n) (h₉ : ↑i < n) (h₁₀ : ↑↑(s i) - ↑↑i ≤ ↑k) (h₂₃ : ↑(s i) < n) (h₂₄ : ↑i < n) (h₂₅ : ↑↑(s i) ≥ 0) (h₂₆ : ↑↑i ≥ 0) (h₂₈ : ↑(s i) < n) (h₂₉ : ↑i < n) (h₃₀ : ↑↑i ≤ ↑n - 1) (h₃₄ : ↑↑(s i) ≥ 0) (h₃₅ : ↑↑i ≥ 0) : ↑↑(s i) - ↑↑i ≥ -↑k :=
  by
  have h₃₇ : (n : ℤ) ≤ k + 1 := by sorry
  have h₃₈ : (i : ℤ) ≤ (n : ℤ) - 1 := h₃₀
  have h₃₉ : ((s i) : ℤ) ≥ 0 := h₃₄
  have h₄₀ : (i : ℤ) ≥ 0 := h₃₅
  omega