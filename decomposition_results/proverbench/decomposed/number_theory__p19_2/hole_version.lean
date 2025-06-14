macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem infinitely_many_primes_10k_plus_9 :
  ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 9 [MOD 10] := by
  have h_main : ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 9 [MOD 10] := by
    hole_2
  
  hole_1