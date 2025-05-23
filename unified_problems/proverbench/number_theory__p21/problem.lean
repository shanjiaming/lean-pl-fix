theorem count_not_div_three : ¬(3 ∣ countPoints 2012) := by
  have h_main : (countPoints 2012) % 3 = 2 := by
    rfl
  
  have h_final : ¬(3 ∣ countPoints 2012) := by
    intro h
    have h₁ : (countPoints 2012) % 3 = 0 := by
      omega
    omega
  
  exact h_final