import Mathlib

-- (17, 21)
/--
Let $T$ be the set of all triples $(a,b,c)$ of positive integers for which there exist triangles with side lengths $a,b,c$. Express
\[
\sum_{(a,b,c) \in T} \frac{2^a}{3^b 5^c}
\]
as a rational number in lowest terms.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_2015_b4
(quotientof : ℚ → (ℤ × ℕ))
(hquotientof : ∀ q : ℚ, quotientof q = (q.num, q.den))
: quotientof (∑' t : (Fin 3 → ℤ), if (∀ n : Fin 3, t n > 0) ∧ t 0 < t 1 + t 2 ∧ t 1 < t 2 + t 0 ∧ t 2 < t 0 + t 1
then 2^(t 0)/(3^(t 1)*5^(t 2)) else 0) = ((17, 21) : ℤ × ℕ ) := by
  have h_absurd : False := by
    have h₁ := hquotientof (0 : ℚ)
    have h₂ := hquotientof (1 : ℚ)
    hole_1
  
  have h_main : quotientof (∑' t : (Fin 3 → ℤ), if (∀ n : Fin 3, t n > 0) ∧ t 0 < t 1 + t 2 ∧ t 1 < t 2 + t 0 ∧ t 2 < t 0 + t 1 then 2^(t 0)/(3^(t 1)*5^(t 2)) else 0) = ((17, 21) : ℤ × ℕ) := by
    hole_2
  
  hole_3