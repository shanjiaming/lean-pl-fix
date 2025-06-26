import Mathlib

open RingHom Set Nat

/--
Let $p$ be a prime and $m \geq n$ be non-negative integers. Show that $\binom{pm}{pn} = \binom{m}{n} \pmod p$, where $\binom{m}{n}$ is the binomial coefficient.
-/
theorem putnam_1977_a5
(p m n : ℕ)
(hp : Nat.Prime p)
(hmgen : m ≥ n)
: (choose (p * m) (p * n) ≡ choose m n [MOD p]) := by
  have h₁ : choose (p * m) (p * n) ≡ choose m n [MOD p] := by
    have h₂ : p > 0 := Nat.Prime.pos hp
    have h₃ : choose (p * m) (p * n) ≡ choose m n [MOD p] := by
      have h₄ : choose (0 + p * m) (0 + p * n) ≡ choose 0 0 * choose m n [MOD p] := by
        -- Apply Lucas' Theorem
        have h₅ : choose (0 + p * m) (0 + p * n) ≡ choose 0 0 * choose m n [MOD p] := by
          apply Nat.ModEq.symm
          apply Nat.ModEq.symm
          -- Use the version of Lucas' Theorem in Mathlib
          have h₆ : choose (0 + p * m) (0 + p * n) % p = (choose 0 0 * choose m n) % p := by
            have h₇ : p ≠ 0 := by linarith
            have h₈ : choose (0 + p * m) (0 + p * n) % p = (choose 0 0 * choose m n) % p := by
              -- Use the version of Lucas' Theorem in Mathlib
              rw [← Nat.mod_add_div (0 + p * m) p, ← Nat.mod_add_div (0 + p * n) p]
              simp [Nat.choose_eq_mul_choose_div_add_mod_mul, Nat.add_mul, Nat.mul_add, Nat.mul_assoc,
                Nat.mul_comm, Nat.mul_left_comm, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm,
                Nat.mod_eq_of_lt (Nat.Prime.one_lt hp)]
              <;>
              simp_all [Nat.Prime.ne_zero, Nat.Prime.pos, Nat.mod_eq_of_lt, Nat.div_eq_of_lt,
                Nat.mul_mod, Nat.add_mod, Nat.mod_mod]
              <;>
              ring_nf at *
              <;>
              norm_num
              <;>
              simp_all [Nat.Prime.ne_zero, Nat.Prime.pos, Nat.mod_eq_of_lt, Nat.div_eq_of_lt,
                Nat.mul_mod, Nat.add_mod, Nat.mod_mod]
              <;>
              ring_nf at *
              <;>
              norm_num
              <;>
              omega
            exact h₈
          exact h₆
        exact h₅
      have h₅ : choose 0 0 = 1 := by decide
      have h₆ : choose (0 + p * m) (0 + p * n) = choose (p * m) (p * n) := by simp
      have h₇ : choose 0 0 * choose m n = choose m n := by simp [h₅]
      rw [h₆] at h₄
      rw [h₇] at h₄
      exact h₄
    exact h₃
  exact h₁