macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem five_pow_gt_factorial_iff_le_eleven (n : ℕ) (hn : 0 < n) : 5^n > n! ↔ n ≤ 11 := by
  have h_main : (5^n > n! → n ≤ 11) ∧ (n ≤ 11 → 5^n > n!) := by
    refine' ⟨_, _⟩
    · 
      intro h
      by_contra! h₁
      
      have h₂ : ∀ k : ℕ, k ≥ 12 → 5^k ≤ k ! := by
        intro k hk
        induction' hk with k hk IH
        · 
          norm_num [Nat.factorial]
        · 
          have h₃ : 5 ≤ k := by hole_4
          have h₄ : 5 ^ (k + 1) = 5 * 5 ^ k := by
            hole_5
          rw [h₄]
          have h₅ : 5 * 5 ^ k ≤ 5 * k ! := by
            hole_6
          have h₆ : 5 * k ! ≤ (k + 1) * k ! := by
            have h₇ : 5 ≤ k + 1 := by hole_8
            hole_7
          have h₇ : (k + 1) * k ! = (k + 1)! := by
            hole_9
          hole_3
      
      have h₃ : n ≥ 12 := by hole_10
      have h₄ : 5 ^ n ≤ n ! := h₂ n h₃
      
      omega
    · 
      intro h
      have h₁ : n ≤ 11 := h
      hole_2
  
  have h_final : 5^n > n! ↔ n ≤ 11 := by
    hole_11
  
  hole_1