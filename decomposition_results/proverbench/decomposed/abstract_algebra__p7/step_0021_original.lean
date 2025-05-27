theorem h_converse (P : Polynomial ℝ) (h_main_implications :  (∀ (x : ℝ), Polynomial.eval x P ^ 2 - 2 = 2 * Polynomial.eval (2 * x ^ 2 - 1) P) →    ∃ a, a ^ 2 - 2 * a - 2 = 0 ∧ P = Polynomial.C a) : (∃ a, a ^ 2 - 2 * a - 2 = 0 ∧ P = Polynomial.C a) →
    ∀ (x : ℝ), Polynomial.eval x P ^ 2 - 2 = 2 * Polynomial.eval (2 * x ^ 2 - 1) P :=
  by
  rintro ⟨a, ha, hP⟩
  have h₁ : P = Polynomial.C a := by sorry
  have h₂ : a ^ 2 - 2 * a - 2 = 0 := ha
  intro x
  rw [h₁]
  simp [Polynomial.eval_C] <;> (try nlinarith) <;> (try ring_nf at h₂ ⊢ <;> nlinarith) <;> (try linarith)