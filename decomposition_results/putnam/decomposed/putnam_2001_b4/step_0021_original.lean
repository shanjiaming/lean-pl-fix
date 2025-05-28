theorem h₁₄ (S : Set ℚ) (hS : S = univ \ {-1, 0, 1}) (f : ↑S → ↑S) (hf : ∀ (x : ↑S), ↑(f x) = ↑x - 1 / ↑x) (x : ↑S) (h : ∀ n ∈ Ici 1, x ∈ f^[n] '' univ) (h₃ : 1 ∈ Ici 1 → x ∈ f^[1] '' univ) (h₄ : 2 ∈ Ici 1 → x ∈ f^[2] '' univ) (y₁ : ↑S) (left✝¹ : y₁ ∈ univ) (hy₁ : f^[1] y₁ = x) (y₂ : ↑S) (left✝ : y₂ ∈ univ) (hy₂ : f^[2] y₂ = x) (h₇ : f y₁ = x) (h₈ : f (f y₂) = x) (h₉ : f y₁ = f (f y₂)) (h₁₀ : ↑(f y₁) = ↑(f (f y₂))) (h₁₁ : ↑y₁ - 1 / ↑y₁ = ↑(f y₂) - 1 / ↑(f y₂)) (h₁₂ h₁₃✝ : ↑y₁ = ↑(f y₂)) (h₁₄ : ↑(f y₁) = ↑y₁ - 1 / ↑y₁) (h₁₅ : ↑(f y₁) = ↑(f (f y₂))) (h₁₆ : ↑(f y₁) = ↑y₁ - 1 / ↑y₁) (h₁₇ h₁₃ : ↑y₁ - 1 / ↑y₁ = ↑(f y₂) - 1 / ↑(f y₂)) : ↑y₁ = ↑(f y₂) := by
  by_cases h₁₅ : (y₁ : ℚ) = 0
  · exfalso
    have h₁₆ := y₁.2
    simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₆ ⊢ <;> aesop
  · by_cases h₁₆ : (f y₂ : ℚ) = 0
    · exfalso
      have h₁₇ := (f y₂).2
      simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₇ ⊢ <;> aesop
    ·
      have h₁₇ : (y₁ : ℚ) ≠ 0 := by sorry
      have h₁₈ : (f y₂ : ℚ) ≠ 0 := by sorry
      have h₁₉ : (y₁ : ℚ) * (f y₂ : ℚ) ≠ 0 := by sorry
      field_simp [h₁₇, h₁₈, h₁₉] at h₁₃
      nlinarith [sq_pos_of_ne_zero (show (y₁ : ℚ) ≠ 0 by assumption),
        sq_pos_of_ne_zero (show (f y₂ : ℚ) ≠ 0 by assumption)]