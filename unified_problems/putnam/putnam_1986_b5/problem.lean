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
      intro xyz
      simp [hf, MvPolynomial.eval_add, MvPolynomial.eval_mul, MvPolynomial.eval_pow, MvPolynomial.eval_X]
      <;>
      (try decide) <;>
      (try ring_nf) <;>
      (try simp [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero]) <;>
      (try ring_nf at * <;> simp_all [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero]) <;>
      (try aesop) <;>
      (try norm_num) <;>
      (try ring_nf) <;>
      (try simp [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero]) <;>
      (try ring_nf at * <;> simp_all [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero]) <;>
      (try aesop) <;>
      (try norm_num)
      <;>
      simp_all [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero]
      <;>
      ring_nf at *
      <;>
      simp_all [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero]
      <;>
      aesop
    have h₃ := h₁ h₂
    rw [hperms] at h₃
    norm_num [Set.mem_insert, Set.mem_singleton_iff] at h₃
    <;>
    (try contradiction) <;>
    (try aesop) <;>
    (try
      {
        simp_all [MvPolynomial.X, MvPolynomial.C_0, MvPolynomial.C_1, MvPolynomial.C_add, MvPolynomial.C_mul]
        <;>
        norm_num at *
        <;>
        aesop
      })
    <;>
    (try
      {
        simp_all [MvPolynomial.X, MvPolynomial.C_0, MvPolynomial.C_1, MvPolynomial.C_add, MvPolynomial.C_mul]
        <;>
        norm_num at *
        <;>
        aesop
      })
    <;>
    (try
      {
        simp_all [MvPolynomial.X, MvPolynomial.C_0, MvPolynomial.C_1, MvPolynomial.C_add, MvPolynomial.C_mul]
        <;>
        norm_num at *
        <;>
        aesop
      })
    <;>
    (try
      {
        simp_all [MvPolynomial.X, MvPolynomial.C_0, MvPolynomial.C_1, MvPolynomial.C_add, MvPolynomial.C_mul]
        <;>
        norm_num at *
        <;>
        aesop
      })
  have h_final : (False ↔ (∀ pqr : Fin 3 → MvPolynomial (Fin 3) ℝ, (∀ xyz : Fin 3 → ℝ, MvPolynomial.eval (fun i ↦ MvPolynomial.eval xyz (pqr i)) f = MvPolynomial.eval xyz f) → ({pqr 0, pqr 1, pqr 2} ∈ perms))) := by
    constructor
    · intro h
      exfalso
      exact h
    · intro h
      exfalso
      exact h_main h
  exact h_final