theorem h₅ (h : ∀ (x y : EuclideanSpace ℝ (Fin 2)), ‖x + y‖ = ‖x‖ + ‖y‖) (h₁ : ‖![1, 0] + ![0, 1]‖ = ‖![1, 0]‖ + ‖![0, 1]‖) (h₂ : ‖![1, 0] + ![0, 1]‖ = √2) (h₄ : ‖![1, 0]‖ = 1) : ‖![0, 1]‖ = 1 := by
  simp [Fin.sum_univ_succ, EuclideanSpace.norm_eq, Real.sqrt_eq_iff_sq_eq, sq, mul_comm, add_assoc] <;> norm_num <;>
                ring_nf <;>
              norm_num <;>
            rw [Real.sqrt_eq_iff_sq_eq] <;>
          norm_num <;>
        ring_nf <;>
      norm_num <;>
    linarith [Real.sqrt_nonneg 1]