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
          have h₃ : 5 ≤ k := by admit
          have h₄ : 5 ^ (k + 1) = 5 * 5 ^ k := by
            admit
          rw [h₄]
          have h₅ : 5 * 5 ^ k ≤ 5 * k ! := by
            admit
          have h₆ : 5 * k ! ≤ (k + 1) * k ! := by
            have h₇ : 5 ≤ k + 1 := by admit
            admit
          have h₇ : (k + 1) * k ! = (k + 1)! := by
            admit
          admit
      
      have h₃ : n ≥ 12 := by admit
      have h₄ : 5 ^ n ≤ n ! := h₂ n h₃
      
      omega
    · 
      intro h
      have h₁ : n ≤ 11 := h
      admit
  
  have h_final : 5^n > n! ↔ n ≤ 11 := by
    admit
  
  admit