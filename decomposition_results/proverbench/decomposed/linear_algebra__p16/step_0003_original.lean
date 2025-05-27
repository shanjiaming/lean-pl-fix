theorem h₁ (k : ℕ) (x y : EuclideanSpace ℝ (Fin k)) (h : ∀ (x y : EuclideanSpace ℝ (Fin 2)), ‖x + y‖ = ‖x‖ + ‖y‖) : ‖![1, 0] + ![0, 1]‖ = ‖![1, 0]‖ + ‖![0, 1]‖ :=
  by apply h