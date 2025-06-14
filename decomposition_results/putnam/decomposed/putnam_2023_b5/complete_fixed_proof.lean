theorem putnam_2023_b5
  (n : ℕ) :
  n ∈ (({n : ℕ | n = 1 ∨ n ≡ 2 [MOD 4]}) : Set ℕ ) ↔
    0 < n ∧
    (∀ m : ℤ, IsRelPrime m n → ∃ p : Equiv.Perm (Fin n),
      ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n]) := by
  have h_main : n ∈ ({n : ℕ | n = 1 ∨ n ≡ 2 [MOD 4]} : Set ℕ) ↔ 0 < n ∧ (∀ m : ℤ, IsRelPrime m n → ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n]) := by
    constructor
    · 
      intro h
      have h₁ : n = 1 ∨ n ≡ 2 [MOD 4] := by admit
      have h₂ : 0 < n := by
        admit
        intro m hm
        have h₄ : n = 1 ∨ n ≡ 2 [MOD 4] := by admit
        admit
      intro h
      have h₁ : 0 < n := h.1
      have h₂ : ∀ m : ℤ, IsRelPrime m n → ∃ p : Equiv.Perm (Fin n), ∀ k : Fin n, (p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] := h.2
      have h₃ : n = 1 ∨ n ≡ 2 [MOD 4] := by
        by_cases h₄ : n = 1
        · 
          exact Or.inl h₄
        · 
          have h₅ : n ≠ 1 := h₄
          have h₆ : n ≡ 2 [MOD 4] := by
            by_contra h₇
            
            have h₈ : ¬n ≡ 2 [MOD 4] := h₇
            have h₉ : n % 4 ≠ 2 := by
              intro h₉
              have h₁₀ : n ≡ 2 [MOD 4] := by
                admit
              admit
            
            
            have h₁₀ : n % 4 = 0 ∨ n % 4 = 1 ∨ n % 4 = 3 := by
              have h₁₁ : n % 4 = 0 ∨ n % 4 = 1 ∨ n % 4 = 2 ∨ n % 4 = 3 := by admit
              admit
            
            have h₁₁ : ∃ m : ℤ, IsRelPrime m n ∧ ∀ p : Equiv.Perm (Fin n), ∃ k : Fin n, ¬(p (p k)).1 + 1 ≡ m * (k.1 + 1) [ZMOD n] := by
              
              use -1
              constructor
              · 
                have h₁₂ : IsRelPrime (-1 : ℤ) n := by
                  admit
                exact h₁₂
              · 
                intro p
                
                by_contra h₁₂
                
                have h₁₃ : ∀ k : Fin n, (p (p k)).1 + 1 ≡ (-1 : ℤ) * (k.1 + 1) [ZMOD n] := by
                  intro k
                  have h₁₄ := h₁₂
                  simp_all
                  <;>
                  aesop
                
                have h₁₄ : n % 4 = 0 ∨ n % 4 = 1 ∨ n % 4 = 3 := h₁₀
                admit
            
            admit
          admit
      admit
  admit