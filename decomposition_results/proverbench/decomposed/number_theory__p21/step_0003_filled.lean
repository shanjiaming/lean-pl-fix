theorem h_final (h_main : countPoints 2012 % 3 = 2) : ¬3 ∣ countPoints 2012 := by
  --  intro h
  have h₁ : (countPoints 2012) % 3 = 0 := by sorry
  --  omega
  omega