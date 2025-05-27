theorem h₆ (R : Type u_1) (inst✝ : CommRing R) (h : IsField ((ZMod 3)[X] ⧸ span {X ^ 3 + X ^ 2 + C 0})) (h₁ : ¬0 = 2) (h₄ : X ^ 3 + X ^ 2 + C 0 = X ^ 2 * (X + 1)) (h₅ : IsField ((ZMod 3)[X] ⧸ span {X ^ 3 + X ^ 2 + C 0})) : ¬Irreducible (X ^ 3 + X ^ 2 + C 0) :=
  by
  rw [h₄]
  exact not_irreducible_of_degree_le_one (by norm_num) (by exact degree_linear_le)
  hole