theorem h_main_backward (u v m : ℝ) (hu : 0 < u) (hv : 0 < v) (hm : 1 < m) (h_main_forward :  (∃ x > 0, ∃ y > 0, u * x + v * y = 1 ∧ x ^ m + y ^ m = 1 ∧ u = x ^ (m - 1) ∧ v = y ^ (m - 1)) →    ∃ n, u ^ n + v ^ n = 1 ∧ m⁻¹ + n⁻¹ = 1) : (∃ n, u ^ n + v ^ n = 1 ∧ m⁻¹ + n⁻¹ = 1) →
    ∃ x > 0, ∃ y > 0, u * x + v * y = 1 ∧ x ^ m + y ^ m = 1 ∧ u = x ^ (m - 1) ∧ v = y ^ (m - 1) :=
  by
  rintro ⟨n, hn1, hn2⟩
  have h₁ : 0 < m - 1 := by sorry
  have h₂ : n = m / (m - 1) := by sorry
  rw [h₂] at hn1
  have h₃ : 0 < u := by sorry
  have h₄ : 0 < v := by sorry
  have h₅ : 0 < m - 1 := by sorry
  have h₆ : 0 < m / (m - 1) := by sorry
  use u ^ (1 / (m - 1)), by apply Real.rpow_pos_of_pos h₃, v ^ (1 / (m - 1)), by apply Real.rpow_pos_of_pos h₄,
    by
    have h₇ : u * (u ^ (1 / (m - 1))) + v * (v ^ (1 / (m - 1))) = u ^ (m / (m - 1)) + v ^ (m / (m - 1)) :=
      by
      have h₇₁ : u * (u ^ (1 / (m - 1))) = u ^ (1 + 1 / (m - 1)) := by
        rw [← Real.rpow_add (by positivity : (0 : ℝ) < u)] <;> ring_nf
      have h₇₂ : v * (v ^ (1 / (m - 1))) = v ^ (1 + 1 / (m - 1)) := by
        rw [← Real.rpow_add (by positivity : (0 : ℝ) < v)] <;> ring_nf
      have h₇₃ : (1 : ℝ) + 1 / (m - 1) = m / (m - 1) := by
        field_simp [h₁.ne'] <;> ring_nf <;> field_simp [h₁.ne'] <;> ring_nf <;> linarith
      rw [h₇₁, h₇₂, h₇₃] <;> ring_nf
    have h₈ : u ^ (m / (m - 1)) + v ^ (m / (m - 1)) = 1 := by simpa [h₂] using hn1
    calc
      u * (u ^ (1 / (m - 1))) + v * (v ^ (1 / (m - 1))) = u ^ (m / (m - 1)) + v ^ (m / (m - 1)) := by rw [h₇]
      _ = 1 := by rw [h₈],
    by
    have h₇ : (u ^ (1 / (m - 1)) : ℝ) > 0 := by positivity
    have h₈ : (v ^ (1 / (m - 1)) : ℝ) > 0 := by positivity
    have h₉ : (u ^ (1 / (m - 1)) : ℝ) ^ m = u ^ (m / (m - 1)) :=
      by
      have h₉₁ : (u ^ (1 / (m - 1)) : ℝ) ^ m = u ^ ((1 / (m - 1)) * m) :=
        by
        rw [← Real.rpow_nat_cast]
        rw [← Real.rpow_mul (by positivity)] <;> ring_nf
      rw [h₉₁]
      have h₉₂ : (1 / (m - 1) : ℝ) * m = m / (m - 1) := by
        field_simp [h₁.ne'] <;> ring_nf <;> field_simp [h₁.ne'] <;> ring_nf <;> linarith
      rw [h₉₂] <;> ring_nf
    have h₁₀ : (v ^ (1 / (m - 1)) : ℝ) ^ m = v ^ (m / (m - 1)) :=
      by
      have h₁₀₁ : (v ^ (1 / (m - 1)) : ℝ) ^ m = v ^ ((1 / (m - 1)) * m) :=
        by
        rw [← Real.rpow_nat_cast]
        rw [← Real.rpow_mul (by positivity)] <;> ring_nf
      rw [h₁₀₁]
      have h₁₀₂ : (1 / (m - 1) : ℝ) * m = m / (m - 1) := by
        field_simp [h₁.ne'] <;> ring_nf <;> field_simp [h₁.ne'] <;> ring_nf <;> linarith
      rw [h₁₀₂] <;> ring_nf
    have h₁₁ : u ^ (m / (m - 1)) + v ^ (m / (m - 1)) = 1 := by simpa [h₂] using hn1
    calc
      (u ^ (1 / (m - 1)) : ℝ) ^ m + (v ^ (1 / (m - 1)) : ℝ) ^ m = u ^ (m / (m - 1)) + v ^ (m / (m - 1)) := by
        rw [h₉, h₁₀]
      _ = 1 := by rw [h₁₁],
    by
    have h₇ : u = (u ^ (1 / (m - 1))) ^ (m - 1) :=
      by
      have h₇₁ : (u ^ (1 / (m - 1)) : ℝ) > 0 := by positivity
      have h₇₂ : (u ^ (1 / (m - 1)) : ℝ) ^ (m - 1) = u ^ ((1 / (m - 1)) * (m - 1)) := by
        rw [← Real.rpow_mul (by positivity)] <;> ring_nf
      rw [h₇₂]
      have h₇₃ : (1 / (m - 1) : ℝ) * (m - 1) = 1 := by
        field_simp [h₁.ne'] <;> ring_nf <;> field_simp [h₁.ne'] <;> ring_nf <;> linarith
      rw [h₇₃] <;> simp <;> ring_nf <;> simp_all
    rw [h₇],
    by
    have h₇ : v = (v ^ (1 / (m - 1))) ^ (m - 1) :=
      by
      have h₇₁ : (v ^ (1 / (m - 1)) : ℝ) > 0 := by positivity
      have h₇₂ : (v ^ (1 / (m - 1)) : ℝ) ^ (m - 1) = v ^ ((1 / (m - 1)) * (m - 1)) := by
        rw [← Real.rpow_mul (by positivity)] <;> ring_nf
      rw [h₇₂]
      have h₇₃ : (1 / (m - 1) : ℝ) * (m - 1) = 1 := by
        field_simp [h₁.ne'] <;> ring_nf <;> field_simp [h₁.ne'] <;> ring_nf <;> linarith
      rw [h₇₃] <;> simp <;> ring_nf <;> simp_all
    rw [h₇]