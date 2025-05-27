theorem h₁₀ (n a b c d e f : ℕ) (h_product : a * b * c * d * e * f = n ^ 5) (h_consecutive : a + 1 = b ∧ b + 1 = c ∧ c + 1 = d ∧ d + 1 = e ∧ e + 1 = f) (h₁ : f = a + 5) (h₂ : a * b * c * d * e * f = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5)) (h : ¬a = 0) (h₄ : a ≥ 1) (h₅ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) = n ^ 5) (h₇ : n ≥ 1) (h₈ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) = n ^ 5) : 5 ∣ a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) :=
  by
  apply Nat.dvd_of_mod_eq_zero
  have h₁₁ : a % 5 = 0 ∨ a % 5 = 1 ∨ a % 5 = 2 ∨ a % 5 = 3 ∨ a % 5 = 4 := by sorry
  rcases h₁₁ with (h₁₁ | h₁₁ | h₁₁ | h₁₁ | h₁₁) <;>
            simp [h₁₁, Nat.mul_mod, Nat.add_mod, Nat.mod_mod, Nat.pow_succ, Nat.mod_eq_of_lt, Nat.succ_pos,
              Nat.zero_lt_succ, Nat.mod_self, Nat.mod_one, Nat.mod_zero] <;>
          norm_num <;>
        (try omega) <;>
      (try ring_nf at * <;> omega) <;>
    (try omega)