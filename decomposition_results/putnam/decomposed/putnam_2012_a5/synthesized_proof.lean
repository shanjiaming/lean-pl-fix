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
      ¬(∃ i j : Finset.range (p^n), i ≠ j ∧ (G M v)^[i + 1] 0 = (G M v)^[j + 1] 0) := by
  have h_main : (n, p) ∈ (({q | let ⟨n, _⟩ := q; n = 1} ∪ {(2,2)}) : Set (ℕ × ℕ) ) ↔ ∃ᵉ (M : Matrix (Fin n) (Fin n) F) (v : (Fin n → F)), ¬(∃ i j : Finset.range (p^n), i ≠ j ∧ (G M v)^[i + 1] 0 = (G M v)^[j + 1] 0) := by
    constructor
    · 
      intro h
      have h₁ : n = 1 ∨ (n, p) = (2, 2) := by
        admit
      cases h₁ with
      | inl h₁ =>
        
        have h₂ : n = 1 := h₁
        subst_vars
        
        have h₃ : ∃ᵉ (M : Matrix (Fin 1) (Fin 1) F) (v : (Fin 1 → F)), ¬(∃ i j : Finset.range (p^1), i ≠ j ∧ (G M v)^[i + 1] 0 = (G M v)^[j + 1] 0) := by
          
          have h₄ : ∃ (v : (Fin 1 → F)), v ≠ 0 := by
            
            have h₅ : ∃ (x : F), x ≠ 0 := by
              admit
            obtain ⟨x, hx⟩ := h₅
            refine' ⟨fun _ => x, _⟩
            intro h₆
            have h₇ := congr_fun h₆ (⟨0, by decide⟩ : Fin 1)
            norm_cast
          obtain ⟨v, hv⟩ := h₄
          use 1, v
          have h₅ : ¬(∃ i j : Finset.range (p^1), i ≠ j ∧ (G (1 : Matrix (Fin 1) (Fin 1) F) v)^[i + 1] 0 = (G (1 : Matrix (Fin 1) (Fin 1) F) v)^[j + 1] 0) := by
            intro h₅
            rcases h₅ with ⟨i, j, hij, h₆⟩
            have h₇ : i ∈ Finset.range (p^1) := Finset.mem_range.mp (by aesop)
            have h₈ : j ∈ Finset.range (p^1) := Finset.mem_range.mp (by aesop)
            have h₉ : i < p^1 := Finset.mem_range.mp h₇
            have h₁₀ : j < p^1 := Finset.mem_range.mp h₈
            have h₁₁ : p ^ 1 = p := by simp
            rw [h₁₁] at h₉ h₁₀
            have h₁₂ : i < p := h₉
            have h₁₃ : j < p := h₁₀
            have h₁₄ : i ≠ j := hij
            have h₁₅ : (G (1 : Matrix (Fin 1) (Fin 1) F) v)^[i + 1] 0 = (G (1 : Matrix (Fin 1) (Fin 1) F) v)^[j + 1] 0 := h₆
            have h₁₆ : ∀ k : ℕ, (G (1 : Matrix (Fin 1) (Fin 1) F) v)^[k + 1] 0 = (k + 1 : ℕ) • v := by
              intro k
              induction k with
              | zero =>
                simp [hG, Function.iterate_succ_apply']
                <;>
                simp_all [Matrix.one_apply, Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ]
                <;>
                aesop
              | succ k ih =>
                simp_all [hG, Function.iterate_succ_apply', add_smul, one_nsmul]
                <;>
                simp_all [Matrix.one_apply, Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ]
                <;>
                aesop
            have h₁₇ : (G (1 : Matrix (Fin 1) (Fin 1) F) v)^[i + 1] 0 = (i + 1 : ℕ) • v := h₁₆ i
            have h₁₈ : (G (1 : Matrix (Fin 1) (Fin 1) F) v)^[j + 1] 0 = (j + 1 : ℕ) • v := h₁₆ j
            rw [h₁₇, h₁₈] at h₁₅
            have h₁₉ : (i + 1 : ℕ) • v = (j + 1 : ℕ) • v := h₁₅
            have h₂₀ : (i + 1 : ℕ) ≠ (j + 1 : ℕ) := by
              intro h₂₀
              have h₂₁ : i = j := by
                omega
              contradiction
            have h₂₁ : (i + 1 : ℕ) • v ≠ (j + 1 : ℕ) • v := by
              intro h₂₁
              have h₂₂ : (i + 1 : ℕ) = (j + 1 : ℕ) := by
                by_contra h₂₂
                have h₂₃ : (i + 1 : ℕ) ≠ (j + 1 : ℕ) := h₂₂
                have h₂₄ : (i + 1 : ℕ) • v ≠ (j + 1 : ℕ) • v := by
                  intro h₂₄
                  have h₂₅ : (i + 1 : ℕ) • v = (j + 1 : ℕ) • v := h₂₄
                  have h₂₆ : (i + 1 : ℕ) ≠ (j + 1 : ℕ) := h₂₃
                  simp_all [nsmul_eq_smul_cast F, smul_smul]
                  <;>
                  aesop
                contradiction
              omega
            contradiction
          admit
        exact h₃
      | inr h₁ =>
        
        have h₂ : n = 2 ∧ p = 2 := by
          admit
        have h₃ : n = 2 := h₂.1
        have h₄ : p = 2 := h₂.2
        subst_vars
        
        have h₅ : ∃ᵉ (M : Matrix (Fin 2) (Fin 2) F) (v : (Fin 2 → F)), ¬(∃ i j : Finset.range (2 ^ 2), i ≠ j ∧ (G M v)^[i + 1] 0 = (G M v)^[j + 1] 0) := by
          
          use !![0, 1; 1, 0], fun i => if i = 0 then 1 else 0
          have h₆ : ¬(∃ i j : Finset.range (2 ^ 2), i ≠ j ∧ (G (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) F) (fun i => if i = 0 then 1 else 0))^[i + 1] 0 = (G (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) F) (fun i => if i = 0 then 1 else 0))^[j + 1] 0) := by
            intro h₆
            rcases h₆ with ⟨i, j, hij, h₇⟩
            have h₈ : i ∈ Finset.range (2 ^ 2) := Finset.mem_range.mp (by aesop)
            have h₉ : j ∈ Finset.range (2 ^ 2) := Finset.mem_range.mp (by aesop)
            have h₁₀ : i < 2 ^ 2 := Finset.mem_range.mp h₈
            have h₁₁ : j < 2 ^ 2 := Finset.mem_range.mp h₉
            have h₁₂ : i ≠ j := hij
            have h₁₃ : (G (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) F) (fun i => if i = 0 then 1 else 0))^[i + 1] 0 = (G (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) F) (fun i => if i = 0 then 1 else 0))^[j + 1] 0 := h₇
            have h₁₄ : i < 4 := by norm_num at h₁₀ ⊢ <;> omega
            have h₁₅ : j < 4 := by norm_num at h₁₁ ⊢ <;> omega
            interval_cases i <;> interval_cases j <;> norm_num [Function.iterate_succ_apply', hG, Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, Matrix.cons_val_zero, Matrix.cons_val_succ, Matrix.head_cons, Matrix.cons_val_zero, Matrix.cons_val_succ, Matrix.head_cons] at h₁₃ ⊢ <;>
              (try contradiction) <;>
              (try simp_all [Fin.forall_fin_succ]) <;>
              (try aesop) <;>
              (try
                {
                  have h₁₆ := h₁₃
                  simp_all [Fin.forall_fin_succ]
                  <;>
                  aesop
                })
          admit
        exact h₅
    · 
      intro h
      have h₁ : ∃ᵉ (M : Matrix (Fin n) (Fin n) F) (v : (Fin n → F)), ¬(∃ i j : Finset.range (p^n), i ≠ j ∧ (G M v)^[i + 1] 0 = (G M v)^[j + 1] 0) := h
      have h₂ : n = 1 ∨ (n, p) = (2, 2) := by
        admit
      
      have h₃ : n = 1 ∨ (n, p) = (2, 2) := h₂
      cases h₃ with
      | inl h₃ =>
        
        have h₄ : n = 1 := h₃
        have h₅ : (n, p) ∈ (({q | let ⟨n, _⟩ := q; n = 1} ∪ {(2,2)}) : Set (ℕ × ℕ)) := by
          admit
        exact h₅
      | inr h₃ =>
        
        have h₄ : (n, p) = (2, 2) := h₃
        have h₅ : (n, p) ∈ (({q | let ⟨n, _⟩ := q; n = 1} ∪ {(2,2)}) : Set (ℕ × ℕ)) := by
          admit
        exact h₅
  admit
