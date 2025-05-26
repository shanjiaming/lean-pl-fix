theorem infinitely_many_primes_4k_plus_1  : ∃ S, S.Infinite ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 1 [MOD 4] :=
  by
  have h_main : ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 1 [MOD 4] := by sorry
  exact h_main