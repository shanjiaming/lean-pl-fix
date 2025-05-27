theorem h_main (p : ℤ) (hp : Prime p) (x y : ℤ) : (∃ x, p ∣ x ^ 2 - x + 3) ↔ ∃ y, p ∣ y ^ 2 - y + 25 :=
  by
  constructor
  · rintro ⟨x, hx⟩
    have h₁ : p ∣ (3 * x - 1) ^ 2 - (3 * x - 1) + 25 := by sorry
    exact ⟨3 * x - 1, h₁⟩
  · rintro ⟨y, hy⟩
    have h₁ : p ∣ (9 * y + 3) ^ 2 - (9 * y + 3) + 3 := by sorry
    exact ⟨9 * y + 3, h₁⟩