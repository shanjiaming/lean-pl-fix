theorem putnam_1974_b3
(α : ℝ)
(ha : Real.cos (Real.pi * α) = (1 : ℝ)/3)
: Irrational α := by
  have h_main : ¬ (∃ (p : ℤ) (q : ℤ), q > 0 ∧ α = (p : ℝ) / q) := by
    rintro ⟨p, q, hq, hα⟩
    have h₁ : Real.cos (Real.pi * α) = (1 : ℝ) / 3 := ha
    have h₂ : Real.cos (Real.pi * α) = Real.cos (p * Real.pi / q) := by
      admit
    rw [h₂] at h₁
    have h₃ : Real.cos (p * Real.pi / q) = (1 : ℝ) / 3 := by admit
    have h₄ : q > 0 := by admit
    
    have h₅ : ∀ (k : ℕ), ∃ (N : ℤ), Real.cos (k * (p * Real.pi / q)) = N / (3 : ℝ) ^ k ∧ (3 : ℤ) ∣ N → (3 : ℤ) ∣ k := by
      admit
    
    have h₆ : False := by
      have h₇ := h₅ 0
      have h₈ := h₅ 1
      have h₉ := h₅ q
      have h₁₀ := h₅ (q + 1)
      have h₁₁ := h₅ (q - 1)
      admit
    admit
  have h_final : Irrational α := by
    intro h
    obtain ⟨r, hr⟩ := h
    have h₁ : ∃ (p : ℤ) (q : ℤ), q > 0 ∧ α = (p : ℝ) / q := by
      admit
    admit
  admit