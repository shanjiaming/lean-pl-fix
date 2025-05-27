theorem prime_divisibility_condition (x y : ℤ) : (∃ x, p ∣ x ^ 2 - x + 3) ↔ (∃ y, p ∣ y ^ 2 - y + 25):=
  by
  have h_main : (∃ (x : ℤ), p ∣ x ^ 2 - x + 3) ↔ (∃ (y : ℤ), p ∣ y ^ 2 - y + 25):=
    by
    --  constructor
    --  · rintro ⟨x, hx⟩
      have h₁ : p ∣ (3 * x - 1) ^ 2 - (3 * x - 1) + 25:=
        by
        have h₂ : (3 * x - 1 : ℤ) ^ 2 - (3 * x - 1) + 25 = 9 * (x ^ 2 - x + 3):= by ring
          hole
        rw [h₂]
        exact dvd_mul_of_dvd_right hx 9
        hole
    --    exact ⟨3 * x - 1, h₁⟩
    --  · rintro ⟨y, hy⟩
      have h₁ : p ∣ (9 * y + 3) ^ 2 - (9 * y + 3) + 3 := by sorry
    --    exact ⟨9 * y + 3, h₁⟩
    hole
  --  exact h_main
  simpa