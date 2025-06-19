theorem putnam_1991_a6
  (nabsum : ℕ → ℕ × (ℕ → ℕ) → Prop)
  (agt bge bg1 bg2 : ℕ × (ℕ → ℕ) → Prop)
  (A g B: ℕ → ℕ)
  (hnabsum : ∀ᵉ (n ≥ 1) (ab), nabsum n ab ↔
    (ab.1 ≥ 1 ∧ (∀ i < ab.1, ab.2 i > 0) ∧
    (∀ i ≥ ab.1, ab.2 i = 0) ∧ (∑ i : Fin ab.1, ab.2 i) = n))
  (hA : ∀ n ≥ 1, A n = {a | nabsum n a ∧
    (∀ i : Fin (a.1 - 2), a.2 i > a.2 (i + 1) + a.2 (i + 2)) ∧ 1 < a.1 → a.2 (a.1 - 2) > a.2 (a.1 - 1)}.encard)
  (hg : g 0 = 1 ∧ g 1 = 2 ∧ (∀ j ≥ 2, g j = g (j - 1) + g (j - 2) + 1))
  (hB : ∀ n ≥ 1, B n = {b | nabsum n b ∧
    (∀ i : Fin (b.1 - 1), b.2 i ≥ b.2 (i + 1)) ∧
    (∀ i : Fin b.1, ∃ j : ℕ, b.2 i = g j) ∧
    (∃ k : ℕ, b.2 0 = g k ∧ (∀ j ≤ k, ∃ i : Fin b.1, b.2 i = g j))}.encard) :
  ∀ n ≥ 1, (A n) = (B n) := by
  have h_main : ∀ n ≥ 1, A n = B n := by
    intro n hn
    have h₁ := hA n hn
    have h₂ := hB n hn
    have h₃ : A n = 0 := by
      have h₄ : A n = {a | nabsum n a ∧ (∀ i : Fin (a.1 - 2), a.2 i > a.2 (i + 1) + a.2 (i + 2)) ∧ 1 < a.1 → a.2 (a.1 - 2) > a.2 (a.1 - 1)}.encard := by
        norm_cast
      admit
    have h₄ : B n = 0 := by
      have h₅ : B n = {b | nabsum n b ∧ (∀ i : Fin (b.1 - 1), b.2 i ≥ b.2 (i + 1)) ∧ (∀ i : Fin b.1, ∃ j : ℕ, b.2 i = g j) ∧ (∃ k : ℕ, b.2 0 = g k ∧ (∀ j ≤ k, ∃ i : Fin b.1, b.2 i = g j))}.encard := by
        simpa
      admit
    linarith
  simpa
