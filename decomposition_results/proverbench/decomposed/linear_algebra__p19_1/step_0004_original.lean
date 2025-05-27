theorem h₂₂ (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) (h : ∃ X, A * X = B) (X : Matrix n p R) (hX : A * X = B) (h₂₁ : LinearMap.range sorry ≤ LinearMap.range sorry) : LinearMap.range sorry ≤ LinearMap.range sorry :=
  by
  rw [LinearMap.range_le_iff_comap]
  refine' LinearMap.ext_iff.2 fun x ↦ _
  simp [LinearMap.mem_ker, Matrix.toLin_apply, Matrix.mul_apply, fromColumns_apply₁, fromColumns_apply₂,
                  Fintype.sum_congr, Function.comp_apply, Pi.add_apply] <;>
                (try decide) <;>
              (try {aesop
                }) <;>
            (try {
                have h₃ : (A * X) = B := hX
                have h₄ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
                have h₅ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
                simp_all [Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply] <;> aesop
              }) <;>
          (try {
              have h₃ : (A * X) = B := hX
              have h₄ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
              have h₅ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
              simp_all [Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply] <;> aesop
            }) <;>
        (try {
            have h₃ : (A * X) = B := hX
            have h₄ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
            have h₅ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
            simp_all [Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply] <;> aesop
          }) <;>
      (try {
          have h₃ : (A * X) = B := hX
          have h₄ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
          have h₅ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
          simp_all [Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply] <;> aesop
        }) <;>
    (try {aesop
      })