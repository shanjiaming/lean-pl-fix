macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1963_b1
: ∀ a : ℤ, (X^2 - X + (C a)) ∣ (X ^ 13 + X + (C 90)) ↔ a = ((2) : ℤ ) := by
  intro a
  have h_main : (X^2 - X + (C a)) ∣ (X ^ 13 + X + (C 90)) ↔ a = 2 := by
    constructor
    · 
      intro h
      have h₁ : a = 2 := by
        
        have h₂ := h
        rw [dvd_iff_exists_eq_mul_left] at h₂
        obtain ⟨q, hq⟩ := h₂
        have h₃ := congr_arg (fun p => eval 0 p) hq
        have h₄ := congr_arg (fun p => eval 1 p) hq
        have h₅ := congr_arg (fun p => eval 2 p) hq
        have h₆ := congr_arg (fun p => eval (-1) p) hq
        have h₇ := congr_arg (fun p => eval (-2) p) hq
        hole_3
      exact h₁
    · 
      intro h
      rw [h]
      
      have h₁ : (X ^ 2 - X + C (2 : ℤ)) ∣ (X ^ 13 + X + C 90) := by
        
        hole_4
      hole_2
  hole_1