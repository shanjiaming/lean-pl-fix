theorem putnam_2016_b5
  (f : Set.Ioi (1 : ℝ) → Set.Ioi (1 : ℝ)) :
  f ∈ (({f : Set.Ioi (1 : ℝ) → Set.Ioi (1 : ℝ) | ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c}) : Set (Set.Ioi (1 : ℝ) → Set.Ioi (1 : ℝ)) ) ↔
    (∀ x y : Set.Ioi (1 : ℝ), ((x : ℝ) ^ 2 ≤ y ∧ y ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f y ∧ f y ≤ (f x : ℝ) ^ 3)) := by
  constructor
  · 
    intro hf
    have h_forward : ∀ x y : Set.Ioi (1 : ℝ), ((x : ℝ) ^ 2 ≤ y ∧ y ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f y ∧ f y ≤ (f x : ℝ) ^ 3) := by
      rcases hf with ⟨c, hc, hf⟩
      intro x y hxy
      have h₁ : (f x : ℝ) = (x : ℝ) ^ c := by admit
      have h₂ : (f y : ℝ) = (y : ℝ) ^ c := by admit
      have h₃ : (x : ℝ) ^ 2 ≤ (y : ℝ) := hxy.1
      have h₄ : (y : ℝ) ≤ (x : ℝ) ^ 3 := hxy.2
      have h₅ : (1 : ℝ) < (x : ℝ) := by admit
      have h₆ : (1 : ℝ) < (y : ℝ) := by
        have h₇ : (1 : ℝ) < (x : ℝ) := x.2
        have h₈ : (x : ℝ) ^ 2 ≤ (y : ℝ) := hxy.1
        have h₉ : (1 : ℝ) < (x : ℝ) ^ 2 := by
          have h₁₀ : (1 : ℝ) < (x : ℝ) := x.2
          nlinarith
        linarith
      have h₇ : (f x : ℝ) ^ 2 ≤ (f y : ℝ) := by
        rw [h₁, h₂]
        have h₈ : (0 : ℝ) < c := by linarith
        have h₉ : (0 : ℝ) < (x : ℝ) := by linarith
        have h₁₀ : (0 : ℝ) < (y : ℝ) := by linarith
        have h₁₁ : (0 : ℝ) < (x : ℝ) ^ c := by positivity
        have h₁₂ : (0 : ℝ) < (y : ℝ) ^ c := by positivity
        
        have h₁₃ : (x : ℝ) ^ 2 ≤ (y : ℝ) := hxy.1
        have h₁₄ : (0 : ℝ) < (x : ℝ) ^ 2 := by nlinarith
        have h₁₅ : (0 : ℝ) < (y : ℝ) := by linarith
        
        have h₁₆ : ((x : ℝ) ^ 2) ^ c ≤ (y : ℝ) ^ c := by
          admit
        have h₁₇ : ((x : ℝ) ^ 2) ^ c = (x : ℝ) ^ (2 * c) := by
          admit
        have h₁₈ : (x : ℝ) ^ (2 * c) = ((x : ℝ) ^ c) ^ 2 := by
          have h₁₉ : (x : ℝ) ^ (2 * c) = ((x : ℝ) ^ c) ^ 2 := by
            have h₂₀ : (x : ℝ) ^ (2 * c) = ((x : ℝ) ^ c) ^ 2 := by
              admit
            linarith
          linarith
        linarith
      have h₈ : (f y : ℝ) ≤ (f x : ℝ) ^ 3 := by
        rw [h₁, h₂]
        have h₉ : (0 : ℝ) < c := by linarith
        have h₁₀ : (0 : ℝ) < (x : ℝ) := by linarith
        have h₁₁ : (0 : ℝ) < (y : ℝ) := by linarith
        have h₁₂ : (0 : ℝ) < (x : ℝ) ^ c := by positivity
        have h₁₃ : (0 : ℝ) < (y : ℝ) ^ c := by nlinarith
        
        have h₁₄ : (y : ℝ) ≤ (x : ℝ) ^ 3 := hxy.2
        have h₁₅ : (0 : ℝ) < (x : ℝ) ^ 3 := by linarith
        have h₁₆ : (0 : ℝ) < (y : ℝ) := by linarith
        
        have h₁₇ : (y : ℝ) ^ c ≤ ((x : ℝ) ^ 3) ^ c := by
          admit
        have h₁₈ : ((x : ℝ) ^ 3) ^ c = (x : ℝ) ^ (3 * c) := by
          admit
        have h₁₉ : (x : ℝ) ^ (3 * c) = ((x : ℝ) ^ c) ^ 3 := by
          have h₂₀ : (x : ℝ) ^ (3 * c) = ((x : ℝ) ^ c) ^ 3 := by
            admit
          linarith
        linarith
      norm_cast
    exact h_forward
  · 
    intro hf
    have h_backward : ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c := by
      have h₁ : ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c := by

        use 1
        constructor
        · 
          norm_num
        · 
          intro x
          have h₂ := hf x x
          have h₃ : ((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f x ∧ f x ≤ (f x : ℝ) ^ 3) := by
            norm_cast
          have h₄ : (1 : ℝ) < (x : ℝ) := x.2
          have h₅ : (x : ℝ) ^ 2 ≤ (x : ℝ) → False := by
            admit
          have h₆ : (x : ℝ) ≤ (x : ℝ) ^ 3 → False := by
            admit
          have h₇ : ¬((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3) := by
            admit
          have h₈ : ((f x : ℝ) ^ 2 ≤ f x ∧ f x ≤ (f x : ℝ) ^ 3) := by
            admit
          have h₉ : (f x : ℝ) > 1 := by
            admit
          have h₁₀ : (f x : ℝ) ^ 2 ≤ f x := h₈.1
          have h₁₁ : f x ≤ (f x : ℝ) ^ 3 := h₈.2
          have h₁₂ : (f x : ℝ) = (x : ℝ) ^ 1 := by
            
            have h₁₃ : (f x : ℝ) > 1 := by linarith
            have h₁₄ : (f x : ℝ) ^ 2 ≤ f x := h₈.1
            have h₁₅ : f x ≤ (f x : ℝ) ^ 3 := h₈.2
            have h₁₆ : (f x : ℝ) = (x : ℝ) ^ 1 := by
              
              nlinarith
            linarith
          norm_cast
      norm_cast
    norm_cast
