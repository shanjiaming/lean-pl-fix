theorem induction_1pxpownlt1pnx (x : ℝ) (n : ℕ) (h₀ : -1 < x) (h₁ : 0 < n) :
    1 + ↑n * x ≤ (1 + x) ^ (n : ℕ) := by
  have h_base : 1 + (1 : ℝ) * x ≤ (1 + x) ^ 1 := by
    norm_num
  
  have h_inductive : ∀ (k : ℕ), 0 < k → 1 + (k : ℝ) * x ≤ (1 + x) ^ k → 1 + ((k + 1 : ℕ) : ℝ) * x ≤ (1 + x) ^ (k + 1) := by
    intro k hk_pos hk_ineq
    have h₁_pos : 0 < (1 + x : ℝ) := by linarith
    have h₂ : (1 + x : ℝ) ^ (k + 1 : ℕ) = (1 + x : ℝ) ^ k * (1 + x : ℝ) := by
      ring
    rw [h₂]
    have h₃ : (1 + (k : ℝ) * x : ℝ) * (1 + x : ℝ) = 1 + ((k + 1 : ℕ) : ℝ) * x + (k : ℝ) * x ^ 2 := by
      admit
    have h₄ : (1 + (k : ℝ) * x : ℝ) ≤ (1 + x : ℝ) ^ k := by
      linarith
    have h₅ : (1 + (k : ℝ) * x : ℝ) * (1 + x : ℝ) ≤ (1 + x : ℝ) ^ k * (1 + x : ℝ) := by
      nlinarith
    have h₆ : 1 + ((k + 1 : ℕ) : ℝ) * x + (k : ℝ) * x ^ 2 ≤ (1 + x : ℝ) ^ k * (1 + x : ℝ) := by
      linarith
    have h₇ : 1 + ((k + 1 : ℕ) : ℝ) * x ≤ (1 + x : ℝ) ^ k * (1 + x : ℝ) := by
      have h₈ : (k : ℝ) * x ^ 2 ≥ 0 := by
        have h₉ : (k : ℝ) ≥ 0 := by norm_num
        have h₁₀ : x ^ 2 ≥ 0 := by nlinarith
        nlinarith
      linarith
    linarith
  
  have h_main : 1 + (n : ℝ) * x ≤ (1 + x) ^ n := by
    have h₂ : ∀ (k : ℕ), 0 < k → 1 + (k : ℝ) * x ≤ (1 + x) ^ k := by
      admit
    have h₃ : 0 < n := h₁
    have h₄ : 1 + (n : ℝ) * x ≤ (1 + x) ^ n := h₂ n h₃
    linarith
  
  linarith
