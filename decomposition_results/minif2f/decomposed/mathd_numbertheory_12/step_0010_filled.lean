theorem h₈ (x : ℕ) (h : (15 ≤ x ∧ x ≤ 85) ∧ 20 ∣ x) (h₁ : 15 ≤ x ∧ x ≤ 85) (h₂ : 20 ∣ x) (h₄ : x ≤ 85) (h₅ : 15 ≤ x) (h₆ : 20 ∣ x) : x % 20 = 0 := by -- omega
  omega