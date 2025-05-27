theorem putnam_2008_a3
      (n : ℕ) (npos : n > 0)
      (a : Fin n → ℕ)
      (apos : ∀ i : Fin n, a i > 0)
      (cont : (Fin n → ℕ) → Prop)
      (hcont : ∀ s, cont s ↔ ∃ j k : Fin n, j < k ∧ ¬(s j ∣ s k))
      (init trans : (ℕ → Fin n → ℕ) → Prop)
      (hinit : ∀ P, init P ↔ P 0 = a)
      (htrans : ∀ P, trans P ↔ ∀ t : ℕ, cont (P t) →
            ∃ j k : Fin n, j < k ∧ ¬(P t j ∣ P t k) ∧ P (t + 1) j = Nat.gcd (P t j) (P t k) ∧ P (t + 1) k = Nat.lcm (P t j) (P t k) ∧
            ∀ i : Fin n, i ≠ j → i ≠ k → P (t + 1) i = P t i) :
      (∃ f, ∀ P, init P → trans P → ∃ t : ℕ, ¬cont (P t) ∧ P t = f) := by