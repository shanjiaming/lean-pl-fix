theorem infinitely_many_primes_10k_plus_9 :
  ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 9 [MOD 10] := by
  have h_main : ∃ (S : Set ℕ), Set.Infinite S ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 9 [MOD 10] := by
    classical
    by_contra!
    -- We will derive a contradiction from the assumption that no such S exists.
    have h₁ := this ∅
    have h₂ := this (Set.univ)
    have h₃ := this {0}
    have h₄ := this {1}
    have h₅ := this {2}
    have h₆ := this {3}
    have h₇ := this {4}
    have h₈ := this {5}
    have h₉ := this {6}
    have h₁₀ := this {7}
    have h₁₁ := this {8}
    have h₁₂ := this {9}
    have h₁₃ := this {10}
    have h₁₄ := this {11}
    have h₁₅ := this {12}
    have h₁₆ := this {13}
    have h₁₇ := this {14}
    have h₁₈ := this {15}
    have h₁₉ := this {16}
    have h₂₀ := this {17}
    have h₂₁ := this {18}
    have h₂₂ := this {19}
    have h₂₃ := this {20}
    -- Normalize the sets to ensure they are in the correct form.
    norm_num [Set.Infinite, Set.Finite, Set.subset_def, Nat.ModEq] at h₁ h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ h₂₁ h₂₂ h₂₃
    <;> aesop
  
  obtain ⟨S, hS_infinite, hS_property⟩ := h_main
  refine' ⟨S, hS_infinite, _⟩
  exact hS_property