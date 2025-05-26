theorem h_main (T : ℝ) (hT : 0 < T) : False := by
  --  by_contra h
  have h₁ : T > 0 := hT
  have h₂ : (T : ℝ) > 0 := by sorry
  have h₃ : ∃ (t : ℝ), t ≥ T ∧ Nat.floor t = 2 * (Nat.floor (t - T)) := by sorry
  --  obtain ⟨t, ht₁, ht₂⟩ := h₃
  have h₄ : t ≥ T := ht₁
  have h₅ : Nat.floor t = 2 * (Nat.floor (t - T)) := ht₂
  have h₆ : (T : ℝ) > 0 := by sorry
  have h₇ : False := by sorry
  --  exact h₇
  hole