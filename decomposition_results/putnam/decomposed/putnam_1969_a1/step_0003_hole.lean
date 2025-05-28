theorem h₁ (f : MvPolynomial (Fin 2) ℝ) : {z | ∃ x, (MvPolynomial.eval x) f = z} = range fun x => (MvPolynomial.eval x) f :=
  by
  --  ext z
  --  simp [Set.mem_range] <;> aesop
  hole