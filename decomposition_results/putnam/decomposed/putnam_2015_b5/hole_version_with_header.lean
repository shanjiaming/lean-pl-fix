import Mathlib

open Function

-- 4
/--
Let $P_n$ be the number of permutations $\pi$ of $\{1,2,\dots,n\}$ such that
\[
|i-j| = 1 \mbox{ implies } |\pi(i) -\pi(j)| \leq 2
\]
for all $i,j$ in $\{1,2,\dots,n\}$. Show that for $n \geq 2$, the quantity
\[
P_{n+5} - P_{n+4} - P_{n+3} + P_n
\]
does not depend on $n$, and find its value.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_2015_b5
(P : ℕ → ℕ)
(hP : P = fun n ↦ {pi : Finset.Icc 1 n → Finset.Icc 1 n | Bijective pi ∧ ∀ i j : Finset.Icc 1 n, Nat.dist i j = 1 → Nat.dist (pi i) (pi j) ≤ 2}.ncard)
: (∀ n : ℕ, n ≥ 2 →
    (P (n + 5) : ℤ) - (P (n + 4) : ℤ) - (P (n + 3) : ℤ) + (P n : ℤ) = ((4) : ℕ )) := by
  have h_main : False := by
    have h₁ := congr_fun hP 0
    have h₂ := congr_fun hP 1
    have h₃ := congr_fun hP 2
    have h₄ := congr_fun hP 3
    have h₅ := congr_fun hP 4
    have h₆ := congr_fun hP 5
    hole_1
  
  have h_result : (∀ (n : ℕ), n ≥ 2 → (P (n + 5) : ℤ) - (P (n + 4) : ℤ) - (P (n + 3) : ℤ) + (P n : ℤ) = ((4) : ℕ)) := by
    hole_2
  
  hole_3