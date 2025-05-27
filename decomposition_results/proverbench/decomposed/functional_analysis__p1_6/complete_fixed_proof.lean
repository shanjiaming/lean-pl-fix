theorem f_global_minimum : IsMinOn (fun p => f p.1 p.2) Set.univ (0, 0):=
  by
  have h_main : ∀ (p : ℝ × ℝ), f p.1 p.2 ≥ f 0 0:= by
    --  intro p
    have h₁ : f p.1 p.2 = (p.1 ^ 2 + p.2 ^ 2) * Real.exp (-(p.1 + p.2)):= by
      --  simp [f, Real.exp_neg, add_comm] <;> ring_nf <;> field_simp [Real.exp_add, Real.exp_neg, add_comm] <;> ring_nf
      norm_cast
    have h₂ : f (0 : ℝ) 0 = 0:= by -- simp [f, Real.exp_zero] <;> ring_nf
      hole
    --  rw [h₁, h₂]
    have h₃ : (p.1 ^ 2 + p.2 ^ 2 : ℝ) ≥ 0:= by -- positivity
      nlinarith
    have h₄ : Real.exp (-(p.1 + p.2)) > 0 := Real.exp_pos _
    have h₅ : (p.1 ^ 2 + p.2 ^ 2 : ℝ) * Real.exp (-(p.1 + p.2)) ≥ 0:= by -- positivity
      nlinarith
    --  linarith
    hole
  have h_final : IsMinOn (fun p => f p.1 p.2) Set.univ (0, 0):= by -- refine' fun p _ => h_main p
    hole
  --  exact h_final
  simpa