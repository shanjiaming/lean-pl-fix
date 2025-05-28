theorem h₄ (P : ℕ → Prop) (hP : ∀ (n : ℕ), P n ↔ ∀ (p : ℕ), Nat.Prime p ∧ p ∣ n ^ 2 + 3 → ∃ k, ↑p ∣ ↑k ^ 2 + 3 ∧ k ^ 2 < n) (n p : ℕ) (hp : Nat.Prime p ∧ p ∣ (3 * (n + 1)) ^ 2 + 3) (h₂ : p ∣ (3 * (n + 1)) ^ 2 + 3) (h₃ : Nat.Prime p) : p = 2 ∨ p = 3 ∨ p ≥ 5 := by
  have h₅ := h₃.two_le
  have h₆ := h₃.eq_two_or_odd
  cases h₆ with
  | inl h₆ => exact Or.inl h₆
  | inr h₆ =>
    have h₇ : p ≠ 0 := by linarith
    have h₈ : p ≠ 1 := by
      intro h
      have h₉ := h₃.ne_one
      contradiction
    have h₉ : p ≥ 3 := by
      by_contra h
      interval_cases p <;> contradiction
    have h₁₀ : p = 3 ∨ p ≥ 5 := by omega
    cases h₁₀ with
    | inl h₁₀ => exact Or.inr (Or.inl h₁₀)
    | inr h₁₀ => exact Or.inr (Or.inr h₁₀)