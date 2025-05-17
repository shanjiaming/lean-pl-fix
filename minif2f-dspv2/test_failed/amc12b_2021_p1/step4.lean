theorem h_S_eq (S : Finset ℤ) (h₀ : ∀ (x : ℤ), x ∈ S ↔ (↑|x| : ℝ) < 3 * π) (h_pi_lb : 9 < 3 * π) (h_pi_ub : 3 * π < 10) : S = Finset.Icc (-9) 9 := by
  apply Finset.ext
  intro x
  simp only [Finset.mem_Icc, h₀]
  constructor
  · intro h
    have h₁ : (abs x : ℝ) < 3 * Real.pi := by sorry
    have h₂ : -9 ≤ (x : ℤ) := by sorry
    have h₃ : (x : ℤ) ≤ 9 := by sorry
    exact ⟨h₂, h₃⟩
  · intro h
    have h₁ : -9 ≤ (x : ℤ) := h.1
    have h₂ : (x : ℤ) ≤ 9 := h.2
    have h₃ : (abs x : ℝ) < 3 * Real.pi := by sorry
    exact_mod_cast h₃