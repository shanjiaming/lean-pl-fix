theorem h₄ (f : MvPolynomial (Fin 2) ℝ) (h₁ : {z | ∃ x, (MvPolynomial.eval x) f = z} = range fun x => (MvPolynomial.eval x) f) (hf : ∀ (x : Fin 2 → ℝ), (MvPolynomial.eval x) f = (MvPolynomial.eval 0) f) (h₂ : (range fun x => (MvPolynomial.eval x) f) = {(MvPolynomial.eval 0) f}) (h₃ : {(MvPolynomial.eval 0) f} ∈ {x | ∃ x_1, {x_1} = x}) : {(MvPolynomial.eval 0) f} ∈
    {x | ∃ x_1, {x_1} = x} ∪ {x | ∃ x_1, Ici x_1 = x} ∪ {x | ∃ x_1, Iic x_1 = x} ∪ {x | ∃ x_1, Iio x_1 = x} ∪
        {x | ∃ x_1, Ioi x_1 = x} ∪
      {univ} :=
  by
  exact
    Set.mem_union_left _ (Set.mem_union_left _ (Set.mem_union_left _ (Set.mem_union_left _ (Set.mem_union_left _ h₃))))