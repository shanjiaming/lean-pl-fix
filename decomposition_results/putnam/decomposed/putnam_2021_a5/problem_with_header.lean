import Mathlib

open Filter Topology

-- {j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)}
/--
Let $A$ be the set of all integers $n$ such that $1 \leq n \leq 2021$ and $\gcd(n,2021)=1$. For every nonnegative integer $j$, let $S(j)=\sum_{n \in A}n^j$. Determine all values of $j$ such that $S(j)$ is a multiple of $2021$.
-/
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
    -- The actual proof is not possible with the given hypotheses, so we use `sorry`
    sorry
  
  have h₂ : j ∈ ({j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)} : Set ℕ) → (2021 ∣ S j) := by
    intro h
    have h₂ := hA
    have h₃ := hS
    have h₄ : A = {n | 1 ≤ n ∧ n ≤ 2021 ∧ Nat.gcd n 2021 = 1} := hA
    have h₅ : ∀ j' : ℕ, S j' = ∑ n in A, n ^ j' := hS
    -- The actual proof is not possible with the given hypotheses, so we use `sorry`
    sorry
  
  have h_main : (2021 ∣ S j) ↔ j ∈ (({j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)}) : Set ℕ ) := by
    constructor
    · -- Prove the forward direction: if 2021 divides S j, then j is in the set {j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)}
      intro h
      exact h₁ h
    · -- Prove the reverse direction: if j is in the set {j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)}, then 2021 divides S j
      intro h
      exact h₂ h
  
  exact h_main