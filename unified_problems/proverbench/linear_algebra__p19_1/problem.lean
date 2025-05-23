theorem rankConditionIfSolutionExists (A : Matrix m n R) (B : Matrix m p R) :
(∃ X : Matrix n p R, A * X = B) → rank A = rank (fromColumns A B) := by
  intro h
  have h₁ : ∃ (X : Matrix n p R), A * X = B := h
  have h₂ : LinearMap.range (Matrix.toLin (Pi.basisFun R n) (Pi.basisFun R m) A) = LinearMap.range (Matrix.toLin (Pi.basisFun R (Sum n p)) (Pi.basisFun R m) (fromColumns A B)) := by
    obtain ⟨X, hX⟩ := h₁
    have h₂₁ : LinearMap.range (Matrix.toLin (Pi.basisFun R n) (Pi.basisFun R m) A) ≤ LinearMap.range (Matrix.toLin (Pi.basisFun R (Sum n p)) (Pi.basisFun R m) (fromColumns A B)) := by
      -- Prove that the range of toLin A is contained in the range of toLin (fromColumns A B)
      rw [LinearMap.range_le_iff_comap]
      refine' LinearMap.ext_iff.2 fun x ↦ _
      simp [LinearMap.mem_ker, Matrix.toLin_apply, Matrix.mul_apply, fromColumns_apply₁,
        fromColumns_apply₂, Fintype.sum_congr, Function.comp_apply, Pi.add_apply]
      <;>
      (try decide) <;>
      (try {
        aesop
      }) <;>
      (try {
        use Sum.elim x 0
        <;>
        simp [hX, Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply]
        <;>
        aesop
      }) <;>
      (try {
        use 0
        <;>
        simp [hX, Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply]
        <;>
        aesop
      })
    have h₂₂ : LinearMap.range (Matrix.toLin (Pi.basisFun R (Sum n p)) (Pi.basisFun R m) (fromColumns A B)) ≤ LinearMap.range (Matrix.toLin (Pi.basisFun R n) (Pi.basisFun R m) A) := by
      -- Prove that the range of toLin (fromColumns A B) is contained in the range of toLin A
      rw [LinearMap.range_le_iff_comap]
      refine' LinearMap.ext_iff.2 fun x ↦ _
      simp [LinearMap.mem_ker, Matrix.toLin_apply, Matrix.mul_apply, fromColumns_apply₁,
        fromColumns_apply₂, Fintype.sum_congr, Function.comp_apply, Pi.add_apply]
      <;>
      (try decide) <;>
      (try {
        aesop
      }) <;>
      (try {
        have h₃ : (A * X) = B := hX
        have h₄ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
        have h₅ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
        simp_all [Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply]
        <;>
        aesop
      }) <;>
      (try {
        have h₃ : (A * X) = B := hX
        have h₄ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
        have h₅ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
        simp_all [Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply]
        <;>
        aesop
      }) <;>
      (try {
        have h₃ : (A * X) = B := hX
        have h₄ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
        have h₅ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
        simp_all [Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply]
        <;>
        aesop
      }) <;>
      (try {
        have h₃ : (A * X) = B := hX
        have h₄ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
        have h₅ : ∀ i j, (A * X) i j = B i j := by simp [h₃]
        simp_all [Matrix.mul_apply, Finset.sum_comm, Function.comp_apply, Pi.add_apply]
        <;>
        aesop
      }) <;>
      (try {
        aesop
      })
    exact le_antisymm h₂₁ h₂₂
  have h₃ : rank A = rank (fromColumns A B) := by
    rw [rank, rank, h₂]
    <;>
    simp [fromColumns_apply₁, fromColumns_apply₂, Matrix.toLin_apply, Matrix.mul_apply, Finset.sum_comm,
      Function.comp_apply, Pi.add_apply]
    <;>
    aesop
  exact h₃