import Mathlib

open Set

-- True
/--
A not uncommon calculus mistake is to believe that the product rule for derivatives says that $(fg)' = f'g'$. If $f(x)=e^{x^2}$, determine, with proof, whether there exists an open interval $(a,b)$ and a nonzero function $g$ defined on $(a,b)$ such that this wrong product rule is true for $x$ in $(a,b)$.
-/
theorem putnam_1988_a2
    (f : ℝ → ℝ)
    (hf : f = fun x ↦ Real.exp (x ^ 2)) :
    ((True) : Prop ) ↔
    (∃ a b : ℝ,
      a < b ∧
      ∃ g : ℝ → ℝ,
        (∃ x ∈ Ioo a b, g x ≠ 0) ∧
        DifferentiableOn ℝ g (Ioo a b) ∧
        ∀ x ∈ Ioo a b, deriv (fun y ↦ f y * g y) x = (deriv f x) * (deriv g x)) := by
  have h_main : (∃ (a b : ℝ), a < b ∧ ∃ (g : ℝ → ℝ), (∃ x ∈ Ioo a b, g x ≠ 0) ∧ DifferentiableOn ℝ g (Ioo a b) ∧ ∀ x ∈ Ioo a b, deriv (fun y ↦ f y * g y) x = (deriv f x) * (deriv g x)) := by
    use 3 / 4, 5 / 4
    constructor
    · norm_num
    · -- Define g(x) = e^x * sqrt(2x - 1)
      have h₁ : (3 / 4 : ℝ) < (5 / 4 : ℝ) := by norm_num
      have h₂ : ∀ x : ℝ, x ∈ Ioo (3 / 4 : ℝ) (5 / 4 : ℝ) → (2 * x - 1 : ℝ) > 0 := by
        intro x hx
        have h₃ : (3 / 4 : ℝ) < x := by exact hx.1
        have h₄ : x < (5 / 4 : ℝ) := by exact hx.2
        norm_num at h₃ h₄ ⊢
        linarith
      -- Define g(x) = e^x * sqrt(2x - 1)
      use fun x => Real.exp x * Real.sqrt (2 * x - 1)
      constructor
      · -- Prove that g is non-zero somewhere
        use 1
        constructor
        · -- Prove that 1 is in the interval (3/4, 5/4)
          norm_num [Ioo]
        · -- Prove that g(1) ≠ 0
          have h₃ : Real.exp 1 * Real.sqrt (2 * (1 : ℝ) - 1) ≠ 0 := by
            have h₄ : Real.exp 1 > 0 := Real.exp_pos 1
            have h₅ : Real.sqrt (2 * (1 : ℝ) - 1) > 0 := by
              apply Real.sqrt_pos_of_pos
              norm_num
            positivity
          simpa using h₃
      · constructor
        · -- Prove that g is differentiable on (3/4, 5/4)
          have h₃ : DifferentiableOn ℝ (fun x : ℝ => Real.exp x * Real.sqrt (2 * x - 1)) (Ioo (3 / 4 : ℝ) (5 / 4 : ℝ)) := by
            have h₄ : ∀ x ∈ Ioo (3 / 4 : ℝ) (5 / 4 : ℝ), HasDerivAt (fun x : ℝ => Real.exp x * Real.sqrt (2 * x - 1)) (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1)))) x := by
              intro x hx
              have h₅ : (2 * x - 1 : ℝ) > 0 := h₂ x hx
              have h₆ : HasDerivAt (fun x : ℝ => Real.exp x) (Real.exp x) x := Real.hasDerivAt_exp x
              have h₇ : HasDerivAt (fun x : ℝ => Real.sqrt (2 * x - 1)) (1 / (Real.sqrt (2 * x - 1))) x := by
                have h₈ : HasDerivAt (fun x : ℝ => 2 * x - 1) 2 x := by
                  simpa using (hasDerivAt_id x).const_mul 2 |>.sub_const 1
                have h₉ : HasDerivAt (fun x : ℝ => Real.sqrt (2 * x - 1)) (1 / (Real.sqrt (2 * x - 1))) x := by
                  convert Real.hasDerivAt_sqrt (by linarith) |>.comp x h₈ using 1
                  <;> field_simp [h₅.ne'] <;> ring
                exact h₉
              have h₁₀ : HasDerivAt (fun x : ℝ => Real.exp x * Real.sqrt (2 * x - 1)) (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1)))) x := by
                convert h₆.mul h₇ using 1 <;> ring
              exact h₁₀
            have h₅ : DifferentiableOn ℝ (fun x : ℝ => Real.exp x * Real.sqrt (2 * x - 1)) (Ioo (3 / 4 : ℝ) (5 / 4 : ℝ)) := by
              refine' fun x hx => (h₄ x hx).differentiableAt.differentiableWithinAt
            exact h₅
          exact h₃
        · -- Prove that (fg)' = f'g' on (3/4, 5/4)
          intro x hx
          have h₃ : x ∈ Ioo (3 / 4 : ℝ) (5 / 4 : ℝ) := hx
          have h₄ : (2 * x - 1 : ℝ) > 0 := h₂ x h₃
          have h₅ : deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x = (deriv f x) * (deriv (fun y : ℝ => Real.exp y * Real.sqrt (2 * y - 1)) x) := by
            have h₆ : f = fun x => Real.exp (x ^ 2) := hf
            have h₇ : deriv f x = 2 * x * Real.exp (x ^ 2) := by
              rw [h₆]
              have h₈ : deriv (fun x : ℝ => Real.exp (x ^ 2)) x = 2 * x * Real.exp (x ^ 2) := by
                -- Use the chain rule to find the derivative of exp(x^2)
                have h₉ : HasDerivAt (fun x : ℝ => Real.exp (x ^ 2)) (2 * x * Real.exp (x ^ 2)) x := by
                  have h₁₀ : HasDerivAt (fun x : ℝ => x ^ 2) (2 * x) x := by
                    simpa using (hasDerivAt_pow 2 x)
                  have h₁₁ : HasDerivAt (fun x : ℝ => Real.exp (x ^ 2)) (Real.exp (x ^ 2) * (2 * x)) x := by
                    have h₁₂ : HasDerivAt (fun x : ℝ => x ^ 2) (2 * x) x := by
                      simpa using (hasDerivAt_pow 2 x)
                    have h₁₃ : HasDerivAt (fun x : ℝ => Real.exp (x ^ 2)) (Real.exp (x ^ 2) * (2 * x)) x := by
                      apply HasDerivAt.exp
                      exact h₁₂
                    exact h₁₃
                  convert h₁₁ using 1 <;> ring
                have h₁₄ : deriv (fun x : ℝ => Real.exp (x ^ 2)) x = 2 * x * Real.exp (x ^ 2) := by
                  apply HasDerivAt.deriv
                  exact h₉
                exact h₁₄
              exact h₈
            have h₈ : deriv (fun y : ℝ => Real.exp y * Real.sqrt (2 * y - 1)) x = Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1))) := by
              have h₉ : HasDerivAt (fun y : ℝ => Real.exp y * Real.sqrt (2 * y - 1)) (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1)))) x := by
                have h₁₀ : HasDerivAt (fun y : ℝ => Real.exp y) (Real.exp x) x := Real.hasDerivAt_exp x
                have h₁₁ : HasDerivAt (fun y : ℝ => Real.sqrt (2 * y - 1)) (1 / (Real.sqrt (2 * y - 1))) x := by
                  have h₁₂ : HasDerivAt (fun y : ℝ => 2 * y - 1) 2 x := by
                    simpa using (hasDerivAt_id x).const_mul 2 |>.sub_const 1
                  have h₁₃ : HasDerivAt (fun y : ℝ => Real.sqrt (2 * y - 1)) (1 / (Real.sqrt (2 * y - 1))) x := by
                    convert Real.hasDerivAt_sqrt (by linarith) |>.comp x h₁₂ using 1
                    <;> field_simp [h₄.ne'] <;> ring
                  exact h₁₃
                have h₁₄ : HasDerivAt (fun y : ℝ => Real.exp y * Real.sqrt (2 * y - 1)) (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1)))) x := by
                  convert h₁₀.mul h₁₁ using 1 <;> ring
                exact h₁₄
              have h₁₅ : deriv (fun y : ℝ => Real.exp y * Real.sqrt (2 * y - 1)) x = Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1))) := by
                apply HasDerivAt.deriv
                exact h₉
              exact h₁₅
            have h₉ : deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x = (deriv f x) * (deriv (fun y : ℝ => Real.exp y * Real.sqrt (2 * y - 1)) x) := by
              have h₁₀ : deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x = deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x := rfl
              rw [h₁₀]
              have h₁₁ : deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x = deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x := rfl
              rw [h₁₁]
              have h₁₂ : deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x = (deriv f x) * (Real.exp x * Real.sqrt (2 * x - 1)) + f x * (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1)))) := by
                have h₁₃ : deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x = deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x := rfl
                rw [h₁₃]
                have h₁₄ : deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x = (deriv f x) * (Real.exp x * Real.sqrt (2 * x - 1)) + f x * (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1)))) := by
                  have h₁₅ : HasDerivAt (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) ((deriv f x) * (Real.exp x * Real.sqrt (2 * x - 1)) + f x * (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1))))) x := by
                    have h₁₆ : HasDerivAt f (deriv f x) x := by
                      have h₁₇ : DifferentiableAt ℝ f x := by
                        rw [hf]
                        exact DifferentiableAt.exp (DifferentiableAt.pow differentiableAt_id 2)
                      exact h₁₇.hasDerivAt
                    have h₁₈ : HasDerivAt (fun y : ℝ => Real.exp y * Real.sqrt (2 * y - 1)) (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1)))) x := by
                      have h₁₉ : HasDerivAt (fun y : ℝ => Real.exp y) (Real.exp x) x := Real.hasDerivAt_exp x
                      have h₂₀ : HasDerivAt (fun y : ℝ => Real.sqrt (2 * y - 1)) (1 / (Real.sqrt (2 * y - 1))) x := by
                        have h₂₁ : HasDerivAt (fun y : ℝ => 2 * y - 1) 2 x := by
                          simpa using (hasDerivAt_id x).const_mul 2 |>.sub_const 1
                        have h₂₂ : HasDerivAt (fun y : ℝ => Real.sqrt (2 * y - 1)) (1 / (Real.sqrt (2 * y - 1))) x := by
                          convert Real.hasDerivAt_sqrt (by linarith) |>.comp x h₂₁ using 1
                          <;> field_simp [h₄.ne'] <;> ring
                        exact h₂₂
                      have h₂₃ : HasDerivAt (fun y : ℝ => Real.exp y * Real.sqrt (2 * y - 1)) (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1)))) x := by
                        convert h₁₉.mul h₂₀ using 1 <;> ring
                      exact h₂₃
                    have h₂₄ : HasDerivAt (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) ((deriv f x) * (Real.exp x * Real.sqrt (2 * x - 1)) + f x * (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1))))) x := by
                      have h₂₅ : HasDerivAt (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) ((deriv f x) * (Real.exp x * Real.sqrt (2 * x - 1)) + f x * (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1))))) x := by
                        convert h₁₆.mul h₁₈ using 1 <;> ring
                      exact h₂₅
                    exact h₂₄
                  have h₂₆ : deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x = (deriv f x) * (Real.exp x * Real.sqrt (2 * x - 1)) + f x * (Real.exp x * Real.sqrt (2 * x - 1) + Real.exp x * (1 / (Real.sqrt (2 * x - 1)))) := by
                    apply HasDerivAt.deriv
                    exact h₁₅
                  exact h₂₆
                exact h₁₄
              rw [h₁₄]
              <;> simp_all [hf, h₇, h₈]
              <;> field_simp [h₄.ne']
              <;> ring_nf
              <;> field_simp [h₄.ne']
              <;> ring_nf
              <;> norm_num
              <;> linarith
            exact h₉
          have h₆ : deriv (fun y : ℝ => f y * (Real.exp y * Real.sqrt (2 * y - 1))) x = (deriv f x) * (deriv (fun y : ℝ => Real.exp y * Real.sqrt (2 * y - 1)) x) := h₅
          simpa [hf] using h₆
  have h_final : ((True : Prop) ↔ (∃ (a b : ℝ), a < b ∧ ∃ (g : ℝ → ℝ), (∃ x ∈ Ioo a b, g x ≠ 0) ∧ DifferentiableOn ℝ g (Ioo a b) ∧ ∀ x ∈ Ioo a b, deriv (fun y ↦ f y * g y) x = (deriv f x) * (deriv g x))) := by
    constructor
    · intro _
      exact h_main
    · intro h
      trivial
  exact h_final