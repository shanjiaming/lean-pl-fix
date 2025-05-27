theorem h₁ (n✝ : ℕ) (R✝ : Type u_1) (inst✝¹ : Field R✝) (inst✝ : Nontrivial R✝) (P Q R : R✝[X]) (hP : P = X ^ n✝ + X - 1) (hQ : Q = X ^ 2 - X + 1) (hR : R = X ^ 3 - X + 1) (n : ℕ) : P ∣ Q ↔ ∃ i, n = 6 * i - 1 :=
  by
  have h₁₁ : P ∣ Q → ∃ i : ℕ, n = 6 * i - 1 := by sorry
  have h₁₂ : (∃ i : ℕ, n = 6 * i - 1) → P ∣ Q := by sorry
  exact ⟨h₁₁, h₁₂⟩