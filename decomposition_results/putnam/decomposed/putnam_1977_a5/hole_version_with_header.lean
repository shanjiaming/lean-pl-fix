import Mathlib

open RingHom Set Nat

/--
Let $p$ be a prime and $m \geq n$ be non-negative integers. Show that $\binom{pm}{pn} = \binom{m}{n} \pmod p$, where $\binom{m}{n}$ is the binomial coefficient.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)

theorem putnam_1977_a5
(p m n : ℕ)
(hp : Nat.Prime p)
(hmgen : m ≥ n)
: (choose (p * m) (p * n) ≡ choose m n [MOD p]) := by
  have h₁ : choose (p * m) (p * n) ≡ choose m n [MOD p] := by
    have h₂ : p > 0 := Nat.Prime.pos hp
    have h₃ : choose (p * m) (p * n) ≡ choose m n [MOD p] := by
      have h₄ : choose (0 + p * m) (0 + p * n) ≡ choose 0 0 * choose m n [MOD p] := by
        
        have h₅ : choose (0 + p * m) (0 + p * n) ≡ choose 0 0 * choose m n [MOD p] := by
          apply Nat.ModEq.symm
          apply Nat.ModEq.symm
          
          have h₆ : choose (0 + p * m) (0 + p * n) % p = (choose 0 0 * choose m n) % p := by
            have h₇ : p ≠ 0 := by hole_1
            have h₈ : choose (0 + p * m) (0 + p * n) % p = (choose 0 0 * choose m n) % p := by
              
              hole_2
            hole_3
          hole_4
        hole_5
      have h₅ : choose 0 0 = 1 := by hole_6
      have h₆ : choose (0 + p * m) (0 + p * n) = choose (p * m) (p * n) := by hole_7
      have h₇ : choose 0 0 * choose m n = choose m n := by hole_8
      hole_9
    hole_10
  hole_11