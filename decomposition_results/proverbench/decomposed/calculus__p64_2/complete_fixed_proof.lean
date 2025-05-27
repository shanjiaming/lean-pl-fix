theorem solutions_in_interval : ∀ x ∈ solution_set, x ∈ Set.Ico 0 (2 * Real.pi):=
  by
  have h_main : ∀ (x : ℝ), x = 0 ∨ x = Real.pi / 3 ∨ x = Real.pi ∨ x = 4 * Real.pi / 3 → x ∈ Set.Ico 0 (2 * Real.pi):=
    by
    --  intro x hx
    have h₁ : 0 < Real.pi := Real.pi_pos
    have h₂ : 0 < 2 * Real.pi:= by -- linarith
      linarith
    have h₃ : 4 * Real.pi / 3 < 2 * Real.pi:=
      by
      have h₄ : 0 < Real.pi := Real.pi_pos
      have h₅ : 4 * Real.pi < 6 * Real.pi:= by -- nlinarith [Real.pi_gt_three]
        linarith
      --  linarith
      linarith
    have h₄ : 0 ≤ x:= by
      --  rcases hx with (rfl | rfl | rfl | rfl)
      --  · linarith
      --  · linarith [Real.pi_pos]
      --  · linarith [Real.pi_pos]
      --  · linarith [Real.pi_pos]
      hole
    have h₅ : x < 2 * Real.pi:= by
      --  rcases hx with (rfl | rfl | rfl | rfl)
      --  · linarith [Real.pi_pos]
      ·
        have h₆ : Real.pi / 3 < Real.pi:= by -- linarith [Real.pi_gt_three]
          linarith
      --    linarith
      ·
        have h₆ : Real.pi < 2 * Real.pi := by sorry
      --    linarith
      --  · linarith
      hole
    --  exact ⟨h₄, h₅⟩
    hole
  have h_final : ∀ x ∈ solution_set, x ∈ Set.Ico 0 (2 * Real.pi):=
    by
    --  intro x hx
    have h₁ : x = 0 ∨ x = Real.pi / 3 ∨ x = Real.pi ∨ x = 4 * Real.pi / 3:=
      by
      --  simp only [solution_set, Finset.mem_insert, Finset.mem_singleton] at hx
      --  tauto
      hole
    --  exact h_main x h₁
    hole
  --  exact h_final
  simpa