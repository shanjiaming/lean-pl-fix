theorem h₂₇ (k m : ℕ) (S : ℤ) (kpos : k > 0) (hm : m = 6 * k - 1) (hS h₁ : S = ∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(m.choose (3 * j - 1)) : ℤ)) (j : ℕ) (hj : j ∈ Finset.Icc 1 (2 * k - 1)) (h₃ h₄ : m = 6 * k - 1) (h₆ h₈ : m ≡ 2 [MOD 3]) (h₁₀ : m % 3 = 2) (h₁₁ : 3 * j - 1 ≤ m) (h₁₃ : m % 3 = 2) (h₁₄ : 3 * j - 1 ≤ m) (h₁₆ : m % 3 = 2) (h₁₇ : 3 * j - 1 ≤ m) (h₁₉ : m = 6 * k - 1) (h₂₀ : 3 * j - 1 ≤ m) (h₂₂ : m % 3 = 2) (h₂₃ : 3 * j - 1 ≤ m) (h₂₅ : m % 3 = 2) (h₂₆ : 3 * j - 1 ≤ m) : (↑(m.choose (3 * j - 1)) : ℤ) % 3 = (↑(choose 2 (3 * j - 1)) : ℤ) % 3 := by
  norm_num [Nat.choose_eq_zero_iff, Nat.ModEq, Nat.add_mod, Nat.mul_mod, Nat.mod_mod] at h₂₅ h₂₆ ⊢ <;> (try omega) <;>
      (try
          {rcases j with (_ | _ | _ | j) <;> rcases k with (_ | _ | _ | k) <;>
                norm_num [Nat.choose_succ_succ, Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.mul_zero,
                  Nat.add_zero] at * <;>
              ring_nf at * <;>
            omega
        }) <;>
    (try
        {rcases j with (_ | _ | _ | j) <;> rcases k with (_ | _ | _ | k) <;>
              norm_num [Nat.choose_succ_succ, Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.mul_zero,
                Nat.add_zero] at * <;>
            ring_nf at * <;>
          omega
      })