lemma solutions_in_interval :
  ∀ x ∈ solution_set, x ∈ Set.Ico 0 (2 * Real.pi) := by
  have h_main : ∀ (x : ℝ), x = 0 ∨ x = Real.pi / 3 ∨ x = Real.pi ∨ x = 4 * Real.pi / 3 → x ∈ Set.Ico 0 (2 * Real.pi) := by
    intro x hx
    have h₁ : 0 < Real.pi := Real.pi_pos
    have h₂ : 0 < 2 * Real.pi := by linarith
    have h₃ : 4 * Real.pi / 3 < 2 * Real.pi := by
      -- Prove that 4π/3 < 2π by showing 4π < 6π, which is true because π > 0 and 4 < 6.
      have h₄ : 0 < Real.pi := Real.pi_pos
      have h₅ : 4 * Real.pi < 6 * Real.pi := by
        nlinarith [Real.pi_gt_three]
      -- Divide both sides by 3 to get 4π/3 < 2π.
      linarith
    have h₄ : 0 ≤ x := by
      rcases hx with (rfl | rfl | rfl | rfl)
      · -- Case x = 0
        linarith
      · -- Case x = π/3
        linarith [Real.pi_pos]
      · -- Case x = π
        linarith [Real.pi_pos]
      · -- Case x = 4π/3
        linarith [Real.pi_pos]
    have h₅ : x < 2 * Real.pi := by
      rcases hx with (rfl | rfl | rfl | rfl)
      · -- Case x = 0
        linarith [Real.pi_pos]
      · -- Case x = π/3
        have h₆ : Real.pi / 3 < Real.pi := by linarith [Real.pi_gt_three]
        linarith
      · -- Case x = π
        have h₆ : Real.pi < 2 * Real.pi := by linarith [Real.pi_gt_three]
        linarith
      · -- Case x = 4π/3
        linarith
    exact ⟨h₄, h₅⟩
  
  have h_final : ∀ x ∈ solution_set, x ∈ Set.Ico 0 (2 * Real.pi) := by
    intro x hx
    have h₁ : x = 0 ∨ x = Real.pi / 3 ∨ x = Real.pi ∨ x = 4 * Real.pi / 3 := by
      -- Prove that x is one of the four values in the solution set
      simp only [solution_set, Finset.mem_insert, Finset.mem_singleton] at hx
      tauto
    -- Use the main lemma to conclude the proof
    exact h_main x h₁
  
  exact h_final