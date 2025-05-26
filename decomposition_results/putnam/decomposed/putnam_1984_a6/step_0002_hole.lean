theorem h_false (f : ℕ → ℕ) (hf : ∀ (n : ℕ), some (f n) = List.find? (fun d => decide (d ≠ 0)) (digits 10 n !)) (IsPeriodicFrom : ℕ → (ℕ → ℕ) → ℕ → Prop) (IsPeriodicFrom_def : ∀ (x : ℕ) (f : ℕ → ℕ) (p : ℕ), IsPeriodicFrom x f p ↔ sorry) (P : ℕ → (ℕ → ℕ) → ℕ → Prop) (P_def :  ∀ (x : ℕ) (g : ℕ → ℕ) (p : ℕ),    P x g p ↔ if p = 0 then ∀ q > 0, ¬IsPeriodicFrom x g q else IsLeast {q | 0 < q ∧ IsPeriodicFrom x g q} p) : False :=
  by
  have h₁ : f 125 = 6 := by sorry
  have h₂ : f 30 = 8 := by sorry
  --  by_contra h
  have h₃ :
    ∃ (g : ℕ → ℕ), (∀ᵉ (k > 0) (a : Fin k → ℕ) (ha : Injective a), f (∑ i, 5 ^ (a i)) = g (∑ i, a i)) ∧ P 1 g 4 := by
    classical exact ⟨fun _ => 0, by tauto, by tauto⟩
  --  rcases h₃ with ⟨g, hg₁, hg₂⟩
  have h₄ : f (∑ i : Fin 1, 5 ^ (![3] i : ℕ)) = g (∑ i : Fin 1, (![3] i : ℕ)) :=
    hg₁ 1 (by decide) _
      (by
        intro i j h
        fin_cases i <;> fin_cases j <;> simp_all (config := { decide := true }))
  have h₅ : f (∑ i : Fin 1, 5 ^ (![3] i : ℕ)) = f (5 ^ 3) := by simp [Fin.sum_univ_succ] <;> rfl
  have h₆ : g (∑ i : Fin 1, (![3] i : ℕ)) = g 3 := by simp [Fin.sum_univ_succ] <;> rfl
  have h₇ : f (5 ^ 3) = g 3 := by linarith
  have h₈ : f (∑ i : Fin 2, 5 ^ (![1, 2] i : ℕ)) = g (∑ i : Fin 2, (![1, 2] i : ℕ)) :=
    hg₁ 2 (by decide) _
      (by
        intro i j h
        fin_cases i <;> fin_cases j <;> simp_all (config := { decide := true }) <;>
              simp_all [Fin.ext_iff, Function.funext_iff] <;>
            norm_num at * <;>
          aesop)
  have h₉ : f (∑ i : Fin 2, 5 ^ (![1, 2] i : ℕ)) = f 30 := by
    simp [Fin.sum_univ_succ, Matrix.cons_val_zero, Matrix.cons_val_succ, Matrix.head_cons, Nat.pow_succ] <;> norm_num
  have h₁₀ : g (∑ i : Fin 2, (![1, 2] i : ℕ)) = g 3 := by
    simp [Fin.sum_univ_succ, Matrix.cons_val_zero, Matrix.cons_val_succ, Matrix.head_cons] <;> norm_num
  have h₁₁ : f 30 = g 3 := by linarith
  have h₁₂ : f (5 ^ 3) = 6 := by simpa [h₁] using h₁
  have h₁₃ : f 30 = 8 := by simpa [h₂] using h₂
  have h₁₄ : g 3 = 6 := by linarith
  have h₁₅ : g 3 = 8 := by linarith
  have h₃ : ∃ (g : ℕ → ℕ), (∀ᵉ (k > 0) (a : Fin k → ℕ) (ha : Injective a), f (∑ i, 5 ^ (a i)) = g (∑ i, a i)) ∧ P 1 g 4 := by sorry
have h_false : False :=
  by
  have h₁ : f 125 = 6 := by sorry
  have h₂ : f 30 = 8 := by sorry
  by_contra h
  have h₃ :
    ∃ (g : ℕ → ℕ), (∀ᵉ (k > 0) (a : Fin k → ℕ) (ha : Injective a), f (∑ i, 5 ^ (a i)) = g (∑ i, a i)) ∧ P 1 g 4 := by
    classical exact ⟨fun _ => 0, by tauto, by tauto⟩
  rcases h₃ with ⟨g, hg₁, hg₂⟩
  have h₄ : f (∑ i : Fin 1, 5 ^ (![3] i : ℕ)) = g (∑ i : Fin 1, (![3] i : ℕ)) :=
    hg₁ 1 (by decide) _
      (by
        intro i j h
        fin_cases i <;> fin_cases j <;> simp_all (config := { decide := true }))
  have h₅ : f (∑ i : Fin 1, 5 ^ (![3] i : ℕ)) = f (5 ^ 3) := by simp [Fin.sum_univ_succ] <;> rfl
  have h₆ : g (∑ i : Fin 1, (![3] i : ℕ)) = g 3 := by simp [Fin.sum_univ_succ] <;> rfl
  have h₇ : f (5 ^ 3) = g 3 := by linarith
  have h₈ : f (∑ i : Fin 2, 5 ^ (![1, 2] i : ℕ)) = g (∑ i : Fin 2, (![1, 2] i : ℕ)) :=
    hg₁ 2 (by decide) _
      (by
        intro i j h
        fin_cases i <;> fin_cases j <;> simp_all (config := { decide := true }) <;>
              simp_all [Fin.ext_iff, Function.funext_iff] <;>
            norm_num at * <;>
          aesop)
  have h₉ : f (∑ i : Fin 2, 5 ^ (![1, 2] i : ℕ)) = f 30 := by
    simp [Fin.sum_univ_succ, Matrix.cons_val_zero, Matrix.cons_val_succ, Matrix.head_cons, Nat.pow_succ] <;> norm_num
  have h₁₀ : g (∑ i : Fin 2, (![1, 2] i : ℕ)) = g 3 := by
    simp [Fin.sum_univ_succ, Matrix.cons_val_zero, Matrix.cons_val_succ, Matrix.head_cons] <;> norm_num
  have h₁₁ : f 30 = g 3 := by linarith
  have h₁₂ : f (5 ^ 3) = 6 := by simpa [h₁] using h₁
  have h₁₃ : f 30 = 8 := by simpa [h₂] using h₂
  have h₁₄ : g 3 = 6 := by linarith
  have h₁₅ : g 3 = 8 := by linarith
  linarith
  hole