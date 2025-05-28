theorem h₃₃ (n k : ℕ) (hnk : n > 0 ∧ k > 0) (h₁ : n > 0) (h₂ : k > 0) (h₃ : 2 * k + 1 > 0) (h : n ≤ k + 1) (h₄ h₅ : n ≤ k + 1) (s : Equiv.Perm (Fin n)) (i : Fin n) (h₈ : ↑(s i) < n) (h₉ : ↑i < n) (h₁₀ : ↑↑(s i) - ↑↑i ≤ ↑k) (h₂₂ : ↑↑(s i) - ↑↑i ≥ -↑k) (h₃₁ : ↑↑(s i) - ↑↑i ≤ ↑k) (h₃₂ : ↑↑(s i) - ↑↑i ≥ -↑k) : |↑↑(s i) - ↑↑i| ≤ ↑k := by
  rw [abs_le]
  constructor
  · linarith
  · linarith