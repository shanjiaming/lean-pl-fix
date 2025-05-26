theorem h₁₃ (p : Polynomial ℝ) (hpdeg : p.degree = 1999) (h₃ : p ≠ 0) (h₅ :  ∫ (x : ℝ) in -1 ..1, ‖Polynomial.eval x p‖ ≥    ∫ (x : ℝ) in -1 ..1, if Polynomial.eval 0 p ≥ 0 then Polynomial.eval x p else -Polynomial.eval x p) (h₇ :  (∫ (x : ℝ) in -1 ..1, if Polynomial.eval 0 p ≥ 0 then Polynomial.eval x p else -Polynomial.eval x p) =    ∫ (x : ℝ) in -1 ..1, if Polynomial.eval 0 p ≥ 0 then Polynomial.eval x p else -Polynomial.eval x p) (h₉ : ¬Polynomial.eval 0 p ≥ 0) (h₁₀ :  (∫ (x : ℝ) in -1 ..1, if Polynomial.eval 0 p ≥ 0 then Polynomial.eval x p else -Polynomial.eval x p) =    ∫ (x : ℝ) in -1 ..1, -Polynomial.eval x p) (h₁₁ : ∫ (x : ℝ) in -1 ..1, -Polynomial.eval x p = -∫ (x : ℝ) in -1 ..1, Polynomial.eval x p) : ∫ (x : ℝ) in -1 ..1, Polynomial.eval x p = Polynomial.eval 1 p - Polynomial.eval (-1) p := by
  simp [Polynomial.eval_sub, Polynomial.eval_one, Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow,
              Polynomial.eval_C, Polynomial.eval_X] <;>
            ring_nf <;>
          simp [intervalIntegral.integral_comp_mul_left (fun x => x)] <;>
        ring_nf <;>
      simp [Polynomial.eval_sub, Polynomial.eval_one, Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow,
        Polynomial.eval_C, Polynomial.eval_X] <;>
    ring_nf