theorem h10 (x : ℝ) (h2 : ∫ (x : ℝ), sin x ^ 3 * cos x ^ 6 = ∫ (x : ℝ), sin x * cos x ^ 6 - sin x * cos x ^ 8) (h3 : ∫ (x : ℝ), sin x * cos x ^ 6 - sin x * cos x ^ 8 = (∫ (x : ℝ), sin x * cos x ^ 6) - ∫ (x : ℝ), sin x * cos x ^ 8) (h7 : HasDerivAt (fun x => cos x) (-sin x) x) (h8 : HasDerivAt (fun x => cos x ^ 7) (7 * cos x ^ 6 * -sin x) x) : HasDerivAt (fun x => -(cos x ^ 7 / 7)) (sin x * cos x ^ 6) x := by
  convert HasDerivAt.div_const (HasDerivAt.neg h8) 7 using 1 <;> ring_nf <;> simp [Real.sin_sq, Real.cos_sq] <;>
            ring_nf <;>
          field_simp <;>
        ring_nf <;>
      simp [Real.sin_sq, Real.cos_sq] <;>
    ring_nf