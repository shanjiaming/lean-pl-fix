theorem h₂ (n : ℕ) (pnat : Equiv.Perm (Fin n) → ℕ → ℕ) (pcount : Equiv.Perm (Fin n) → ℕ) (ngt1 : n > 1) (hpnat : ∀ (p : Equiv.Perm (Fin n)) (k : Fin n), pnat p (↑k : ℕ) = (↑((p : Fin n → Fin n) k) : ℕ)) (hpcount :  ∀ (p : Equiv.Perm (Fin n)),    (↑(pcount p) : ℕ∞) =      {k |          ((↑k : ℕ) = 0 ∨ pnat p ((↑k : ℕ) - 1) < pnat p (↑k : ℕ)) ∧            ((↑k : ℕ) = n - 1 ∨ pnat p (↑k : ℕ) > pnat p ((↑k : ℕ) + 1))}.encard) (h₁ : False) : (↑(∑ p, pcount p) : ℝ) / (↑{p | true = true}.ncard : ℝ) = (fun n => ((↑n : ℝ) + 1) / 3) n :=
  by
  exfalso
  exact h₁