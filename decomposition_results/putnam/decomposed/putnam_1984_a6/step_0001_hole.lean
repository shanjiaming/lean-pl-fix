theorem putnam_1984_a6 (f : ℕ → ℕ) (hf : ∀ (n : ℕ), some (f n) = List.find? (fun d => decide (d ≠ 0)) (digits 10 n !)) (IsPeriodicFrom : ℕ → (ℕ → ℕ) → ℕ → Prop) (IsPeriodicFrom_def : ∀ (x : ℕ) (f : ℕ → ℕ) (p : ℕ), IsPeriodicFrom x f p ↔ sorry) (P : ℕ → (ℕ → ℕ) → ℕ → Prop) (P_def :  ∀ (x : ℕ) (g : ℕ → ℕ) (p : ℕ),    P x g p ↔ if p = 0 then ∀ q > 0, ¬IsPeriodicFrom x g q else IsLeast {q | 0 < q ∧ IsPeriodicFrom x g q} p) : ∃ g, (∀ k > 0, ∀ (a : Fin k → ℕ), sorry → f (∑ i, 5 ^ a i) = g (∑ i, a i)) ∧ P 1 g 4 :=
  by
  have h_false : False := by sorry
  have h_main :
    ∃ (g : ℕ → ℕ), (∀ᵉ (k > 0) (a : Fin k → ℕ) (ha : Injective a), f (∑ i, 5 ^ (a i)) = g (∑ i, a i)) ∧ P 1 g 4 := by sorry
  --  exact h_main
  hole