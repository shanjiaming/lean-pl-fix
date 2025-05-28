theorem putnam_1970_b2 (T : ℝ) (H : Polynomial ℝ) (hT : T > 0) (hH : H.degree ≤ 3) : (Polynomial.eval (-T / √3) H + Polynomial.eval (T / √3) H) / 2 = ⨍ (t : ℝ) in Icc (-T) T, Polynomial.eval t H :=
  by
  have h₁ :
    (H.eval (-T / Real.sqrt 3) + H.eval (T / Real.sqrt 3)) / 2 =
      Polynomial.eval 0 H + Polynomial.eval 0 (Polynomial.derivative (Polynomial.derivative H)) * (T ^ 2 / 6) := by sorry
  have h₂ :
    ⨍ t in Set.Icc (-T) T, H.eval t =
      Polynomial.eval 0 H + Polynomial.eval 0 (Polynomial.derivative (Polynomial.derivative H)) * (T ^ 2 / 6) := by sorry
  have h₃ : (H.eval (-T / Real.sqrt 3) + H.eval (T / Real.sqrt 3)) / 2 = ⨍ t in Set.Icc (-T) T, H.eval t := by sorry
  rw [h₃] <;> ring_nf <;>
          field_simp [Real.sqrt_eq_iff_sq_eq, pow_two, pow_three, mul_assoc, mul_comm, mul_left_comm] <;>
        ring_nf <;>
      norm_num <;>
    linarith [Real.sqrt_nonneg 3]