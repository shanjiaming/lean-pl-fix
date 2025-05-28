theorem h₃₅ (S : Set ℚ) (hS : S = univ \ {-1, 0, 1}) (f : ↑S → ↑S) (hf : ∀ (x : ↑S), ↑(f x) = ↑x - 1 / ↑x) (x : ↑S) (h : ∀ n ∈ Ici 1, x ∈ f^[n] '' univ) (h₃ : 1 ∈ Ici 1 → x ∈ f^[1] '' univ) (h₄ : 2 ∈ Ici 1 → x ∈ f^[2] '' univ) (y₁ : ↑S) (left✝¹ : y₁ ∈ univ) (hy₁ : f^[1] y₁ = x) (y₂ : ↑S) (left✝ : y₂ ∈ univ) (hy₂ : f^[2] y₂ = x) (h₇ : f y₁ = x) (h₈ : f (f y₂) = x) (h₉ : f y₁ = f (f y₂)) (h₁₀ : ↑(f y₁) = ↑(f (f y₂))) (h₁₁ : ↑y₁ - 1 / ↑y₁ = ↑(f y₂) - 1 / ↑(f y₂)) (h₁₂ h₁₃ : ↑y₁ = ↑(f y₂)) (h₁₄ : ↑(f y₁) = ↑y₁ - 1 / ↑y₁) (h₁₅ : ↑(f y₁) = ↑(f (f y₂))) (h₁₆ : ↑(f y₁) = ↑y₁ - 1 / ↑y₁) (h₁₇ : ↑y₁ - 1 / ↑y₁ = ↑(f y₂) - 1 / ↑(f y₂)) (h₁₈ h₁₉ : ↑y₁ = ↑(f y₂)) (h₂₀ : ↑(f y₂) = ↑y₂ - 1 / ↑y₂) (h₂₁ : ↑(f y₁) = ↑y₁ - 1 / ↑y₁) (h₂₂ : ↑x = ↑(f y₁)) (h₂₃ : ↑x = ↑y₁ - 1 / ↑y₁) (h₂₄ : ↑x = ↑(f y₂)) (h₂₅ : ↑x = ↑y₂ - 1 / ↑y₂) (h₂₆ : ↑y₁ = ↑y₂ - 1 / ↑y₂) (h₂₇ : ↑y₁ - 1 / ↑y₁ = ↑y₂ - 1 / ↑y₂) (h₂₈ : ↑(f y₁) = ↑(f y₂)) (h₂₉ : ↑(f y₁) = ↑y₁ - 1 / ↑y₁) (h₃₀ : ↑(f y₂) = ↑y₂ - 1 / ↑y₂) (h₃₁ h₃₃ : ↑x - 1 / ↑x = ↑x - 1 / ↑x) (h₃₄ : ↑x ≠ 0) : 1 / ↑x = 0 := by
  apply Eq.symm
  apply Eq.symm
  field_simp [h₃₄] at h₂₃ h₂₅ h₂₆ h₂₇ h₂₈ h₂₉ h₃₀ h₃₁ ⊢ <;>
    nlinarith [sq_pos_of_ne_zero
        (show (y₁ : ℚ) ≠ 0 by
          intro h₃₆
          have h₃₇ := y₁.2
          simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₃₇ ⊢ <;> aesop),
      sq_pos_of_ne_zero
        (show (y₂ : ℚ) ≠ 0 by
          intro h₃₆
          have h₃₇ := y₂.2
          simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₃₇ ⊢ <;> aesop)]