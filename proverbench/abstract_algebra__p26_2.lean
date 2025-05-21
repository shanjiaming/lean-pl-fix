theorem exists_root (f : F[X]) (hf : f.degree > 0) :
∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), IsRoot (f.map i) α := by
  have h_main : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), eval₂ i α f = 0 := by
    apply extension_field_zero f hf
  
  have h_final : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), IsRoot (f.map i) α := by
    obtain ⟨E, _, i, α, hα⟩ := h_main
    refine' ⟨E, _, i, α, _⟩
    -- Use the fact that `eval₂ i α f = 0` to show `IsRoot (f.map i) α`
    have h₁ : (f.map i).eval₂ (RingHom.id E) α = eval₂ i α f := by
      rw [Polynomial.eval₂_map]
      <;> simp [hα]
    have h₂ : (f.map i).eval₂ (RingHom.id E) α = 0 := by
      rw [h₁]
      exact hα
    -- Convert `eval₂` to `IsRoot`
    have h₃ : IsRoot (f.map i) α := by
      rw [IsRoot]
      -- Simplify the expression to match the form in `h₂`
      <;> simp_all [Polynomial.eval₂_eq_eval_map]
      <;>
      simp_all [Polynomial.eval₂_eq_eval_map]
    exact h₃
  
  exact h_final