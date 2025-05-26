theorem norm_add_ne_add_norm  : ¬∀ (x y : EuclideanSpace ℝ (Fin 2)), ‖x + y‖ = ‖x‖ + ‖y‖ :=
  by
  have h_main : ¬(∀ (x y : EuclideanSpace ℝ (Fin 2)), ‖x + y‖ = ‖x‖ + ‖y‖) := by sorry
  --  exact h_main
  hole