theorem h_main (P : ℕ → Prop) (hP : ∀ (n : ℕ), P n ↔ ∀ (p : ℕ), Nat.Prime p ∧ p ∣ n ^ 2 + 3 → ∃ k, ↑p ∣ ↑k ^ 2 + 3 ∧ k ^ 2 < n) : ∀ (n : ℕ), ∃ m, ↑m > ↑n ∧ P m := by
  --  intro n
  have h₁ : ∃ m : ℕ, (m : ℤ) > n ∧ P m := by sorry
  --  exact h₁
  hole