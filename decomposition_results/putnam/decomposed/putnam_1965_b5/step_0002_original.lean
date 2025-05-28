theorem h₁ (K : Type u_1) (inst✝ : Fintype K) (V E : ℕ) (hV : V = Nat.card K) (hE : 4 * E ≤ V ^ 2) : ∃ G, G.edgeSet.ncard = E ∧ ∀ (a : K) (w : G.Walk a a), w.length ≠ 3 :=
  by
  by_cases h : E = 0
  · use ⊥
    constructor
    · simp [h] <;> aesop
    · intro a w
      have h₂ : w.length = 0 := by sorry
      omega
  ·
    have h₂ : 1 ≤ E := by sorry
    have h₃ : V ≥ 1 := by sorry
    have h₄ : ∃ (G : SimpleGraph K), G.edgeSet.ncard = E ∧ ∀ (a : K), ∀ (w : G.Walk a a), w.length ≠ 3 := by sorry
    aesop