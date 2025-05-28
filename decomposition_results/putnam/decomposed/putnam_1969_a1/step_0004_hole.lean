theorem h₂ (f : MvPolynomial (Fin 2) ℝ) (h₁ : {z | ∃ x, (MvPolynomial.eval x) f = z} = range fun x => (MvPolynomial.eval x) f) (hf : ∀ (x : Fin 2 → ℝ), (MvPolynomial.eval x) f = (MvPolynomial.eval 0) f) : (range fun x => (MvPolynomial.eval x) f) = {(MvPolynomial.eval 0) f} :=
  by
  --  ext z
  --  simp [Set.mem_range, hf] <;> aesop
  hole