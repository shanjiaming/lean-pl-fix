theorem h_main (nmat : ℕ → Prop) (hnmat : ∀ (n : ℕ), nmat n ↔ ∃ A, (∀ (r : Fin n), Even (A r ⬝ᵥ A r)) ∧ Pairwise fun r1 r2 => Odd (A r1 ⬝ᵥ A r2)) (n : ℕ) (npos : 0 < n) : nmat n ↔ Odd n := by
  --  rw [hnmat]
  --  constructor
  --  · intro h
    have h₁ :
      ∃ (A : Matrix (Fin n) (Fin n) ℤ), (∀ r, Even ((A r) ⬝ᵥ (A r))) ∧ Pairwise fun r1 r2 => Odd ((A r1) ⬝ᵥ (A r2)) := h
    obtain ⟨A, hA₁, hA₂⟩ := h₁
    have h₂ : Odd n := by sorry
    exact h₂
  --  · intro h
    have h₁ : Odd n := h
    have h₂ :
      ∃ (A : Matrix (Fin n) (Fin n) ℤ), (∀ r, Even ((A r) ⬝ᵥ (A r))) ∧ Pairwise fun r1 r2 => Odd ((A r1) ⬝ᵥ (A r2)) := by sorry
  --    exact h₂
  hole