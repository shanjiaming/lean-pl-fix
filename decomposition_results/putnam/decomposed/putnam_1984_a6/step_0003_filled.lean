theorem h₁ (f : ℕ → ℕ) (hf : ∀ (n : ℕ), some (f n) = List.find? (fun d => decide (d ≠ 0)) (digits 10 n !)) (IsPeriodicFrom : ℕ → (ℕ → ℕ) → ℕ → Prop) (IsPeriodicFrom_def : ∀ (x : ℕ) (f : ℕ → ℕ) (p : ℕ), IsPeriodicFrom x f p ↔ sorry) (P : ℕ → (ℕ → ℕ) → ℕ → Prop) (P_def :  ∀ (x : ℕ) (g : ℕ → ℕ) (p : ℕ),    P x g p ↔ if p = 0 then ∀ q > 0, ¬IsPeriodicFrom x g q else IsLeast {q | 0 < q ∧ IsPeriodicFrom x g q} p) : f 125 = 6 :=
  by
  have h₂ : some (f 125) = (Nat.digits 10 (125!)).find? (fun d => d ≠ 0) := hf 125
  have h₃ : (Nat.digits 10 (125!)).find? (fun d => d ≠ 0) = some 6 := by sorry
  have h₄ : some (f 125) = some 6 := by sorry
  have h₅ : f 125 = 6 := by sorry
  --  exact h₅
  linarith