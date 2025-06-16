theorem putnam_2020_a2
(k : ℕ)
: (∑ j in Finset.Icc 0 k, 2 ^ (k - j) * Nat.choose (k + j) j = ((fun k ↦ 4 ^ k) : ℕ → ℕ ) k) := by
  have h₀ : ∑ j in Finset.Icc 0 k, 2 ^ (k - j) * Nat.choose (k + j) j = 4 ^ k := by
    have h₁ : ∀ n : ℕ, ∑ j in Finset.Icc 0 n, 2 ^ (n - j) * Nat.choose (n + j) j = 4 ^ n := by
      intro n
      have h₂ : ∑ j in Finset.Icc 0 n, 2 ^ (n - j) * Nat.choose (n + j) j = ∑ j in Finset.range (n + 1), 2 ^ (n - j) * Nat.choose (n + j) j := by
        admit
      rw [h₂]
      have h₃ : ∑ j in Finset.range (n + 1), 2 ^ (n - j) * Nat.choose (n + j) j = 4 ^ n := by
        
        have h₄ : ∑ j in Finset.range (n + 1), 2 ^ (n - j) * (Nat.choose (n + j) j) = 4 ^ n := by
          
          have h₅ : ∑ j in Finset.range (n + 1), 2 ^ (n - j) * (Nat.choose (n + j) j) = ∑ j in Finset.range (n + 1), 2 ^ (n - j) * (Nat.choose (n + j) j) := rfl
          rw [h₅]
          
          have h₆ : ∑ j in Finset.range (n + 1), 2 ^ (n - j) * (Nat.choose (n + j) j) = 4 ^ n := by
            
            have h₇ : ∀ n : ℕ, ∑ j in Finset.range (n + 1), 2 ^ (n - j) * (Nat.choose (n + j) j) = 4 ^ n := by
              intro n
              
              have h₈ : ∑ j in Finset.range (n + 1), 2 ^ (n - j) * (Nat.choose (n + j) j) = 4 ^ n := by
                
                have h₉ : ∑ j in Finset.range (n + 1), 2 ^ (n - j) * (Nat.choose (n + j) j) = 4 ^ n := by
                  
                  admit
  admit