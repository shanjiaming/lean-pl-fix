theorem infinitely_many_primes_4k_plus_1 : ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 1 [MOD 4]:=
  by
  have h_main : ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 1 [MOD 4]:=
    by
    --  use {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]}
    constructor
    ·
      have h₁ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]}:=
        by
        have h₂ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]}:=
          by
          have h₃ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]}:= by -- exact Nat.infinite_setOf_prime_mod_one_four
            hole
          --  exact h₃
          simpa
        --  exact h₂
        simpa
      exact h₁
    · intro p hp
      aesop
    hole
  --  exact h_main
  hole