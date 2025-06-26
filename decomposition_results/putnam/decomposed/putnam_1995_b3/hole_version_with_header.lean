import Mathlib

open Filter Topology Real Nat

-- Note: Boosted the domain/range of digits_set to ℕ because of membership problems in Finset.range 10
-- fun n => if n = 1 then 45 else if n = 2 then 10 * 45^2 else 0
/--
To each positive integer with $n^{2}$ decimal digits, we associate the determinant of the matrix obtained by writing the digits in order across the rows. For example, for $n=2$, to the integer 8617 we associate $\det \left( \begin{array}{cc} 8 & 6 \ 1 & 7 \end{array} \right) = 50$. Find, as a function of $n$, the sum of all the determinants associated with $n^{2}$-digit integers. (Leading digits are assumed to be nonzero; for example, for $n=2$, there are 9000 determinants.)
-/
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)

theorem putnam_1995_b3
(n : ℕ)
(hn : n > 0)
(digits_set : Set (ℕ → ℕ))
(hdigits_set : digits_set = {f | f 0 ≠ 0 ∧ (∀ i : Fin (n ^ 2), f i ≤ 9) ∧ (∀ i ≥ n ^ 2, f i = 0)})
(digits_to_matrix : (ℕ → ℕ) → Matrix (Fin n) (Fin n) ℤ)
(hdigits_to_matrix : digits_to_matrix = fun f => (fun i j => f (i.1 * n + j.1)))
: ∑' f : digits_set, (digits_to_matrix f).det = ((fun n => if n = 1 then 45 else if n = 2 then 10 * 45^2 else 0) : ℕ → ℤ ) n := by
  have h_n1 : n = 1 → ∑' (f : digits_set), (digits_to_matrix f).det = 45 := by
    intro hn1
    have h₁ : digits_set = {f | f 0 ≠ 0 ∧ (∀ i : Fin (n ^ 2), f i ≤ 9) ∧ (∀ i ≥ n ^ 2, f i = 0)} := hdigits_set
    have h₂ : digits_to_matrix = fun f => (fun i j => f (i.1 * n + j.1)) := hdigits_to_matrix
    subst_vars
    
    
    
    have h₃ : ∑' (f : {f : ℕ → ℕ | f 0 ≠ 0 ∧ (∀ i : Fin (1 ^ 2), f i ≤ 9) ∧ (∀ i ≥ 1 ^ 2, f i = 0)}), ((fun f => (fun i j => f (i.1 * 1 + j.1)) : (ℕ → ℕ) → Matrix (Fin 1) (Fin 1) ℤ) f).det = 45 := by
      hole_7
      have h₂ := h_n_ge_3 h₁
      hole_22
  
  hole_23