theorem integral_of_power_function (p : ℝ) (hp : p ≠ -1) :
∫ x in Set.Icc 0 1, x^p = (1^(p+1) - 0^(p+1)) / (p+1) := by
  have h₀ : (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) := by
    -- Use the previously established result `integral_rpow`
    have h₁ : (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) := by
      -- Use the `integral_rpow` lemma to simplify the integral
      rw [integral_rpow] <;> simp [hp]
      <;>
      (try simp_all [hp, sub_eq_add_neg]) <;>
      (try ring_nf at hp ⊢) <;>
      (try field_simp [hp, sub_eq_zero, add_eq_zero_iff_eq_neg]) <;>
      (try norm_num) <;>
      (try linarith)
    -- The result follows directly from the lemma
    exact h₁
  -- The integral over the interval [0, 1] is equal to the result obtained from the `integral_rpow` lemma
  have h₁ : ∫ x in Set.Icc 0 1, (x : ℝ) ^ p = (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) := by
    -- Use the fact that the integral over the interval [0, 1] is the same as the integral from 0 to 1
    simp [intervalIntegral.integral_congr]
    <;>
    (try simp_all [hp, sub_eq_add_neg]) <;>
    (try ring_nf at hp ⊢) <;>
    (try field_simp [hp, sub_eq_zero, add_eq_zero_iff_eq_neg]) <;>
    (try norm_num) <;>
    (try linarith)
  -- Combine the results to get the final theorem statement
  rw [h₁, h₀]
  <;>
  (try simp_all [hp, sub_eq_add_neg]) <;>
  (try ring_nf at hp ⊢) <;>
  (try field_simp [hp, sub_eq_zero, add_eq_zero_iff_eq_neg]) <;>
  (try norm_num) <;>
  (try linarith)