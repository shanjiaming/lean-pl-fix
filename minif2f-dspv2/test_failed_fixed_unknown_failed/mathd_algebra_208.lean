import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the value of $\sqrt{1,\!000,\!000} - \sqrt[3]{1,\!000,\!000}$? Show that it is 900.-/
-- [OVERALL FIX FAILED]
theorem mathd_algebra_208 : Real.sqrt 1000000 - 1000000 ^ ((1 : ℝ) / 3) = 900:=
  by
  have h_sqrt : Real.sqrt 1000000 = 1000:= by
    rw [Real.sqrt_eq_iff_sq_eq (by positivity) (by positivity)]
    <;> norm_num
    <;> linarith
  
  have h_cbrt : (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 100:=
    by
    have h₁ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):=
      by
      have h₂ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = ((1 : ℝ) / 3) * Real.log (1000000 : ℝ):= by
        rw [Real.log_rpow (by norm_num : (1000000 : ℝ) > 0)] <;> ring_nf
      rw [h₂]
      have h₃ : Real.log (1000000 : ℝ) = Real.log ((100 : ℝ) ^ 3):= by norm_num
      rw [h₃]
      have h₄ : Real.log ((100 : ℝ) ^ 3) = 3 * Real.log (100 : ℝ):= by rw [Real.log_pow] <;> norm_num
      rw [h₄]
      ring_nf <;> field_simp [Real.log_mul, Real.log_pow] <;> ring_nf <;> norm_num
    have h₂ : (1000000 : ℝ) ^ ((1 : ℝ) / 3) > 0:= by positivity
    have h₃ : (100 : ℝ) > 0:= by norm_num
    have h₄ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):= by
      simpa using h₁
      <;> try simp_all [Real.log_rpow, Real.log_pow, Real.log_mul, Real.log_div, Real.log_one, Real.log_zero,
        Real.log_exp, Real.log_sqrt, Real.log_rpow]
      <;> try linarith
      <;> try nlinarith [Real.sqrt_nonneg 1000000]
      <;> try ring_nf at *
      <;> try nlinarith
    
    have h₅ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):= by
      have h₅ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ) := by
        have h₅₁ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ) := by
          rw [show (1000000 : ℝ) ^ ((1 : ℝ) / 3) = (100 : ℝ) by
            norm_num]
        rw [h₅₁]
      exact h₅
    
    have h₆ : (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 100:=
      by
      apply Real.log_injOn_pos (Set.mem_Ioi.mpr h₂) (Set.mem_Ioi.mpr (by norm_num [h₃]))
      <;> simp_all [Real.log_rpow, Real.log_pow]
      <;> ring_nf at *
      <;> norm_num at *
      <;> linarith
    
    rw [h₆] <;> norm_num
  have h_main : Real.sqrt 1000000 - (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 900:= by
    rw [h_sqrt]
    <;>
    simpa using h_cbrt
    <;>
    norm_num
    <;>
    linarith [Real.sqrt_nonneg 1000000]
  
  rw [h_main] <;> norm_num