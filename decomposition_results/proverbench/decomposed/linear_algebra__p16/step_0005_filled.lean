theorem h₃ (k : ℕ) (x y : EuclideanSpace ℝ (Fin k)) (h : ∀ (x y : EuclideanSpace ℝ (Fin 2)), ‖x + y‖ = ‖x‖ + ‖y‖) (h₁ : ‖![1, 0] + ![0, 1]‖ = ‖![1, 0]‖ + ‖![0, 1]‖) (h₂ : ‖![1, 0] + ![0, 1]‖ = √2) : ‖![1, 0]‖ + ‖![0, 1]‖ = 2 :=
  by
  have h₄ : ‖((![1, 0] : EuclideanSpace ℝ (Fin 2)))‖ = 1 := by sorry
  have h₅ : ‖(![0, 1] : EuclideanSpace ℝ (Fin 2))‖ = 1 := by sorry
  --  linarith
  hole