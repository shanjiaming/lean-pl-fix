import Mathlib

open Nat Topology Filter

/--
Let $P(x)=c_nx^n+c_{n-1}x^{n-1}+\cdots+c_0$ be a polynomial with integer coefficients. Suppose that $r$ is a rational number such that $P(r)=0$. Show that the $n$ numbers $c_nr,\,c_nr^2+c_{n-1}r,\,c_nr^3+c_{n-1}r^2+c_{n-2}r,\dots,\,c_nr^n+c_{n-1}r^{n-1}+\cdots+c_1r$ are integers.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)

theorem putnam_2004_b1
(n : ℕ)
(P : Polynomial ℤ)
(r : ℚ)
(Pdeg : P.degree = n)
(Preq0 : Polynomial.aeval r P = 0)
: ∀ i ∈ Finset.range n, ∃ m : ℤ, (m : ℚ) = ∑ j in Finset.range (i + 1), ((P.coeff (n - j) : ℚ) * r ^ (i + 1 - j)) := by
  have h_main : ∀ i ∈ Finset.range n, ∃ m : ℤ, (m : ℚ) = ∑ j in Finset.range (i + 1), ((P.coeff (n - j) : ℚ) * r ^ (i + 1 - j)) := by
    intro i hi
    have h₁ : i < n := Finset.mem_range.mp hi
    have h₂ : i + 1 ≤ n := by hole_1
    
    
    have h₃ : ∃ (m : ℤ), (m : ℚ) = ∑ j in Finset.range (i + 1), ((P.coeff (n - j) : ℚ) * r ^ (i + 1 - j)) := by
      
      
      hole_2
    hole_3
  hole_4