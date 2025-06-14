macro "hole_3" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem aime_2025ii_p2 (S : Finset ℕ)
    (h₀ : ∀ (n : ℕ), n ∈ S ↔ (n + 2) ∣ 3 * (n + 3) * (n ^ 2 + 9)) :
    (∑ n in S, n) = 49 := by
  have h₁ : S = {1, 11, 37} := by
    apply Finset.ext
    intro n
    simp only [Finset.mem_insert, Finset.mem_singleton, h₀]
    constructor
    · 
      intro h
      have h₂ : (n + 2) ∣ 3 * (n + 3) * (n ^ 2 + 9) := by hole_3
      have h₃ : n = 1 ∨ n = 11 ∨ n = 37 := by
        
        have h₄ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₂
        have h₅ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₄
        have h₆ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₅
        
        have h₇ : n + 2 ∣ 39 := by
          
          have h₈ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₆
          have h₉ : n + 2 ∣ 3 * (n ^ 2 + 9 + 4 * (n + 3)) := by
            
            have h₁₀ : n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9) := h₈
            have h₁₁ : n + 2 ∣ 3 * (n ^ 2 + 9 + 4 * (n + 3)) := by
              
              have h₁₂ : 3 * (n ^ 2 + 9 + 4 * (n + 3)) = 3 * (n + 3) * (n ^ 2 + 9) - (n + 2) * (3 * (n ^ 2 + 9 + 4 * (n + 3)) - 3 * (n + 3) * (n ^ 2 + 9)) := by
                hole_8
              hole_7
            hole_6
          have h₁₀ : n + 2 ∣ 3 * (n ^ 2 + 9 + 4 * (n + 3)) := h₉
          have h₁₁ : n + 2 ∣ 39 := by
            
            have h₁₂ : 3 * (n ^ 2 + 9 + 4 * (n + 3)) = 3 * (n + 2) * (n + 2) + 39 := by
              hole_10
            rw [h₁₂] at h₁₀
            have h₁₃ : n + 2 ∣ 3 * (n + 2) * (n + 2) + 39 := h₁₀
            have h₁₄ : n + 2 ∣ 39 := by
              
              hole_11
            hole_9
          hole_5
        have h₈ : n + 2 ∣ 39 := h₇
        have h₉ : n + 2 ≤ 39 := Nat.le_of_dvd (by norm_num) h₈
        have h₁₀ : n ≤ 37 := by hole_12
        hole_4
      aesop
    · 
      intro h
      have h₂ : n = 1 ∨ n = 11 ∨ n = 37 := by hole_13
      
      hole_2

  have h₂ : (∑ n in S, n) = 49 := by
    hole_14
  
  hole_1