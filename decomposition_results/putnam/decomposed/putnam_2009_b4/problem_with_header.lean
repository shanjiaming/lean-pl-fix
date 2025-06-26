import Mathlib

open intervalIntegral MvPolynomial Real

-- 2020050
/--
Say that a polynomial with real coefficients in two variables, $x,y$, is \emph{balanced} if the average value of the polynomial on each circle centered at the origin is $0$. The balanced polynomials of degree at most $2009$ form a vector space $V$ over $\mathbb{R}$. Find the dimension of $V$.
-/
theorem putnam_2009_b4
    (IsBalanced : MvPolynomial (Fin 2) ℝ → Prop)
    (IsBalanced_def : ∀ P, IsBalanced P ↔ ∀ r > 0,
      (∫ t in (0 : ℝ)..(2 * π), eval ![r * cos t, r * sin t] P) / (2 * π * r) = 0)
    (V : Submodule ℝ (MvPolynomial (Fin 2) ℝ))
    (V_def : ∀ P, P ∈ V ↔ IsBalanced P ∧ P.totalDegree ≤ 2009) :
    Module.rank ℝ V = ((2020050) : ℕ ) := by
  have h_main : Module.rank ℝ V = ((2020050) : ℕ) := by
    classical
    have h₁ : V = ⊥ := by
      apply Submodule.ext
      intro P
      rw [V_def]
      constructor
      · intro h
        have h₂ : IsBalanced P := h.1
        have h₃ : P.totalDegree ≤ 2009 := h.2
        have h₄ : P = 0 := by
          by_contra h₅
          have h₆ := h₂
          rw [IsBalanced_def] at h₆
          have h₇ := h₆ 1 (by norm_num)
          have h₈ := h₆ 2 (by norm_num)
          have h₉ := h₆ 3 (by norm_num)
          -- Normalize the expressions and use the fact that P is not zero to derive a contradiction.
          norm_num at h₇ h₈ h₉
          <;>
          (try contradiction) <;>
          (try
            {
              simp_all [MvPolynomial.eval_zero, MvPolynomial.totalDegree_zero]
              <;>
              norm_num
              <;>
              linarith
            }) <;>
          (try
            {
              exfalso
              -- Use the fact that P is not zero to derive a contradiction.
              have h₁₀ : P ≠ 0 := h₅
              have h₁₁ : ∃ (d : ℕ), d ≤ 2009 ∧ P.totalDegree = d := by
                use P.totalDegree
                <;>
                (try simp_all) <;>
                (try omega)
              rcases h₁₁ with ⟨d, h₁₂, h₁₃⟩
              have h₁₄ : P.totalDegree ≤ 2009 := by
                linarith
              have h₁₅ : P ≠ 0 := h₅
              -- Use the fact that P is not zero to derive a contradiction.
              simp_all [MvPolynomial.eval_zero, MvPolynomial.totalDegree_zero]
              <;>
              norm_num
              <;>
              linarith
            })
          <;>
          (try
            {
              exfalso
              -- Use the fact that P is not zero to derive a contradiction.
              have h₁₀ : P ≠ 0 := h₅
              have h₁₁ : ∃ (d : ℕ), d ≤ 2009 ∧ P.totalDegree = d := by
                use P.totalDegree
                <;>
                (try simp_all) <;>
                (try omega)
              rcases h₁₁ with ⟨d, h₁₂, h₁₃⟩
              have h₁₄ : P.totalDegree ≤ 2009 := by
                linarith
              have h₁₅ : P ≠ 0 := h₅
              -- Use the fact that P is not zero to derive a contradiction.
              simp_all [MvPolynomial.eval_zero, MvPolynomial.totalDegree_zero]
              <;>
              norm_num
              <;>
              linarith
            })
          <;>
          (try
            {
              exfalso
              -- Use the fact that P is not zero to derive a contradiction.
              have h₁₀ : P ≠ 0 := h₅
              have h₁₁ : ∃ (d : ℕ), d ≤ 2009 ∧ P.totalDegree = d := by
                use P.totalDegree
                <;>
                (try simp_all) <;>
                (try omega)
              rcases h₁₁ with ⟨d, h₁₂, h₁₃⟩
              have h₁₄ : P.totalDegree ≤ 2009 := by
                linarith
              have h₁₅ : P ≠ 0 := h₅
              -- Use the fact that P is not zero to derive a contradiction.
              simp_all [MvPolynomial.eval_zero, MvPolynomial.totalDegree_zero]
              <;>
              norm_num
              <;>
              linarith
            })
        simp_all [MvPolynomial.eval_zero, MvPolynomial.totalDegree_zero]
        <;>
        norm_num
        <;>
        linarith
      · intro h
        have h₂ : P = 0 := by simpa using h
        have h₃ : IsBalanced P := by
          rw [IsBalanced_def]
          intro r hr
          have h₄ : P = 0 := by simpa using h₂
          rw [h₄]
          simp [MvPolynomial.eval_zero]
          <;>
          norm_num
          <;>
          linarith
        have h₄ : P.totalDegree ≤ 2009 := by
          have h₅ : P = 0 := by simpa using h₂
          rw [h₅]
          simp [MvPolynomial.totalDegree_zero]
          <;>
          norm_num
          <;>
          linarith
        exact ⟨h₃, h₄⟩
    rw [h₁]
    simp [Module.rank_bot]
    <;>
    norm_num
    <;>
    linarith
  exact h_main