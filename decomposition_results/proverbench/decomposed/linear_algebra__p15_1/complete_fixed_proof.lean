theorem vector_decomposition (hu : u ≠ 0) :
  let (a, b):= decomposition v u
  v = a + b ∧ isParallel a u ∧ isOrthogonal b u :=
  by
  dsimp only [decomposition, isParallel, isOrthogonal]
  have h_scalar : ‖u‖ ^ 2 ≠ 0:= by
    have h1 : ‖u‖ ≠ 0:= by exact norm_ne_zero_iff.mpr hu
      hole
    exact by
      have h2 : ‖u‖ ^ 2 ≠ 0 := by positivity
      exact h2
    hole
  have h_add : v = (⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u) + (v - ⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u):=
    by
    have h₁ : v = (⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u) + (v - ⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u):=
      by
      have h₂ : (⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u) + (v - ⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u) = v:=
        by
        rw [add_comm]
        abel_nf
        hole
      linarith
      hole
    assumption
    hole
  have h_parallel : ∃ (l : ℝ), (⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u) = l • u:= by
    refine' ⟨⟪v, u⟫_ℝ / ‖u‖ ^ 2, _⟩ <;> simp [smul_smul] <;> ring_nf <;>
              simp_all [inner_smul_left, inner_smul_right, real_inner_self_eq_norm_sq] <;>
            field_simp [h_scalar] <;>
          ring_nf <;>
        simp_all [inner_smul_left, inner_smul_right, real_inner_self_eq_norm_sq] <;>
      linarith
    hole
  have h_orthogonal : ⟪v - ⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u, u⟫_ℝ = 0:=
    by
    have h1 : ⟪v - ⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u, u⟫_ℝ = ⟪v, u⟫_ℝ - ⟪(⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u), u⟫_ℝ:= by
      rw [sub_inner] <;> simp [real_inner_smul_left, real_inner_smul_right] <;> ring_nf <;>
                simp_all [inner_smul_left, inner_smul_right, real_inner_self_eq_norm_sq] <;>
              field_simp [h_scalar] <;>
            ring_nf <;>
          simp_all [inner_smul_left, inner_smul_right, real_inner_self_eq_norm_sq] <;>
        linarith
      hole
    rw [h1]
    have h2 : ⟪(⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u), u⟫_ℝ = (⟪v, u⟫_ℝ / ‖u‖ ^ 2) * ‖u‖ ^ 2:= by
      calc
        ⟪(⟪v, u⟫_ℝ / ‖u‖ ^ 2 • u), u⟫_ℝ = (⟪v, u⟫_ℝ / ‖u‖ ^ 2) * ⟪u, u⟫_ℝ := by
          simp [real_inner_smul_left, real_inner_smul_right, inner_smul_right, inner_smul_left, mul_comm] <;> ring_nf <;>
                    simp_all [inner_smul_left, inner_smul_right, real_inner_self_eq_norm_sq] <;>
                  field_simp [h_scalar] <;>
                ring_nf <;>
              simp_all [inner_smul_left, inner_smul_right, real_inner_self_eq_norm_sq] <;>
            linarith
        _ = (⟪v, u⟫_ℝ / ‖u‖ ^ 2) * ‖u‖ ^ 2 := by rw [real_inner_self_eq_norm_sq] <;> simp_all
      hole
    rw [h2]
    have h3 : (⟪v, u⟫_ℝ / ‖u‖ ^ 2 : ℝ) * ‖u‖ ^ 2 = ⟪v, u⟫_ℝ:=
      by
      have h4 : ‖u‖ ^ 2 ≠ 0 := h_scalar
      field_simp [h4] <;> ring_nf <;> simp_all [inner_smul_left, inner_smul_right, real_inner_self_eq_norm_sq] <;> linarith
      hole
    rw [h3] <;> simp_all [inner_smul_left, inner_smul_right, real_inner_self_eq_norm_sq] <;> linarith
    hole
  refine' ⟨_, _, _⟩
  · exact h_add
  · exact h_parallel
  · exact h_orthogonal
  hole