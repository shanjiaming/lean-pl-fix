theorem mathd_numbertheory_12 :
    Finset.card (Finset.filter (fun x => 20 ∣ x) (Finset.Icc 15 85)) = 4 := by
  have h_main : Finset.filter (fun x => 20 ∣ x) (Finset.Icc 15 85) = {20, 40, 60, 80} := by
    apply Finset.ext
    intro x
    simp only [Finset.mem_filter, Finset.mem_Icc, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · 
      intro h
      have h₁ : 15 ≤ x ∧ x ≤ 85 := by omega
      have h₂ : 20 ∣ x := by omega
      have h₃ : x = 20 ∨ x = 40 ∨ x = 60 ∨ x = 80 := by

        have h₄ : x ≤ 85 := by linarith
        have h₅ : 15 ≤ x := by linarith
        have h₆ : 20 ∣ x := by omega
        
        have h₇ : x = 20 ∨ x = 40 ∨ x = 60 ∨ x = 80 := by

          have h₈ : x % 20 = 0 := by
            omega
          have h₉ : x ≤ 85 := by linarith
          have h₁₀ : 15 ≤ x := by linarith
          have h₁₁ : x = 20 ∨ x = 40 ∨ x = 60 ∨ x = 80 := by
            omega
          omega
        omega
      
      tauto
    · 
      intro h
      have h₁ : x = 20 ∨ x = 40 ∨ x = 60 ∨ x = 80 := by omega
      have h₂ : 15 ≤ x ∧ x ≤ 85 ∧ 20 ∣ x := by
        norm_cast5
      admit
  
  have h_card : Finset.card (Finset.filter (fun x => 20 ∣ x) (Finset.Icc 15 85)) = 4 := by
    norm_cast
  
  hole_1
