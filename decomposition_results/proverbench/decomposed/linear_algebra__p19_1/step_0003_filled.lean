theorem h₂₁ (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) (h : ∃ X, A * X = B) (X : Matrix n p R) (hX : A * X = B) : LinearMap.range sorry ≤ LinearMap.range sorry :=
  by
  rw [LinearMap.range_le_iff_comap]
  refine' LinearMap.ext_iff.2 fun x ↦ _
  simp [LinearMap.mem_ker, Matrix.toLin_apply, Matrix.mul_apply, fromColumns_apply₁, fromColumns_apply₂,
            Fintype.sum_congr, Function.comp_apply, Pi.add_apply] <;>
          (try decide) <;>
        (try {aesop
          }) <;>
      (try
          {use Sum.elim x 0 <;> simp [hX, Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply] <;>
            aesop
        }) <;>
    (try {use 0 <;> simp [hX, Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply] <;> aesop
      })
  hole