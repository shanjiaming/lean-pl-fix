theorem transpose_linear_dependence (hAB : A * B = 0) (hB : B ≠ 0) : ¬LinearIndependent ℝ (fun i => Bᵀ i):=
  by
  have hB' : Bᵀ ≠ 0:= by
    --  intro h
    --  apply hB
    have h1 : B = 0:= by
      have h2 : Bᵀ = 0 := h
      have h3 : B = 0:= by
        have h4 : Bᵀ = 0 := h2
        have h5 : B = 0:= by
          --  ext i j
          have h6 := congr_fun (congr_fun h4 j) i
          --  --  simp [Matrix.transpose_apply] at h6 ⊢ <;> aesop
          hole
        --  exact h5
        simpa
      --  exact h3
      simpa
    --  exact h1
    simpa
  have hB'A' : Bᵀ * Aᵀ = 0:=
    by
    have h1 : (Bᵀ * Aᵀ)ᵀ = 0:= by
      --  calc
      --    (Bᵀ * Aᵀ)ᵀ = A * B := by rw [Matrix.mul_transpose, Matrix.transpose_transpose] <;> rw [Matrix.transpose_transpose]
      --    _ = 0 := hAB
      simpa
    have h2 : Bᵀ * Aᵀ = 0:= by
      have h3 : (Bᵀ * Aᵀ)ᵀ = 0 := h1
      have h4 : Bᵀ * Aᵀ = 0:= by
        have h5 : (Bᵀ * Aᵀ)ᵀ = 0 := h3
        have h6 : Bᵀ * Aᵀ = 0:= by
          --  rw [← Matrix.transpose_transpose (Bᵀ * Aᵀ)]
          --  --  rw [h5] <;> simp
          hole
        --  exact h6
        simpa
      --  exact h4
      simpa
    --  exact h2
    simpa
  have main : ¬LinearIndependent ℝ (fun i => Bᵀ i):=
    by
    have h₁ : ¬LinearIndependent ℝ (fun i => Bᵀ i):= by
      --  by_contra h₂
      have h₃ : LinearIndependent ℝ (fun i => Bᵀ i) := h₂
      --  have h₄ := null_space_non_trivial (A := Bᵀ) (B := Aᵀ) hB'A' hB' h₃ <;> simp_all
      hole
    --  exact h₁
    simpa
  --  exact main
  simpa