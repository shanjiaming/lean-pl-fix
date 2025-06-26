import Mathlib

open Polynomial

-- fun n => 2*n - 2
/--
Let $n$ be an integer with $n \geq 2$. Over all real polynomials $p(x)$ of degree $n$, what is the largest possible number of negative coefficients of $p(x)^2$?
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)

theorem putnam_2022_a2
(n : ℕ)
(hn : n ≥ 2)
(S : Set ℝ[X])
(hS : S = {P | natDegree P = n})
(negs : ℝ[X] → ℕ)
(hnegs : ∀ P : ℝ[X], negs P = ∑ i in Finset.range (P.natDegree + 1), if P.coeff i < 0 then 1 else 0)
: sSup {negs (P^2) | P ∈ S} = ((fun n => 2*n - 2) : ℕ → ℕ ) n := by
  have h₁ : sSup {negs (P^2) | P ∈ S} = (2 * n - 2 : ℕ) := by hole_1
  have h₂ : ((fun n => 2*n - 2) : ℕ → ℕ) n = (2 * n - 2 : ℕ) := by hole_2
  have h₃ : sSup {negs (P^2) | P ∈ S} = ((fun n => 2*n - 2) : ℕ → ℕ ) n := by hole_3
  hole_4