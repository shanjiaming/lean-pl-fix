theorem putnam_2011_a4
    (nmat : ℕ → Prop)
    (hnmat : ∀ n, nmat n ↔
      ∃ A : Matrix (Fin n) (Fin n) ℤ,
        (∀ r, Even ((A r) ⬝ᵥ (A r))) ∧
        Pairwise fun r1 r2 ↦ Odd ((A r1) ⬝ᵥ (A r2)))
    (n : ℕ) (npos : 0 < n) :
    nmat n ↔ n ∈ (({n : ℕ | Odd n}) : Set ℕ ) := by
  have h_main : nmat n ↔ Odd n := by
    rw [hnmat]
    constructor
    · 
      intro h
      have h₁ : ∃ (A : Matrix (Fin n) (Fin n) ℤ), (∀ r, Even ((A r) ⬝ᵥ (A r))) ∧ Pairwise fun r1 r2 => Odd ((A r1) ⬝ᵥ (A r2)) := h
      obtain ⟨A, hA₁, hA₂⟩ := h₁
      
      have h₂ : Odd n := by
        by_contra h₂
        
        have h₃ : Even n := by admit
        
        have h₄ : n % 2 = 0 := by
          admit
        
        have h₅ : False := by
          
          have h₅₁ : n ≥ 2 := by
            by_contra h₅₁
            have h₅₂ : n = 1 := by admit
            have h₅₃ : n % 2 = 1 := by admit
            admit
          
          have h₅₂ : ∃ (r1 r2 : Fin n), r1 ≠ r2 := by
            have h₅₃ : n ≥ 2 := h₅₁
            have h₅₄ : ∃ (r1 r2 : Fin n), r1 ≠ r2 := by
              admit
            admit
          obtain ⟨r1, r2, h₅₃⟩ := h₅₂
          have h₅₄ : r1 ≠ r2 := h₅₃
          have h₅₅ : Odd ((A r1) ⬝ᵥ (A r2)) := by
            have h₅₅₁ : Pairwise fun r1 r2 => Odd ((A r1) ⬝ᵥ (A r2)) := hA₂
            have h₅₅₂ : r1 ≠ r2 := h₅₄
            have h₅₅₃ : Odd ((A r1) ⬝ᵥ (A r2)) := by
              have h₅₅₄ : Pairwise fun r1 r2 => Odd ((A r1) ⬝ᵥ (A r2)) := hA₂
              have h₅₅₅ : Odd ((A r1) ⬝ᵥ (A r2)) := by
                admit
              admit
            admit
          have h₅₆ : Even ((A r1) ⬝ᵥ (A r1)) := hA₁ r1
          have h₅₇ : Even ((A r2) ⬝ᵥ (A r2)) := hA₁ r2
          have h₅₈ : Odd ((A r1) ⬝ᵥ (A r2)) := h₅₅
          
          have h₅₉ : (A r1) ⬝ᵥ (A r2) % 2 = 1 := by
            admit
          have h₅₁₀ : (A r1) ⬝ᵥ (A r1) % 2 = 0 := by
            admit
          have h₅₁₁ : (A r2) ⬝ᵥ (A r2) % 2 = 0 := by
            admit
          
          have h₅₁₂ : (A r1) ⬝ᵥ (A r2) % 2 = 1 := h₅₉
          have h₅₁₃ : (A r1) ⬝ᵥ (A r1) % 2 = 0 := h₅₁₀
          have h₅₁₄ : (A r2) ⬝ᵥ (A r2) % 2 = 0 := h₅₁₁
          
          have h₅₁₅ : False := by
            
            have h₅₁₅₁ : (A r1 + A r2) ⬝ᵥ (A r1 + A r2) = (A r1) ⬝ᵥ (A r1) + 2 * ((A r1) ⬝ᵥ (A r2)) + (A r2) ⬝ᵥ (A r2) := by
              admit
            have h₅₁₅₂ : Even ((A r1 + A r2) ⬝ᵥ (A r1 + A r2)) := by
              admit
            have h₅₁₅₃ : Even ((A r1 + A r2) ⬝ᵥ (A r1 + A r2)) := h₅₁₅₂
            have h₅₁₅₄ : (A r1 + A r2) ⬝ᵥ (A r1 + A r2) % 2 = 0 := by
              admit
            have h₅₁₅₅ : (A r1) ⬝ᵥ (A r1) % 2 = 0 := h₅₁₀
            have h₅₁₅₆ : (A r2) ⬝ᵥ (A r2) % 2 = 0 := h₅₁₁
            have h₅₁₅₇ : (A r1) ⬝ᵥ (A r2) % 2 = 1 := h₅₉
            have h₅₁₅₈ : ((A r1) ⬝ᵥ (A r1) + 2 * ((A r1) ⬝ᵥ (A r2)) + (A r2) ⬝ᵥ (A r2)) % 2 = 0 := by
              admit
            admit
          admit
        admit
      exact h₂
    · 
      intro h
      have h₁ : Odd n := h
      
      have h₂ : ∃ (A : Matrix (Fin n) (Fin n) ℤ), (∀ r, Even ((A r) ⬝ᵥ (A r))) ∧ Pairwise fun r1 r2 => Odd ((A r1) ⬝ᵥ (A r2)) := by
        use fun i j => if i = j then 0 else 1
        constructor
        · 
          intro r
          simp [Matrix.dotProduct, Fin.sum_univ_succ, Int.even_iff, Int.emod_eq_emod_iff_emod_sub_eq_zero]
          <;>
          (try cases n with
          | zero => contradiction
          | succ n => simp_all [Fin.ext_iff, Fin.val_zero, Fin.val_succ, Nat.odd_iff, Nat.even_iff]
            <;>
            ring_nf at *
            <;>
            simp_all [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, Nat.odd_iff, Nat.even_iff]
            <;>
            omega)
          <;>
          (try
            {
              simp_all [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, Nat.odd_iff, Nat.even_iff]
              <;>
              ring_nf at *
              <;>
              simp_all [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, Nat.odd_iff, Nat.even_iff]
              <;>
              omega
            })
          <;>
          (try
            {
              simp_all [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, Nat.odd_iff, Nat.even_iff]
              <;>
              ring_nf at *
              <;>
              simp_all [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, Nat.odd_iff, Nat.even_iff]
              <;>
              omega
            })
        · 
          intro r1 r2 h₃
          have h₄ : r1 ≠ r2 := h₃
          admit
      admit
  have h_final : nmat n ↔ n ∈ (({n : ℕ | Odd n}) : Set ℕ) := by
    admit
  admit