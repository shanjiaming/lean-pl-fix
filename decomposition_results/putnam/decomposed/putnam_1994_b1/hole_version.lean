macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)

theorem putnam_1994_b1
    (n : ℤ) :
    n ∈ (({n : ℤ | (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350)}) : Set ℤ ) ↔
    (0 < n ∧ {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard = 15) := by
  have h_main : n ∈ ({n : ℤ | (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350)} : Set ℤ) → (0 < n ∧ {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard = 15) := by
    intro hn
    have h₁ : 0 < n := by
      
      hole_2
    have h₂ : {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard = 15 := by
      
      have h₃ : (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350) := by
        hole_4
      have h₄ : n ≥ 315 := by
        hole_5
      have h₅ : n ≤ 350 := by
        hole_6
      
      hole_3
    hole_1
  
  have h_converse : (0 < n ∧ {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard = 15) → n ∈ ({n : ℤ | (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350)} : Set ℤ) := by
    rintro ⟨hn_pos, hn_card⟩
    have h₁ : (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350) := by
      
      
      have h₂ : n ≥ 315 := by
        by_contra hn_lt
        
        have h₃ : n ≤ 314 := by hole_7
        have h₄ : n > 0 := hn_pos
        
        
        have h₅ : n ≤ 314 := by hole_8
        have h₆ : {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard ≠ 15 := by
          
          have h₇ : n ≤ 314 := by hole_10
          have h₈ : n > 0 := hn_pos
          hole_9
        contradiction
      have h₃ : n ≤ 325 ∨ n ≥ 332 := by
        by_contra h
        
        have h₄ : n > 325 := by
          by_contra h₅
          have h₆ : n ≤ 325 := by linarith
          have h₇ : n ≥ 332 := by
            by_contra h₈
            have h₉ : n < 332 := by linarith
            have h₁₀ : n > 0 := hn_pos
            have h₁₁ : {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard ≠ 15 := by
              interval_cases n <;> norm_num [Set.ext_iff, Set.mem_setOf_eq, Int.natAbs_eq_iff, sq, Int.emod_eq_of_lt] at * <;>
                (try decide) <;>
                (try norm_num) <;>
                (try aesop) <;>
                (try
                  {
                    norm_num [Nat.card_eq_fintype_card, Fintype.card_finset, Finset.card_range] at *
                    <;>
                    norm_num <;>
                    rfl
                  }) <;>
                (try omega)
            contradiction
          omega
        have h₅ : n < 332 := by
          by_contra h₆
          have h₇ : n ≥ 332 := by linarith
          omega
        have h₆ : n > 325 := by omega
        have h₇ : n < 332 := by omega
        have h₈ : n > 0 := hn_pos
        have h₉ : {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard ≠ 15 := by
          interval_cases n <;> norm_num [Set.ext_iff, Set.mem_setOf_eq, Int.natAbs_eq_iff, sq, Int.emod_eq_of_lt] at * <;>
            (try decide) <;>
            (try norm_num) <;>
            (try aesop) <;>
            (try
              {
                norm_num [Nat.card_eq_fintype_card, Fintype.card_finset, Finset.card_range] at *
                <;>
                norm_num <;>
                rfl
              }) <;>
            (try omega)
        contradiction
      cases h₃ with
      | inl h₃ =>
        
        have h₄ : 315 ≤ n := by linarith
        have h₅ : n ≤ 325 := by linarith
        exact Or.inl ⟨h₄, h₅⟩
      | inr h₃ =>
        
        have h₄ : n ≥ 332 := by linarith
        have h₅ : n ≤ 350 := by
          by_contra h₅
          have h₆ : n > 350 := by linarith
          have h₇ : n > 0 := hn_pos
          have h₈ : {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard ≠ 15 := by
            
            have h₉ : n ≥ 351 := by linarith
            interval_cases n <;> norm_num [Set.ext_iff, Set.mem_setOf_eq, Int.natAbs_eq_iff, sq, Int.emod_eq_of_lt] at * <;>
              (try decide) <;>
              (try norm_num) <;>
              (try aesop) <;>
              (try
                {
                  norm_num [Nat.card_eq_fintype_card, Fintype.card_finset, Finset.card_range] at *
                  <;>
                  norm_num <;>
                  rfl
                }) <;>
              (try omega)
          contradiction
        exact Or.inr ⟨h₄, h₅⟩
    simpa using h₁
  
  have h_final : (n ∈ (({n : ℤ | (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350)}) : Set ℤ) ↔ (0 < n ∧ {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard = 15)) := by
    exact ⟨fun h ↦ h_main h, fun h ↦ h_converse h⟩
  
  rw [h_final]
  <;> aesop