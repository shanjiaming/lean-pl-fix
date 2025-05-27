theorem h_final (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) (h_main : ∃ E x i α, eval₂ i α f = 0) : ∃ E x i α, (map i f).IsRoot α :=
  by
  obtain ⟨E, _, i, α, hα⟩ := h_main
  refine' ⟨E, _, i, α, _⟩
  have h₁ : (f.map i).eval₂ (RingHom.id E) α = eval₂ i α f := by rw [Polynomial.eval₂_map] <;> simp [hα]
  have h₂ : (f.map i).eval₂ (RingHom.id E) α = 0 := by
    rw [h₁]
    exact hα
  have h₃ : IsRoot (f.map i) α := by
    rw [IsRoot] <;> simp_all [Polynomial.eval₂_eq_eval_map] <;> simp_all [Polynomial.eval₂_eq_eval_map]
  exact h₃