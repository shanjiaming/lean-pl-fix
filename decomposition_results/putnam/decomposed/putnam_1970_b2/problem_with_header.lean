import Mathlib

open Metric Set EuclideanGeometry Filter Topology

/--
Let $H$ be a polynomial of degree at most $3$ and $T$ be a positive real number. Show that the average value of $H(t)$ over the interval $[-T, T]$ equals the average of $H\left(-\frac{T}{\sqrt{3}}\right)$ and $H\left(\frac{T}{\sqrt{3}}\right)$.
-/
theorem putnam_1970_b2
(T : ℝ)
(H : Polynomial ℝ)
(hT : T > 0)
(hH : H.degree ≤ 3)
: (H.eval (-T / Real.sqrt 3) + H.eval (T / Real.sqrt 3))/2 = ⨍ t in Set.Icc (-T) T, H.eval t := by
  have h₁ : (H.eval (-T / Real.sqrt 3) + H.eval (T / Real.sqrt 3)) / 2 = Polynomial.eval 0 H + Polynomial.eval 0 (Polynomial.derivative (Polynomial.derivative H)) * (T ^ 2 / 6) := by
    have h₂ : H = Polynomial.C (H.coeff 0) + Polynomial.C (H.coeff 1) * Polynomial.X + Polynomial.C (H.coeff 2) * Polynomial.X ^ 2 + Polynomial.C (H.coeff 3) * Polynomial.X ^ 3 := by
      apply Polynomial.funext
      intro x
      simp [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X,
        Polynomial.coeff_add, Polynomial.coeff_mul, Polynomial.coeff_X_pow, Polynomial.coeff_C_mul]
      <;>
      rw [Polynomial.eval_eq_sum_range]
      <;>
      simp [Polynomial.coeff_add, Polynomial.coeff_mul, Polynomial.coeff_X_pow, Polynomial.coeff_C_mul, Finset.sum_range_succ]
      <;>
      ring_nf
      <;>
      norm_num
      <;>
      linarith [Polynomial.coeff_le_degree (p := H)]
    rw [h₂]
    simp [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X,
      Polynomial.derivative_add, Polynomial.derivative_mul, Polynomial.derivative_C, Polynomial.derivative_X,
      Polynomial.derivative_pow, Polynomial.derivative_X_pow]
    <;>
    field_simp [Real.sqrt_eq_iff_sq_eq, pow_two, pow_three, mul_assoc, mul_comm, mul_left_comm]
    <;>
    ring_nf
    <;>
    norm_num
    <;>
    field_simp [Real.sqrt_eq_iff_sq_eq, pow_two, pow_three, mul_assoc, mul_comm, mul_left_comm]
    <;>
    ring_nf
    <;>
    norm_num
    <;>
    linarith [Real.sqrt_nonneg 3]
  
  have h₂ : ⨍ t in Set.Icc (-T) T, H.eval t = Polynomial.eval 0 H + Polynomial.eval 0 (Polynomial.derivative (Polynomial.derivative H)) * (T ^ 2 / 6) := by
    have h₃ : (∫ t in Set.Icc (-T) T, H.eval t) = (∫ t in (-T : ℝ)..(T : ℝ), H.eval t) := by
      -- Prove that the integral over the interval is the same as the interval integral
      rw [intervalIntegral.integral_of_le (by linarith)]
      <;> simp [Set.Icc, Real.volume_Icc, Real.volume_Icc]
      <;> ring_nf
      <;> field_simp
      <;> linarith
    have h₄ : ∫ t in (-T : ℝ)..(T : ℝ), H.eval t = 2 * T * Polynomial.eval 0 H + Polynomial.eval 0 (Polynomial.derivative (Polynomial.derivative H)) * (T ^ 3 / 3) := by
      have h₅ : H = Polynomial.C (H.coeff 0) + Polynomial.C (H.coeff 1) * Polynomial.X + Polynomial.C (H.coeff 2) * Polynomial.X ^ 2 + Polynomial.C (H.coeff 3) * Polynomial.X ^ 3 := by
        apply Polynomial.funext
        intro x
        simp [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X,
          Polynomial.coeff_add, Polynomial.coeff_mul, Polynomial.coeff_X_pow, Polynomial.coeff_C_mul]
        <;>
        rw [Polynomial.eval_eq_sum_range]
        <;>
        simp [Polynomial.coeff_add, Polynomial.coeff_mul, Polynomial.coeff_X_pow, Polynomial.coeff_C_mul, Finset.sum_range_succ]
        <;>
        ring_nf
        <;>
        norm_num
        <;>
        linarith [Polynomial.coeff_le_degree (p := H)]
      rw [h₅]
      simp [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X,
        Polynomial.derivative_add, Polynomial.derivative_mul, Polynomial.derivative_C, Polynomial.derivative_X,
        Polynomial.derivative_pow, Polynomial.derivative_X_pow, intervalIntegral.integral_add, intervalIntegral.integral_mul_left,
        intervalIntegral.integral_add, intervalIntegral.integral_mul_left, intervalIntegral.integral_add, intervalIntegral.integral_mul_left]
      <;>
      simp_all [mul_assoc, mul_comm, mul_left_comm, pow_two, pow_three, mul_assoc, mul_comm, mul_left_comm]
      <;>
      norm_num
      <;>
      ring_nf
      <;>
      field_simp [Real.sqrt_eq_iff_sq_eq, pow_two, pow_three, mul_assoc, mul_comm, mul_left_comm]
      <;>
      ring_nf
      <;>
      norm_num
      <;>
      linarith [Real.sqrt_nonneg 3]
    have h₅ : (volume (Set.Icc (-T) T) : ℝ) = 2 * T := by
      -- Prove that the volume of the interval is 2T
      have h₅₁ : (volume (Set.Icc (-T) T) : ℝ) = ENNReal.toReal (ENNReal.ofReal (2 * T)) := by
        simp [Real.volume_Icc, hT.le]
        <;> ring_nf
        <;> field_simp
        <;> linarith
      rw [h₅₁]
      <;> simp [ENNReal.toReal_ofReal, hT.le]
      <;> ring_nf
      <;> field_simp
      <;> linarith
    -- Combine the results to get the final average value
    calc
      ⨍ t in Set.Icc (-T) T, H.eval t = (∫ t in Set.Icc (-T) T, H.eval t) / (volume (Set.Icc (-T) T)) := by
        rw [MeasureTheory.integral_average]
        <;> simp_all [Real.volume_Icc, hT.le]
        <;> ring_nf
        <;> field_simp
        <;> linarith
      _ = (∫ t in (-T : ℝ)..(T : ℝ), H.eval t) / (2 * T) := by
        rw [h₃, h₅]
        <;> ring_nf
        <;> field_simp
        <;> linarith
      _ = (2 * T * Polynomial.eval 0 H + Polynomial.eval 0 (Polynomial.derivative (Polynomial.derivative H)) * (T ^ 3 / 3)) / (2 * T) := by
        rw [h₄]
        <;> ring_nf
        <;> field_simp
        <;> linarith
      _ = Polynomial.eval 0 H + Polynomial.eval 0 (Polynomial.derivative (Polynomial.derivative H)) * (T ^ 2 / 6) := by
        have h₆ : T ≠ 0 := by linarith
        field_simp [h₆]
        <;> ring_nf
        <;> field_simp [h₆]
        <;> ring_nf
        <;> linarith
      _ = Polynomial.eval 0 H + Polynomial.eval 0 (Polynomial.derivative (Polynomial.derivative H)) * (T ^ 2 / 6) := by rfl
  
  have h₃ : (H.eval (-T / Real.sqrt 3) + H.eval (T / Real.sqrt 3))/2 = ⨍ t in Set.Icc (-T) T, H.eval t := by
    rw [h₁, h₂]
    <;>
    ring_nf
    <;>
    field_simp [Real.sqrt_eq_iff_sq_eq, pow_two, pow_three, mul_assoc, mul_comm, mul_left_comm]
    <;>
    ring_nf
    <;>
    norm_num
    <;>
    linarith [Real.sqrt_nonneg 3]
  
  rw [h₃]
  <;>
  ring_nf
  <;>
  field_simp [Real.sqrt_eq_iff_sq_eq, pow_two, pow_three, mul_assoc, mul_comm, mul_left_comm]
  <;>
  ring_nf
  <;>
  norm_num
  <;>
  linarith [Real.sqrt_nonneg 3]