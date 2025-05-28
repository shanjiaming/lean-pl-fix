theorem h_main (α : ℝ) (ha : Real.cos (Real.pi * α) = 1 / 3) : ¬∃ p, ∃ q > 0, α = ↑p / ↑q :=
  by
  --  rintro ⟨p, q, hq, hα⟩
  have h₁ : Real.cos (Real.pi * α) = (1 : ℝ) / 3 := ha
  have h₂ : Real.cos (Real.pi * α) = Real.cos (p * Real.pi / q) := by sorry
  --  rw [h₂] at h₁
  have h₃ : Real.cos (p * Real.pi / q) = (1 : ℝ) / 3 := by sorry
  have h₄ : q > 0 := by sorry
  have h₅ : ∀ (k : ℕ), ∃ (N : ℤ), Real.cos (k * (p * Real.pi / q)) = N / (3 : ℝ) ^ k ∧ (3 : ℤ) ∣ N → (3 : ℤ) ∣ k := by sorry
  have h₆ : False := by sorry
  --  exact h₆
  hole