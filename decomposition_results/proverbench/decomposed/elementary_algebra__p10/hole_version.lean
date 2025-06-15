macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem injective_function_properties (f : ℕ → ℕ) (h_inj : ∀ x y, f x = f y → x = y) (h_def : f 1 = 2 ∧ ∀ n ≥ 2, f n = n + 2) (hf0 : f 0 = 3) : (∀ m n, f (f m + f n) = f (f m) + f n) ∧ (f 1 = 2 ∧ f 2 = 4) := by
  have h2 : f 2 = 4 := by
    have h₂ : ∀ n ≥ 2, f n = n + 2 := h_def.2
    have h₂₂ : f 2 = 2 + 2 := h₂ 2 (by norm_num)
    hole_2
  have h1 : f 1 = 2 := h_def.1
  have h_main : ∀ m n, f (f m + f n) = f (f m) + f n := by
    intro m n
    have h₃ : f m ≥ 2 := by
      
      by_cases hm : m = 0
      · rw [hm]  
        norm_num [hf0]  
      · by_cases hm₁ : m = 1
        · rw [hm₁]  
          norm_num [h1]  
        · have hm₂ : m ≥ 2 := by
            
            hole_5
          have h₄ : f m = m + 2 := h_def.2 m hm₂
          have h₅ : f m ≥ 2 := by hole_6
          hole_4
    have h₄ : f n ≥ 2 := by
      
      by_cases hn : n = 0
      · rw [hn]  
        norm_num [hf0]  
      · by_cases hn₁ : n = 1
        · rw [hn₁]  
          norm_num [h1]  
        · have hn₂ : n ≥ 2 := by
            
            hole_8
          have h₅ : f n = n + 2 := h_def.2 n hn₂
          have h₆ : f n ≥ 2 := by hole_9
          hole_7
    have h₅ : f m + f n ≥ 2 := by hole_10
    have h₆ : f (f m + f n) = (f m + f n) + 2 := by
      
      have h₇ : f m + f n ≥ 2 := by hole_12
      have h₈ : f (f m + f n) = (f m + f n) + 2 := by
        have h₉ : ∀ k ≥ 2, f k = k + 2 := h_def.2
        have h₁₀ : f (f m + f n) = (f m + f n) + 2 := by
          have h₁₁ : f m + f n ≥ 2 := by hole_15
          have h₁₂ : f (f m + f n) = (f m + f n) + 2 := h₉ (f m + f n) h₁₁
          hole_14
        hole_13
      hole_11
    have h₇ : f (f m) = f m + 2 := by
      
      have h₈ : f m ≥ 2 := by hole_17
      have h₉ : ∀ k ≥ 2, f k = k + 2 := h_def.2
      have h₁₀ : f (f m) = f m + 2 := by
        have h₁₁ : f m ≥ 2 := by hole_19
        have h₁₂ : f (f m) = f m + 2 := by
          have h₁₃ : f (f m) = f m + 2 := h₉ (f m) h₁₁
          hole_20
        hole_18
      hole_16
    hole_3
  hole_1