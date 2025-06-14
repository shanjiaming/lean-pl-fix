macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1986_b5
    (f : MvPolynomial (Fin 3) ℝ)
    (perms : Set (Set (MvPolynomial (Fin 3) ℝ)))
    (hf : f = (X 0) ^ 2 + (X 1) ^ 2 + (X 2) ^ 2 + (X 0) * (X 1) * (X 2))
    (hperms : perms = {{X 0, X 1, X 2}, {X 0, -X 1, -X 2}, {-X 0, X 1, -X 2}, {-X 0, -X 1, X 2}}) :
    ((False) : Prop ) ↔ (∀ pqr : Fin 3 → MvPolynomial (Fin 3) ℝ,
      (∀ xyz : Fin 3 → ℝ, MvPolynomial.eval (fun i ↦ MvPolynomial.eval xyz (pqr i)) f = MvPolynomial.eval xyz f) →
      ({pqr 0, pqr 1, pqr 2} ∈ perms)) := by
  have h_main : ¬ (∀ (pqr : Fin 3 → MvPolynomial (Fin 3) ℝ), (∀ (xyz : Fin 3 → ℝ), MvPolynomial.eval (fun i ↦ MvPolynomial.eval xyz (pqr i)) f = MvPolynomial.eval xyz f) → ({pqr 0, pqr 1, pqr 2} ∈ perms)) := by
    intro h
    have h₁ := h (fun i => X (i + 1))
    have h₂ : (∀ (xyz : Fin 3 → ℝ), MvPolynomial.eval (fun i ↦ MvPolynomial.eval xyz (X (i + 1 : Fin 3))) f = MvPolynomial.eval xyz f) := by
      hole_2
    have h₃ := h₁ h₂
    hole_1
  have h_final : (False ↔ (∀ pqr : Fin 3 → MvPolynomial (Fin 3) ℝ, (∀ xyz : Fin 3 → ℝ, MvPolynomial.eval (fun i ↦ MvPolynomial.eval xyz (pqr i)) f = MvPolynomial.eval xyz f) → ({pqr 0, pqr 1, pqr 2} ∈ perms))) := by
    constructor
    · intro h
      exfalso
      exact h
    · intro h
      exfalso
      exact h_main h
  exact h_final