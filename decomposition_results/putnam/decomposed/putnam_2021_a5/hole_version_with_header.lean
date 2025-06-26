import Mathlib

open Filter Topology

-- {j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)}
/--
Let $A$ be the set of all integers $n$ such that $1 \leq n \leq 2021$ and $\gcd(n,2021)=1$. For every nonnegative integer $j$, let $S(j)=\sum_{n \in A}n^j$. Determine all values of $j$ such that $S(j)$ is a multiple of $2021$.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)

theorem putnam_2021_a5
  (j : ℕ)
  (A : Finset ℕ)
  (S : ℕ → ℕ)
  (hA : A = {n | 1 ≤ n ∧ n ≤ 2021 ∧ Nat.gcd n 2021 = 1})
  (hS : ∀ j' : ℕ, S j' = ∑ n in A, n ^ j') :
  (2021 ∣ S j) ↔ j ∈ (({j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)}) : Set ℕ ) := by
  have h₁ : (2021 ∣ S j) → j ∈ ({j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)} : Set ℕ) := by
    intro h
    have h₂ := hA
    have h₃ := hS
    have h₄ : A = {n | 1 ≤ n ∧ n ≤ 2021 ∧ Nat.gcd n 2021 = 1} := hA
    have h₅ : ∀ j' : ℕ, S j' = ∑ n in A, n ^ j' := hS
    
    hole_1
  
  have h₂ : j ∈ ({j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)} : Set ℕ) → (2021 ∣ S j) := by
    intro h
    have h₂ := hA
    have h₃ := hS
    have h₄ : A = {n | 1 ≤ n ∧ n ≤ 2021 ∧ Nat.gcd n 2021 = 1} := hA
    have h₅ : ∀ j' : ℕ, S j' = ∑ n in A, n ^ j' := hS
    
    hole_2
  
  have h_main : (2021 ∣ S j) ↔ j ∈ (({j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)}) : Set ℕ ) := by
    hole_3
  
  hole_4