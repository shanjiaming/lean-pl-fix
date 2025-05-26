theorem h_converse (f : ℤ → ℤ) (h_imp : (f = fun n => 1 - n) → (∀ (n : ℤ), f (f n) = n) ∧ (∀ (n : ℤ), f (f (n + 2) + 2) = n) ∧ f 0 = 1) : (∀ (n : ℤ), f (f n) = n) ∧ (∀ (n : ℤ), f (f (n + 2) + 2) = n) ∧ f 0 = 1 → f = fun n => 1 - n :=
  by
  intro h
  have h₁ : ∀ n : ℤ, f (f n) = n := h.1
  have h₂ : ∀ n : ℤ, f (f (n + 2) + 2) = n := h.2.1
  have h₃ : f 0 = 1 := h.2.2
  have h₄ : f 1 = 0 := by sorry
  have h₅ : ∀ n : ℤ, f (n + 2) = f n - 2 := by sorry
  have h₆ : ∀ n : ℤ, f n = 1 - n := by sorry
  funext n
  exact h₆ n