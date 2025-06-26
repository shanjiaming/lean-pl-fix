import Mathlib

/--
Let $A$ be the real $n \times n$ matrix $(a_{ij})$ where $a_{ij} = a$ for $i < j$, $b \; (\neq a)$ for $i > j$, and $c_i$ for $i = j$. Show that $\det A = \frac{b p(a) - a p(b)}{b - a}$, where $p(x) = \prod_{i=1}^n (c_i - x)$.
-/
theorem putnam_1978_a2
(n : ℕ)
(npos : n > 0)
(a b : ℝ)
(hab : a ≠ b)
(c : Fin n → ℝ)
(A : Matrix (Fin n) (Fin n) ℝ)
(hA : A = fun i j ↦ ite (i < j) a (ite (i > j) b (c i)))
(p : ℝ → ℝ)
(hp : p = fun x ↦ ∏ i : Fin n, (c i - x))
: (A.det = ((b * p a - a * p b) / (b - a))) := by
  have h₁ : A.det = ((b * p a - a * p b) / (b - a)) := by
    rw [hA]
    rw [hp]
    have h₂ : n ≥ 1 := by linarith
    -- Base case: when n = 1
    cases n with
    | zero =>
      exfalso
      linarith
    | succ n =>
      cases n with
      | zero =>
        -- When n = 1, we need to compute the determinant of a 1x1 matrix
        simp [Fin.prod_univ_succ, Matrix.det_fin_one]
        <;>
        field_simp [sub_ne_zero.mpr hab]
        <;>
        ring
      | succ n =>
        -- For n ≥ 2, we use the formula for the determinant
        simp_all [Fin.prod_univ_succ, Matrix.det_succ_row_zero, Fin.sum_univ_succ, Fin.succ_zero_eq_one,
          Fin.succ_one_eq_two]
        <;>
        field_simp [sub_ne_zero.mpr hab]
        <;>
        ring
        <;>
        simp_all [Fin.prod_univ_succ, Matrix.det_succ_row_zero, Fin.sum_univ_succ, Fin.succ_zero_eq_one,
          Fin.succ_one_eq_two]
        <;>
        linarith
  exact h₁