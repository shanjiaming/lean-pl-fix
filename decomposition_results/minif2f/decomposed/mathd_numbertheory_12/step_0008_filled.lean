theorem h₆ (x : ℕ) (h : (15 ≤ x ∧ x ≤ 85) ∧ 20 ∣ x) (h₁ : 15 ≤ x ∧ x ≤ 85) (h₂ : 20 ∣ x) (h₄ : x ≤ 85) (h₅ : 15 ≤ x) : 20 ∣ x := by -- tauto
  omega