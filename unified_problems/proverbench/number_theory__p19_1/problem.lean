theorem infinitely_many_primes_4k_plus_1 :
  ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 1 [MOD 4] := by
  have h_main : ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 1 [MOD 4] := by
    use {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]}
    constructor
    · -- Prove that the set is infinite
      have h₁ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]} := by
        have h₂ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]} := by
          -- Use the theorem `Nat.exists_infinite_primes_mod_one` to prove the infinitude
          have h₃ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]} := by
            -- `Nat.Coprime 4 1` is `True` because `Nat.gcd 4 1 = 1`
            -- `1 ≠ 0` is `True`
            -- Apply `Nat.exists_infinite_primes_mod_one 4 1 (by decide) (by decide)`
            exact Nat.infinite_setOf_prime_mod_one_four
          exact h₃
        exact h₂
      exact h₁
    · -- Prove that every element in the set is a prime and ≡ 1 [MOD 4]
      intro p hp
      aesop
  exact h_main