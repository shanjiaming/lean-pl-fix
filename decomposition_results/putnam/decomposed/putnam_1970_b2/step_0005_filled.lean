theorem h₃ (T : ℝ) (H : Polynomial ℝ) (hT : T > 0) (hH : H.degree ≤ 3) (h₁ :  (Polynomial.eval (-T / √3) H + Polynomial.eval (T / √3) H) / 2 =    Polynomial.eval 0 H + Polynomial.eval 0 (Polynomial.derivative (Polynomial.derivative H)) * (T ^ 2 / 6)) : ∫ (t : ℝ) in Icc (-T) T, Polynomial.eval t H = ∫ (t : ℝ) in -T..T, Polynomial.eval t H := by
  --  --  rw [intervalIntegral.integral_of_le (by linarith)] <;> simp [Set.Icc, Real.volume_Icc, Real.volume_Icc] <;>
  --        ring_nf <;>
  --      field_simp <;>
    linarith
  hole