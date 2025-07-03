import Mathlib

open Nat Set

/--
Let $p(z)$ be a polynomial of degree $n$ all of whose zeros have absolute value $1$ in the complex plane. Put $g(z)=p(z)/z^{n/2}$. Show that all zeros of $g'(z)=0$ have absolute value $1$.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_2005_a3
    (p : Polynomial ℂ)
    (n : ℕ)
    (hn : 0 < n)
    (g : ℂ → ℂ)
    (pdeg : p.degree = n)
    (pzeros : ∀ z : ℂ, p.eval z = 0 → Complex.abs z = 1)
    (hg : ∀ z : ℂ, g z = (p.eval z) / z ^ ((n : ℂ) / 2))
    (z : ℂ)
    (hz : z ≠ 0 ∧ deriv g z = 0) :
    Complex.abs z = 1 := by
  have h₀ : p.eval z = 0 → Complex.abs z = 1 := by
    hole_1
  have h₁ : p.eval z = 0 → Complex.abs z = 1 := h₀
  
  by_cases h₂ : p.eval z = 0
  
  · exact h₁ h₂
  
  · have h₃ : False := by hole_2
    
    hole_3