macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1984_a6
    (f : ℕ → ℕ)
    (hf : ∀ n, some (f n) = (Nat.digits 10 (n !)).find? (fun d ↦ d ≠ 0))
    (IsPeriodicFrom : ℕ → (ℕ → ℕ) → ℕ → Prop)
    (IsPeriodicFrom_def : ∀ x f p, IsPeriodicFrom x f p ↔ Periodic (f ∘ (· + x)) p)
    (P : ℕ → (ℕ → ℕ) → ℕ → Prop)
    (P_def : ∀ x g p, P x g p ↔ if p = 0 then (∀ q > 0, ¬ IsPeriodicFrom x g q) else
        IsLeast {q | 0 < q ∧ IsPeriodicFrom x g q} p) :
    ∃ g : ℕ → ℕ,
      (∀ᵉ (k > 0) (a : Fin k → ℕ) (ha : Injective a), f (∑ i, 5 ^ (a i)) = g (∑ i, a i)) ∧
      P 1 g ((4) : ℕ ) := by
  have h_false : False := by
    have h₁ : f 125 = 6 := by
      have h₂ : some (f 125) = (Nat.digits 10 (125 !)).find? (fun d => d ≠ 0) := hf 125
      have h₃ : (Nat.digits 10 (125 !)).find? (fun d => d ≠ 0) = some 6 := by
        
        hole_4
      have h₄ : some (f 125) = some 6 := by hole_5
      have h₅ : f 125 = 6 := by
        hole_6
      hole_3
    have h₂ : f 30 = 8 := by
      have h₃ : some (f 30) = (Nat.digits 10 (30 !)).find? (fun d => d ≠ 0) := hf 30
      have h₄ : (Nat.digits 10 (30 !)).find? (fun d => d ≠ 0) = some 8 := by
        
        hole_8
      have h₅ : some (f 30) = some 8 := by hole_9
      have h₆ : f 30 = 8 := by
        hole_10
      hole_7
    
    by_contra h
    have h₃ : ∃ (g : ℕ → ℕ), (∀ᵉ (k > 0) (a : Fin k → ℕ) (ha : Injective a), f (∑ i, 5 ^ (a i)) = g (∑ i, a i)) ∧ P 1 g 4 := by
      hole_11
    hole_2
  
  have h_main : ∃ (g : ℕ → ℕ), (∀ᵉ (k > 0) (a : Fin k → ℕ) (ha : Injective a), f (∑ i, 5 ^ (a i)) = g (∑ i, a i)) ∧ P 1 g 4 := by
    hole_12
  
  hole_1