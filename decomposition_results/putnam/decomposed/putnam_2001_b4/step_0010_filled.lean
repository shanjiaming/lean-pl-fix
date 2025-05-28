theorem h₁₁ (S : Set ℚ) (hS : S = univ \ {-1, 0, 1}) (f : ↑S → ↑S) (hf : ∀ (x : ↑S), ↑(f x) = ↑x - 1 / ↑x) (x : ↑S) (h : ∀ n ∈ Ici 1, x ∈ f^[n] '' univ) (h₃ : 1 ∈ Ici 1 → x ∈ f^[1] '' univ) (h₄ : 2 ∈ Ici 1 → x ∈ f^[2] '' univ) (y₁ : ↑S) (left✝¹ : y₁ ∈ univ) (hy₁ : f^[1] y₁ = x) (y₂ : ↑S) (left✝ : y₂ ∈ univ) (hy₂ : f^[2] y₂ = x) (h₇ : f y₁ = x) (h₈ : f (f y₂) = x) (h₉ : f y₁ = f (f y₂)) (h₁₀ : ↑(f y₁) = ↑(f (f y₂))) : ↑y₁ - 1 / ↑y₁ = ↑(f y₂) - 1 / ↑(f y₂) := by
  simp only [hf, Subtype.coe_mk] at h₁₀ ⊢ <;> field_simp [hf, Subtype.coe_mk] at h₁₀ ⊢ <;> ring_nf at h₁₀ ⊢ <;>
    nlinarith [sq_pos_of_ne_zero
        (show (y₁ : ℚ) ≠ 0 by
          intro h₁₂
          have h₁₃ := y₁.2
          simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₃ ⊢ <;> aesop),
      sq_pos_of_ne_zero
        (show (f y₂ : ℚ) ≠ 0 by
          intro h₁₂
          have h₁₃ := (f y₂).2
          simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₃ ⊢ <;> aesop)]
  hole