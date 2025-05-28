theorem h₁₄ (S : Set ℚ) (hS : S = univ \ {-1, 0, 1}) (f : ↑S → ↑S) (hf : ∀ (x : ↑S), ↑(f x) = ↑x - 1 / ↑x) (x : ↑S) (h : ∀ n ∈ Ici 1, x ∈ f^[n] '' univ) (h₃ : 1 ∈ Ici 1 → x ∈ f^[1] '' univ) (h₄ : 2 ∈ Ici 1 → x ∈ f^[2] '' univ) (y₁ : ↑S) (left✝¹ : y₁ ∈ univ) (hy₁ : f^[1] y₁ = x) (y₂ : ↑S) (left✝ : y₂ ∈ univ) (hy₂ : f^[2] y₂ = x) (h₇ : f y₁ = x) (h₈ : f (f y₂) = x) (h₉ : f y₁ = f (f y₂)) (h₁₀ : ↑(f y₁) = ↑(f (f y₂))) (h₁₁ : ↑y₁ - 1 / ↑y₁ = ↑(f y₂) - 1 / ↑(f y₂)) (h₁₂ h₁₃ : ↑y₁ = ↑(f y₂)) : ↑(f y₁) = ↑y₁ - 1 / ↑y₁ := by
  simp [hf] <;> field_simp [Subtype.coe_mk] <;> ring_nf <;>
    nlinarith [sq_pos_of_ne_zero
        (show (y₁ : ℚ) ≠ 0 by
          intro h₁₅
          have h₁₆ := y₁.2
          simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₆ ⊢ <;> aesop)]