macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem infinitely_many_primes_4k_plus_1 :
  ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 1 [MOD 4] := by
  have h_main : ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 1 [MOD 4] := by
    use {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]}
    constructor
    · 
      have h₁ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]} := by
        have h₂ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]} := by
          
          have h₃ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]} := by
            
            
            
            hole_5
          hole_4
        hole_3
      hole_2
  hole_1