theorem integral_of_power_function (p : ℝ) (hp : p ≠ -1) : ∫ (x : ℝ) in Set.Icc 0 1, x ^ p = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) :=
  by
  have h₀ : (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) := by sorry
  have h₁ : ∫ x in Set.Icc 0 1, (x : ℝ) ^ p = (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) := by sorry
  rw [h₁, h₀] <;> (try simp_all [hp, sub_eq_add_neg]) <;> (try ring_nf at hp ⊢) <;>
        (try field_simp [hp, sub_eq_zero, add_eq_zero_iff_eq_neg]) <;>
      (try norm_num) <;>
    (try linarith)