theorem h2₃₆ (G : Type u_1) (inst✝ : Group G) (φ : G → G) (hφ : ∀ (g1 g2 g3 h1 h2 h3 : G), g1 * g2 * g3 = 1 ∧ h1 * h2 * h3 = 1 → φ g1 * φ g2 * φ g3 = φ h1 * φ h2 * φ h3) (ψ : G → G := fun g => (φ 1)⁻¹ * φ g) (x y : G) (h1 h2₁ : φ x * φ y * φ (x * y)⁻¹ = φ 1 * φ 1 * φ 1) (h2₂ h2₃ : φ (x * y) * φ (x * y)⁻¹ * φ 1 = φ 1 * φ 1 * φ 1) (h2₄ : φ x * φ y * φ (x * y)⁻¹ = φ 1 * φ 1 * φ 1) (h2₅ h2₆ h2₇ : φ (x * y) * φ (x * y)⁻¹ * φ 1 = φ x * φ y * φ (x * y)⁻¹) (h2₈ h2₉ h2₁₀ h2₁₁ h2₁₃ h2₁₄ h2₁₅ h2₁₇ h2₁₈ h2₁₉ : φ (x * y) * (φ (x * y)⁻¹ * φ 1) = φ x * φ y * φ (x * y)⁻¹) (h2₂₁ : φ 1 * φ 1 * φ 1 = φ 1 * φ 1 * φ 1) (h2₂₂ : φ x * φ y * φ (x * y)⁻¹ = φ 1 * φ 1 * φ 1) (h2₂₃ h2₂₄ h2₂₅ h2₂₇ h2₂₈ h2₂₉ h2₃₁ h2₃₂ h2₃₄ h2₃₅ : φ (x * y) * (φ (x * y)⁻¹ * φ 1) = φ x * φ y * φ (x * y)⁻¹) : φ (x * y) = φ x * φ y * (φ 1)⁻¹ := by
  calc
    φ (x * y) = φ (x * y) * 1 := by simp
    _ = φ (x * y) * ((φ ((x * y)⁻¹) * φ 1) * (φ ((x * y)⁻¹) * φ 1)⁻¹) := by group
    _ = (φ (x * y) * (φ ((x * y)⁻¹) * φ 1)) * (φ ((x * y)⁻¹) * φ 1)⁻¹ := by simp [mul_assoc]
    _ = (φ x * φ y * φ (x * y)⁻¹) * (φ ((x * y)⁻¹) * φ 1)⁻¹ := by rw [h2₃₅]
    _ = φ x * φ y * (φ (x * y)⁻¹ * (φ ((x * y)⁻¹) * φ 1)⁻¹) := by simp [mul_assoc]
    _ = φ x * φ y * (φ 1)⁻¹ :=
      by
      have h2₃₇ : φ (x * y)⁻¹ * (φ ((x * y)⁻¹) * φ 1)⁻¹ = (φ 1)⁻¹ :=
        by
        have h2₃₈ : φ (x * y)⁻¹ * (φ ((x * y)⁻¹) * φ 1)⁻¹ = (φ 1)⁻¹ := by
          calc
            φ (x * y)⁻¹ * (φ ((x * y)⁻¹) * φ 1)⁻¹ = φ (x * y)⁻¹ * ((φ ((x * y)⁻¹))⁻¹ * (φ 1)⁻¹) := by
              simp [mul_inv_rev, inv_inv]
            _ = (φ (x * y)⁻¹ * (φ ((x * y)⁻¹))⁻¹) * (φ 1)⁻¹ := by simp [mul_assoc]
            _ = 1 * (φ 1)⁻¹ := by simp [mul_right_inv]
            _ = (φ 1)⁻¹ := by simp
        exact h2₃₈
      rw [h2₃₇] <;> simp [mul_assoc]