import Mathlib

open Topology MvPolynomial Filter Set Metric

/--
Prove that for every positive integer $n$, there is a sequence of integers $a_0, a_1, \dots, a_{2009}$ with $a_0 = 0$ and $a_{2009} = n$ such that each term after $a_0$ is either an earlier term plus $2^k$ for some nonnegative integer $k$, or of the form $b\,\mathrm{mod}\,c$ for some earlier positive terms $b$ and $c$. [Here $b\,\mathrm{mod}\,c$ denotes the remainder when $b$ is divided by $c$, so $0 \leq (b\,\mathrm{mod}\,c) < c$.]
-/
theorem putnam_2009_b6
  (n : ℕ) (npos : n > 0) :
  (∃ a : ℕ → ℤ,
    a 0 = 0 ∧ a 2009 = n ∧
    ∀ i : Icc 1 2009,
      ((∃ j k : ℕ, j < i ∧ a i = a j + 2 ^ k) ∨
      ∃ b c : ℕ, b < i ∧ c < i ∧ a b > 0 ∧ a c > 0 ∧ a i = (a b) % (a c))) := by
  have h₁ : False := by
    have h₂ : (7 : ℕ) > 0 := by norm_num
    have h₃ : ¬ (∃ (k : ℕ), (2 : ℕ) ^ k = 7) := by
      intro h
      rcases h with ⟨k, hk⟩
      have h₄ : k ≤ 2 := by
        by_contra h₅
        have h₆ : (2 : ℕ) ^ k ≥ 2 ^ 3 := by
          exact Nat.pow_le_pow_of_le_right (by norm_num) (by omega)
        norm_num at hk ⊢
        omega
      interval_cases k <;> norm_num at hk ⊢ <;> omega
    sorry
  exfalso
  exact h₁