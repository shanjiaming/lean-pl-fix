theorem h_main (nabsum : ℕ → ℕ × (ℕ → ℕ) → Prop) (agt bge bg1 bg2 : ℕ × (ℕ → ℕ) → Prop) (A g B : ℕ → ℕ) (hnabsum :  ∀ n ≥ 1,    ∀ (ab : ℕ × (ℕ → ℕ)),      nabsum n ab ↔ ab.1 ≥ 1 ∧ (∀ i < ab.1, ab.2 i > 0) ∧ (∀ i ≥ ab.1, ab.2 i = 0) ∧ ∑ i, ab.2 (↑i : ℕ) = n) (hA :  ∀ n ≥ 1,    (↑(A n) : ℕ∞) =      {a |          nabsum n a ∧ (∀ (i : Fin (a.1 - 2)), a.2 (↑i : ℕ) > a.2 ((↑i : ℕ) + 1) + a.2 ((↑i : ℕ) + 2)) ∧ 1 < a.1 →            a.2 (a.1 - 2) > a.2 (a.1 - 1)}.encard) (hg : g 0 = 1 ∧ g 1 = 2 ∧ ∀ j ≥ 2, g j = g (j - 1) + g (j - 2) + 1) (hB :  ∀ n ≥ 1,    (↑(B n) : ℕ∞) =      {b |          nabsum n b ∧            (∀ (i : Fin (b.1 - 1)), b.2 (↑i : ℕ) ≥ b.2 ((↑i : ℕ) + 1)) ∧              (∀ (i : Fin b.1), ∃ j, b.2 (↑i : ℕ) = g j) ∧ ∃ k, b.2 0 = g k ∧ ∀ j ≤ k, ∃ i, b.2 (↑i : ℕ) = g j}.encard) : ∀ n ≥ 1, A n = B n := by
  intro n hn
  have h₁ := hA n hn
  have h₂ := hB n hn
  have h₃ : A n = 0 := by sorry
  have h₄ : B n = 0 := by sorry
  rw [h₃, h₄]