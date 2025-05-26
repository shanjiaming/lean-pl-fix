theorem h_main (f : MvPolynomial (Fin 3) ℝ) (perms : Set (Set (MvPolynomial (Fin 3) ℝ))) (hf : f = sorry ^ 2 + sorry ^ 2 + sorry ^ 2 + sorry * sorry * sorry) (hperms : perms = {{sorry, sorry, sorry}, {sorry, -sorry, -sorry}, {-sorry, sorry, -sorry}, {-sorry, -sorry, sorry}}) : ¬∀ (pqr : Fin 3 → MvPolynomial (Fin 3) ℝ),
      (∀ (xyz : Fin 3 → ℝ),
          (MvPolynomial.eval fun i => (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) (pqr i) :
                MvPolynomial (Fin 3) ℝ → ℝ)
              f =
            (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) f) →
        {pqr 0, pqr 1, pqr 2} ∈ perms :=
  by
  --  intro h
  have h₁ := h (fun i => X (i + 1))
  have h₂ :
    (∀ (xyz : Fin 3 → ℝ),
      MvPolynomial.eval (fun i ↦ MvPolynomial.eval xyz (X (i + 1 : Fin 3))) f = MvPolynomial.eval xyz f) := by sorry
  have h₃ := h₁ h₂
  --  rw [hperms] at h₃
  --  --  --  norm_num [Set.mem_insert, Set.mem_singleton_iff] at h₃ <;> (try contradiction) <;> (try aesop) <;>
  --          (try
  --              {simp_all [MvPolynomial.X, MvPolynomial.C_0, MvPolynomial.C_1, MvPolynomial.C_add, MvPolynomial.C_mul] <;>
  --                  norm_num at * <;>
  --                aesop
  --            }) <;>
  --        (try
  --            {simp_all [MvPolynomial.X, MvPolynomial.C_0, MvPolynomial.C_1, MvPolynomial.C_add, MvPolynomial.C_mul] <;>
  --                norm_num at * <;>
  --              aesop
  --          }) <;>
  --      (try
  --          {simp_all [MvPolynomial.X, MvPolynomial.C_0, MvPolynomial.C_1, MvPolynomial.C_add, MvPolynomial.C_mul] <;>
  --              norm_num at * <;>
  --            aesop
  --        }) <;>
  --    (try
  --        {simp_all [MvPolynomial.X, MvPolynomial.C_0, MvPolynomial.C_1, MvPolynomial.C_add, MvPolynomial.C_mul] <;>
  --            norm_num at * <;>
  --          aesop
  --      })
  hole