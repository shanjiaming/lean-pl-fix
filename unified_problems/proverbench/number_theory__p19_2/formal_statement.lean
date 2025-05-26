theorem infinitely_many_primes_10k_plus_9 :
  ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 9 [MOD 10] :=