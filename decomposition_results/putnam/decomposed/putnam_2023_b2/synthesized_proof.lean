theorem putnam_2023_b2
: sInf {(digits 2 (2023*n)).sum | n > 0} = ((3) : ℕ ) := by
  have h₁ : 3 ∈ {(digits 2 (2023*n)).sum | n > 0} := by

    admit

  have h₂ : sInf {(digits 2 (2023*n)).sum | n > 0} = 3 := by
    
    admit

  linarith
