theorem h10 (x : ℝ) (h2 : ∫ (x : ℝ), Real.sin x ^ 3 * Real.cos x ^ 6 = ∫ (x : ℝ), Real.sin x * Real.cos x ^ 6 - Real.sin x * Real.cos x ^ 8) (h3 :  ∫ (x : ℝ), Real.sin x * Real.cos x ^ 6 - Real.sin x * Real.cos x ^ 8 =    (∫ (x : ℝ), Real.sin x * Real.cos x ^ 6) - ∫ (x : ℝ), Real.sin x * Real.cos x ^ 8) (h7 : HasDerivAt (fun x => Real.cos x) (-Real.sin x) x) (h8 : HasDerivAt (fun x => Real.cos x ^ 7) (7 * Real.cos x ^ 6 * -Real.sin x) x) : HasDerivAt (fun x => -(Real.cos x ^ 7 / 7)) (Real.sin x * Real.cos x ^ 6) x := by
  convert HasDerivAt.div_const (HasDerivAt.neg h8) 7 using 1 <;> ring_nf <;> simp [Real.sin_sq, Real.cos_sq] <;>
            ring_nf <;>
          field_simp <;>
        ring_nf <;>
      simp [Real.sin_sq, Real.cos_sq] <;>
    ring_nf