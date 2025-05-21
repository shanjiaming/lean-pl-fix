theorem cubic_interpolation_for_powers_of_two :
  ∀ (i : ℕ), i ∈ S → (2 : ℝ) ^ i = Q i := by
  intro i hi
  have h : i = 0 ∨ i = 1 ∨ i = 2 ∨ i = 3 := by
    have h₁ : i < 4 := by
      simpa [S] using hi
    have h₂ : i ≤ 3 := by linarith
    interval_cases i <;> simp_all (config := {decide := true})
    <;> norm_num
  
  have h_main : (2 : ℝ) ^ i = Q i := by
    rcases h with (rfl | rfl | rfl | rfl)
    · -- Case i = 0
      norm_num [Q, pow_zero, pow_one, pow_two, pow_three]
      <;> ring_nf
      <;> norm_num
    · -- Case i = 1
      norm_num [Q, pow_zero, pow_one, pow_two, pow_three]
      <;> ring_nf
      <;> norm_num
    · -- Case i = 2
      norm_num [Q, pow_zero, pow_one, pow_two, pow_three]
      <;> ring_nf
      <;> norm_num
    · -- Case i = 3
      norm_num [Q, pow_zero, pow_one, pow_two, pow_three]
      <;> ring_nf
      <;> norm_num
  
  exact h_main