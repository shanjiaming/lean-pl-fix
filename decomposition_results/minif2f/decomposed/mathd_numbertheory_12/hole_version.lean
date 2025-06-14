macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_12 :
    Finset.card (Finset.filter (fun x => 20 ∣ x) (Finset.Icc 15 85)) = 4 := by
  have h_main : Finset.filter (fun x => 20 ∣ x) (Finset.Icc 15 85) = {20, 40, 60, 80} := by
    apply Finset.ext
    intro x
    simp only [Finset.mem_filter, Finset.mem_Icc, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · 
      intro h
      have h₁ : 15 ≤ x ∧ x ≤ 85 := by hole_3
      have h₂ : 20 ∣ x := by hole_4
      have h₃ : x = 20 ∨ x = 40 ∨ x = 60 ∨ x = 80 := by
        
        
        have h₄ : x ≤ 85 := by hole_6
        have h₅ : 15 ≤ x := by hole_7
        have h₆ : 20 ∣ x := by hole_8
        
        have h₇ : x = 20 ∨ x = 40 ∨ x = 60 ∨ x = 80 := by
          
          
          have h₈ : x % 20 = 0 := by
            hole_10
          have h₉ : x ≤ 85 := by hole_11
          have h₁₀ : 15 ≤ x := by hole_12
          have h₁₁ : x = 20 ∨ x = 40 ∨ x = 60 ∨ x = 80 := by
            hole_13
          hole_9
        hole_5
      
      tauto
    · 
      intro h
      have h₁ : x = 20 ∨ x = 40 ∨ x = 60 ∨ x = 80 := by hole_14
      have h₂ : 15 ≤ x ∧ x ≤ 85 ∧ 20 ∣ x := by
        hole_15
      hole_2
  
  have h_card : Finset.card (Finset.filter (fun x => 20 ∣ x) (Finset.Icc 15 85)) = 4 := by
    hole_16
  
  hole_1