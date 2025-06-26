import Mathlib

open Filter Topology Nat

-- (fun n : ℕ => (n)!, fun n : ℕ => 2 ^ n)
/--
Let $T_0=2,T_1=3,T_2=6$, and for $n \geq 3$, $T_n=(n+4)T_{n-1}-4nT_{n-2}+(4n-8)T_{n-3}$. The first few terms are $2,3,6,14,40,152,784,5168,40576$. Find, with proof, a formula for $T_n$ of the form $T_n=A_n+B_n$, where $\{A_n\}$ and $\{B_n\}$ are well-known sequences.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)

theorem putnam_1990_a1
    (T : ℕ → ℤ)
    (hT012 : T 0 = 2 ∧ T 1 = 3 ∧ T 2 = 6)
    (hTn : ∀ n, T (n + 3) = (n + 7) * T (n + 2) - 4 * (n + 3) * T (n + 1) + (4 * n + 4) * T n) :
    T = ((fun n : ℕ => (n)!, fun n : ℕ => 2 ^ n) : (ℕ → ℤ) × (ℕ → ℤ) ).1 + ((fun n : ℕ => (n)!, fun n : ℕ => 2 ^ n) : (ℕ → ℤ) × (ℕ → ℤ) ).2 := by
  have h_main : ∀ n : ℕ, T n = (n ! : ℤ) + (2 : ℤ) ^ n := by
    intro n
    have h₁ : T n = (n ! : ℤ) + (2 : ℤ) ^ n := by
      have h₂ : ∀ n : ℕ, T n = (n ! : ℤ) + (2 : ℤ) ^ n := by
        hole_1
      hole_2
    hole_3
  
  have h_final : T = ((fun n : ℕ => (n)!, fun n : ℕ => 2 ^ n) : (ℕ → ℤ) × (ℕ → ℤ) ).1 + ((fun n : ℕ => (n)!, fun n : ℕ => 2 ^ n) : (ℕ → ℤ) × (ℕ → ℤ) ).2 := by
    have h₁ : T = (fun n : ℕ => (n ! : ℤ) + (2 : ℤ) ^ n) := by
      hole_4
    hole_5
  
  hole_6