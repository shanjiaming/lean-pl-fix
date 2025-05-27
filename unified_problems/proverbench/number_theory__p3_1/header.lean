import Mathlib

/-
Let $n$ be the smallest positive integer satisfying the following system of congruences:
  \begin{align*}
  n &\equiv 2 \pmod{3} \\
  n &\equiv 3 \pmod{5} \\
  n &\equiv 1 \pmod{7}
  \end{align*}
  Then $n = 8$.
-/

open Int Nat

-- Define `congruence1`: n ≡ 2 (mod 3)
def congruence1 (n : ℕ) : Prop := n % 3 = 2

-- Define `congruence2`: n ≡ 3 (mod 5)
def congruence2 (n : ℕ) : Prop := n % 5 = 3

-- Define `congruence3`: n ≡ 1 (mod 7)
def congruence3 (n : ℕ) : Prop := n % 7 = 1

-- Prove `solve_congruence1_and_2`: The solution to the system of congruences n ≡ 2 (mod 3) and n ≡ 3 (mod 5) is n = 15m + 8