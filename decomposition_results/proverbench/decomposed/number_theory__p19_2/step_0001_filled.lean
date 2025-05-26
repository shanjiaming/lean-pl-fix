theorem infinitely_many_primes_10k_plus_9  : ∃ S, S.Infinite ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 9 [MOD 10] :=
  by
  have h_main : ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 9 [MOD 10] := by sorry
  --  obtain ⟨S, hS_infinite, hS_property⟩ := h_main
  --  refine' ⟨S, hS_infinite, _⟩
  exact hS_property
  hole