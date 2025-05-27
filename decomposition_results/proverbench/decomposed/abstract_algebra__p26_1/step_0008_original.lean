theorem h₁₂ (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) (h_f_ne_zero : f ≠ 0) (h✝ : IsUnit f) (h₁ : f.degree ≤ 0) (h₂ : f.degree > 0) (h₃ : f.degree ≤ 0) (h₄ h : f.degree > 0 ∧ f.degree ≤ 0) (h₆ : f.degree > 0) (h₇ : f.degree ≤ 0) (h₈ : f.degree > 0) (h₉ h₁₀ : f.degree ≤ 0) (h₁₁ : f.degree > 0) : f.degree = ⊥ ∨ ∃ n, f.degree = ↑n :=
  by
  cases' f.degree with n
  · exact Or.inl rfl
  · exact Or.inr ⟨n, rfl⟩