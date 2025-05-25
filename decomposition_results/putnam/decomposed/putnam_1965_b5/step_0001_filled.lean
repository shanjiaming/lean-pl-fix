theorem putnam_1965_b5 (K : Type u_1) (inst✝ : Fintype K) (V E : ℕ) (hV : V = Nat.card K) (hE : 4 * E ≤ V ^ 2) : ∃ G, G.edgeSet.ncard = E ∧ ∀ (a : K) (w : G.Walk a a), w.length ≠ 3 :=
  by
  have h₁ : ∃ (G : SimpleGraph K), G.edgeSet.ncard = E ∧ ∀ (a : K), ∀ (w : G.Walk a a), w.length ≠ 3 := by sorry
  aesop
  hole