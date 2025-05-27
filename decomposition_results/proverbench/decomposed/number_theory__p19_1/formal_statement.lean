theorem infinitely_many_primes_4k_plus_1 :
  ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 1 [MOD 4] :=