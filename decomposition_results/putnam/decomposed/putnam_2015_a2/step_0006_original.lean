theorem h₂ (a : ℕ → ℤ) (abase : a 0 = 1 ∧ a 1 = 2) (arec : ∀ n ≥ 2, a n = 4 * a (n - 1) - a (n - 2)) (h_odd : Odd 181) (h_prime : Nat.Prime 181) : a 2015 % 181 = 0 :=
  by
  have h₃ : ∀ n : ℕ, a n % (181 : ℤ) = a (n % 20) % (181 : ℤ) := by sorry
  have h₅ : a 2015 % (181 : ℤ) = a (2015 % 20) % (181 : ℤ) := h₃ 2015
  have h₆ : a (2015 % 20) % (181 : ℤ) = 0 := by
    norm_num [abase, arec, Int.mul_emod, Int.sub_emod] at h₅ ⊢ <;> (try omega) <;> (try ring_nf at * <;> omega) <;>
        (try norm_num at * <;> omega) <;>
      (try {simp_all [Nat.mod_eq_of_lt] <;> omega
        })
  have h₇ : a 2015 % (181 : ℤ) = 0 := by
    rw [h₅]
    exact h₆
  exact h₇