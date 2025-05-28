theorem h_imp (x : ℕ → ℝ) (hx : ∀ (n : ℕ), x n ≠ 0 ∧ (n ≥ 3 → x n = x (n - 2) * x (n - 1) / (2 * x (n - 2) - x (n - 1)))) : (fun x =>
        match x with
        | (a, b) => ∃ m, a = ↑m ∧ b = ↑m)
      (x 1, x 2) →
    ∀ (m : ℕ), ∃ n > m, ∃ a, ↑a = x n :=
  by
  --  intro h
  have h₁ : ∃ m : ℤ, (x 1 : ℝ) = m ∧ (x 2 : ℝ) = m := by sorry
  --  rcases h₁ with ⟨m, hm₁, hm₂⟩
  have h₂ : ∀ n : ℕ, n ≥ 1 → (x n : ℝ) = m := by sorry
  --  intro m
  have h₃ : ∃ n : ℕ, n > m ∧ ∃ a : ℤ, a = x n := by sorry
  --  exact h₃
  hole