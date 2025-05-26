theorem h₃ (S T : Set ℤ) (hS : S = {k | ∃ j, 0 ≤ j ∧ j ≤ 33 ∧ k = 3 * j + 1}) (hT : T ⊆ S ∧ T.ncard = 20) (h : ∀ m ∈ T, ∀ n ∈ T, m ≠ n → m + n ≠ 104) (h₁ : T ⊆ S) (h₂ : T.ncard = 20) : ∀ m ∈ T, ∀ n ∈ T, m ≠ n → m + n ≠ 104 :=
  by
  intro m hm n hn hne
  have h₄ := h m hm n hn
  tauto