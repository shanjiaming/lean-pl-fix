import Mathlib

open Polynomial Filter Topology Real Set Nat List

-- 5 / 6
/--
Find the smallest constant $C$ such that for every real polynomial $P(x)$ of degree $3$ that has a root in the interval $[0,1]$,
\[
\int_0^1 \left| P(x) \right|\,dx \leq C \max_{x \in [0,1]} \left| P(x) \right|.
\]
-/
theorem putnam_2016_a6
  (p : ℝ → Prop)
  (hp : ∀ c, p c ↔
          ∀ P : Polynomial ℝ, P.degree = 3 →
          (∃ x ∈ Icc 0 1, P.eval x = 0) →
          ∫ x in (0)..1, |P.eval x| ≤ c * (sSup {y | ∃ x ∈ Icc 0 1, y = |P.eval x|})) :
  IsLeast p ((5 / 6) : ℝ) := by
  have h₀ : p (5 / 6) := by
    rw [hp]
    intro P h_deg h_root
    have h₁ : ∫ x in (0)..1, |P.eval x| ≤ (5 / 6 : ℝ) * (sSup {y | ∃ x ∈ Icc 0 1, y = |P.eval x|}) := by
      sorry
    exact h₁
  
  have h₁ : ∀ c, p c → (5 / 6 : ℝ) ≤ c := by
    intro c hc
    by_contra h
    have h₂ : c < 5 / 6 := by linarith
    have h₃ : ¬p c := by
      rw [hp] at hc
      -- Use the polynomial P(x) = x(1 - x)(1 - 2x) to show that p(c) is false for c < 5/6
      have h₄ : ∃ (P : Polynomial ℝ), P.degree = 3 ∧ (∃ x ∈ Icc 0 1, P.eval x = 0) ∧ ¬(∫ x in (0)..1, |P.eval x| ≤ c * (sSup {y | ∃ x ∈ Icc 0 1, y = |P.eval x|})) := by
        use (Polynomial.C (18 / (Real.sqrt 3)) * (Polynomial.X * (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C (1 / 2))))
        constructor
        · -- Prove that the degree of P is 3
          norm_num [Polynomial.degree_mul, Polynomial.degree_X, Polynomial.degree_sub_le, Polynomial.degree_one,
            Polynomial.degree_C, Polynomial.degree_mul, Polynomial.degree_X, Polynomial.degree_sub_le,
            Polynomial.degree_one, Polynomial.degree_C, Polynomial.degree_mul, Polynomial.degree_X,
            Polynomial.degree_sub_le, Polynomial.degree_one, Polynomial.degree_C]
          <;>
          ring_nf <;>
          norm_num <;>
          try
            simp_all [Polynomial.degree_eq_natDegree] <;>
            norm_num <;>
            linarith
        · constructor
          · -- Prove that P has a root in [0, 1]
            use 0
            constructor
            · -- Prove that 0 is in [0, 1]
              norm_num
            · -- Prove that P(0) = 0
              norm_num [Polynomial.eval_mul, Polynomial.eval_sub, Polynomial.eval_pow, Polynomial.eval_C,
                Polynomial.eval_X, Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_sub,
                Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X, Polynomial.eval_add]
              <;>
              ring_nf <;>
              norm_num
          · -- Prove that the integral condition does not hold for c < 5/6
            have h₅ : ¬(∫ x in (0)..1, |(Polynomial.C (18 / (Real.sqrt 3)) * (Polynomial.X * (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C (1 / 2)))).eval x| ≤ c * (sSup {y | ∃ x ∈ Icc 0 1, y = |(Polynomial.C (18 / (Real.sqrt 3)) * (Polynomial.X * (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C (1 / 2)))).eval x|})) := by
              intro h₅
              have h₆ : ∫ x in (0)..1, |(Polynomial.C (18 / (Real.sqrt 3)) * (Polynomial.X * (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C (1 / 2)))).eval x| ≤ c * (sSup {y | ∃ x ∈ Icc 0 1, y = |(Polynomial.C (18 / (Real.sqrt 3)) * (Polynomial.X * (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C (1 / 2)))).eval x|}) := h₅
              have h₇ : c < 5 / 6 := h₂
              have h₈ : ∫ x in (0)..1, |(Polynomial.C (18 / (Real.sqrt 3)) * (Polynomial.X * (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C (1 / 2)))).eval x| > c * (sSup {y | ∃ x ∈ Icc 0 1, y = |(Polynomial.C (18 / (Real.sqrt 3)) * (Polynomial.X * (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C (1 / 2)))).eval x|}) := by
                sorry
              linarith
            exact h₅
      -- Use the polynomial P(x) to show that p(c) is false for c < 5/6
      rcases h₄ with ⟨P, hP_deg, hP_root, hP_int⟩
      have h₅ := hc P hP_deg hP_root
      exact hP_int h₅
    exact h₃ hc
  have h₂ : IsLeast p ((5 / 6) : ℝ) := by
    refine' ⟨h₀, fun c hc => _⟩
    exact h₁ c hc
  
  apply h₂