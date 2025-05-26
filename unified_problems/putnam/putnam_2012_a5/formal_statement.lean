theorem putnam_2012_a5
  (n p : ℕ)
  (hn : n > 0)
  (hp : Nat.Prime p)
  {F : Type*} [Field F] [Fintype F]
  (hK : Fintype.card F = p)
  (G : Matrix (Fin n) (Fin n) F → (Fin n → F) → (Fin n → F) → (Fin n → F))
  (hG : ∀ M v x, G M v x = v + mulVec M x) :
  (n, p) ∈ (({q | let ⟨n, _⟩ := q; n = 1} ∪ {(2,2)}) : Set (ℕ × ℕ) ) ↔
    ∃ᵉ (M : Matrix (Fin n) (Fin n) F) (v : (Fin n → F)),
      ¬(∃ i j : Finset.range (p^n), i ≠ j ∧ (G M v)^[i + 1] 0 = (G M v)^[j + 1] 0) :=
  by