theorem heightAtTwoPointFive : heightFunction 2.5 = 0 := by
  have h₁ : heightFunction 2.5 = 40 * (2.5 : ℝ) - 16 * (2.5 : ℝ)^2 := by
    rfl
  
  have h₂ : 40 * (2.5 : ℝ) - 16 * (2.5 : ℝ)^2 = 0 := by
    norm_num [heightFunction]
    <;>
    ring_nf at *
    <;>
    norm_num
    <;>
    linarith
  
  have h₃ : heightFunction 2.5 = 0 := by
    rw [h₁]
    rw [h₂]
    <;>
    norm_num
  
  exact h₃