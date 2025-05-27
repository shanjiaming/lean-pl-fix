theorem f_global_minimum (u v x y : ℝ) : IsMinOn (fun p => f p.1 p.2) Set.univ (0, 0) :=
  by
  have h_main : ∀ (p : ℝ × ℝ), f p.1 p.2 ≥ f 0 0 := by sorry
  have h_final : IsMinOn (fun p => f p.1 p.2) Set.univ (0, 0) := by sorry
  exact h_final