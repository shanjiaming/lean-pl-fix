theorem h₆ (n k : ℕ) (hnk : n > 0 ∧ k > 0) (h₁ : n > 0) (h₂ : k > 0) (h₃ : 2 * k + 1 > 0) (h : n ≤ k + 1) (h₄ h₅ : n ≤ k + 1) : Equiv.Perm (Fin n) → sorry := by
  intro s
  intro i
  have h₇ : |((s i) : ℤ) - i| ≤ k :=
    by
    have h₈ : ((s i) : ℕ) < n := by exact (s i).is_lt
    have h₉ : (i : ℕ) < n := i.is_lt
    have h₁₀ : ((s i) : ℤ) - i ≤ k := by
      have h₁₁ : ((s i) : ℕ) < n := h₈
      have h₁₂ : (i : ℕ) < n := h₉
      have h₁₃ : ((s i) : ℤ) ≤ (n : ℤ) - 1 := by
        have h₁₄ : ((s i) : ℕ) < n := h₁₁
        have h₁₅ : ((s i) : ℤ) < (n : ℤ) := by exact_mod_cast h₁₄
        have h₁₆ : ((s i) : ℤ) ≤ (n : ℤ) - 1 := by omega
        exact h₁₆
      have h₁₇ : (i : ℤ) ≥ 0 := by exact_mod_cast (Nat.zero_le i)
      have h₁₈ : ((s i) : ℤ) - i ≤ (n : ℤ) - 1 - i := by omega
      have h₁₉ : (n : ℤ) - 1 - i ≤ k :=
        by
        have h₂₀ : (n : ℤ) ≤ k + 1 := by exact_mod_cast (by omega)
        have h₂₁ : (i : ℤ) ≥ 0 := by exact_mod_cast (Nat.zero_le i)
        omega
      omega
    have h₂₂ : ((s i) : ℤ) - i ≥ -k :=
      by
      have h₂₃ : ((s i) : ℕ) < n := by exact (s i).is_lt
      have h₂₄ : (i : ℕ) < n := i.is_lt
      have h₂₅ : ((s i) : ℤ) ≥ 0 := by exact_mod_cast (Nat.zero_le (s i))
      have h₂₆ : (i : ℤ) ≥ 0 := by exact_mod_cast (Nat.zero_le i)
      have h₂₇ : ((s i) : ℤ) - i ≥ -k := by
        have h₂₈ : ((s i) : ℕ) < n := h₂₃
        have h₂₉ : (i : ℕ) < n := h₂₄
        have h₃₀ : (i : ℤ) ≤ (n : ℤ) - 1 := by
          have h₃₁ : (i : ℕ) < n := h₂₉
          have h₃₂ : (i : ℤ) < (n : ℤ) := by exact_mod_cast h₃₁
          have h₃₃ : (i : ℤ) ≤ (n : ℤ) - 1 := by omega
          exact h₃₃
        have h₃₄ : ((s i) : ℤ) ≥ 0 := h₂₅
        have h₃₅ : (i : ℤ) ≥ 0 := h₂₆
        have h₃₆ : ((s i) : ℤ) - i ≥ -k :=
          by
          have h₃₇ : (n : ℤ) ≤ k + 1 := by exact_mod_cast (by omega)
          have h₃₈ : (i : ℤ) ≤ (n : ℤ) - 1 := h₃₀
          have h₃₉ : ((s i) : ℤ) ≥ 0 := h₃₄
          have h₄₀ : (i : ℤ) ≥ 0 := h₃₅
          omega
        exact h₃₆
      exact h₂₇
    have h₃₀ : |((s i) : ℤ) - i| ≤ k := by
      have h₃₁ : ((s i) : ℤ) - i ≤ k := h₁₀
      have h₃₂ : ((s i) : ℤ) - i ≥ -k := h₂₂
      have h₃₃ : |((s i) : ℤ) - i| ≤ k := by
        rw [abs_le]
        constructor
        · linarith
        · linarith
      exact h₃₃
    exact h₃₀
  exact h₇