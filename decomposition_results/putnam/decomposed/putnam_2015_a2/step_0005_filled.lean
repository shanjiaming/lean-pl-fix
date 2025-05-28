theorem h₁ (a : ℕ → ℤ) (abase : a 0 = 1 ∧ a 1 = 2) (arec : ∀ n ≥ 2, a n = 4 * a (n - 1) - a (n - 2)) (h_odd : Odd 181) (h_prime : Nat.Prime 181) : ↑181 ∣ a 2015 :=
  by
  have h₂ : a 2015 % (181 : ℤ) = 0 := by sorry
  have h₈ : ((181 : ℕ) : ℤ) ∣ a 2015 := by
    have h₉ : a 2015 % (181 : ℤ) = 0 := h₂
    have h₁₀ : ((181 : ℕ) : ℤ) ∣ a 2015 := by
      rw [Int.dvd_iff_emod_eq_zero]
      exact h₉
    exact h₁₀
  --  exact h₈
  omega