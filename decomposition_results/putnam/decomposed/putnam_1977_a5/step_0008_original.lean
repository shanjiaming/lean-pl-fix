theorem h₈ (p m n : ℕ) (hp : Nat.Prime p) (hmgen : m ≥ n) (h₂ : p > 0) (h₇ : p ≠ 0) : (0 + p * m).choose (0 + p * n) % p = choose 0 0 * m.choose n % p :=
  by
  rw [← Nat.mod_add_div (0 + p * m) p, ← Nat.mod_add_div (0 + p * n) p]
  simp [Nat.choose_eq_mul_choose_div_add_mod_mul, Nat.add_mul, Nat.mul_add, Nat.mul_assoc, Nat.mul_comm,
                  Nat.mul_left_comm, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm,
                  Nat.mod_eq_of_lt (Nat.Prime.one_lt hp)] <;>
                simp_all [Nat.Prime.ne_zero, Nat.Prime.pos, Nat.mod_eq_of_lt, Nat.div_eq_of_lt, Nat.mul_mod,
                  Nat.add_mod, Nat.mod_mod] <;>
              ring_nf at * <;>
            norm_num <;>
          simp_all [Nat.Prime.ne_zero, Nat.Prime.pos, Nat.mod_eq_of_lt, Nat.div_eq_of_lt, Nat.mul_mod, Nat.add_mod,
            Nat.mod_mod] <;>
        ring_nf at * <;>
      norm_num <;>
    omega