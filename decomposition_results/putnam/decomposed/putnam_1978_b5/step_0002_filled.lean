theorem h_main₁ (S : Set ℝ[X]) (hS : S = {p | p.degree = 4 ∧ ∀ x ∈ Icc (-1) 1, eval x p ∈ Icc 0 1}) : 4 * X ^ 4 - 4 * X ^ 2 + 1 ∈ S :=
  by
  --  rw [hS]
  --  constructor
  ·
  --    norm_num [Polynomial.degree_X_pow, Polynomial.degree_add_eq_left_of_degree_lt,
  --        Polynomial.degree_sub_eq_left_of_degree_lt, Polynomial.degree_mul_X_pow, Polynomial.degree_C,
  --        Polynomial.degree_X_pow] <;>
  --      decide
  --  · intro x hx
    have h₁ : x ∈ Icc (-1 : ℝ) 1 := hx
    have h₂ : -1 ≤ x := by sorry
    have h₃ : x ≤ 1 := by sorry
  --    constructor
    ·
      have h₄ : 0 ≤ (x ^ 2 : ℝ) := by sorry
      have h₅ : x ^ 2 ≤ 1 := by sorry
      have h₆ : 0 ≤ (4 * x ^ 4 - 4 * x ^ 2 + 1 : ℝ) := by sorry
  --      norm_num at h₆ ⊢ <;>
  --          simp_all [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow,
  --            Polynomial.eval_C, Polynomial.eval_X] <;>
        nlinarith
    ·
      have h₄ : 0 ≤ (x ^ 2 : ℝ) := by sorry
      have h₅ : x ^ 2 ≤ 1 := by sorry
      have h₆ : (4 * x ^ 4 - 4 * x ^ 2 + 1 : ℝ) ≤ 1 := by sorry
  --      norm_num at h₆ ⊢ <;>
  --          simp_all [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow,
  --            Polynomial.eval_C, Polynomial.eval_X] <;>
        nlinarith
  hole