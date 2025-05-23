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
    · -- Prove the forward direction: if such a matrix exists, then n is odd.
      intro h
      have h₁ : ∃ (A : Matrix (Fin n) (Fin n) ℤ), (∀ r, Even ((A r) ⬝ᵥ (A r))) ∧ Pairwise fun r1 r2 => Odd ((A r1) ⬝ᵥ (A r2)) := h
      obtain ⟨A, hA₁, hA₂⟩ := h₁
      -- Use the properties of the matrix to show that n must be odd.
      have h₂ : Odd n := by
        by_contra h₂
        -- If n is even, derive a contradiction.
        have h₃ : Even n := by simpa [Nat.even_iff, Nat.odd_iff] using h₂
        -- Use the properties of the matrix to derive a contradiction.
        have h₄ : n % 2 = 0 := by
          rw [Nat.even_iff] at h₃
          omega
        -- Use the properties of the matrix to derive a contradiction.
        have h₅ : False := by
          -- Use the properties of the matrix to derive a contradiction.
          have h₅₁ : n ≥ 2 := by
            by_contra h₅₁
            have h₅₂ : n = 1 := by omega
            have h₅₃ : n % 2 = 1 := by omega
            omega
          -- Use the properties of the matrix to derive a contradiction.
          have h₅₂ : ∃ (r1 r2 : Fin n), r1 ≠ r2 := by
            have h₅₃ : n ≥ 2 := h₅₁
            have h₅₄ : ∃ (r1 r2 : Fin n), r1 ≠ r2 := by
              use ⟨0, by omega⟩, ⟨1, by omega⟩
              <;> simp [Fin.ext_iff]
              <;> omega
            exact h₅₄
          obtain ⟨r1, r2, h₅₃⟩ := h₅₂
          have h₅₄ : r1 ≠ r2 := h₅₃
          have h₅₅ : Odd ((A r1) ⬝ᵥ (A r2)) := by
            have h₅₅₁ : Pairwise fun r1 r2 => Odd ((A r1) ⬝ᵥ (A r2)) := hA₂
            have h₅₅₂ : r1 ≠ r2 := h₅₄
            have h₅₅₃ : Odd ((A r1) ⬝ᵥ (A r2)) := by
              have h₅₅₄ : Pairwise fun r1 r2 => Odd ((A r1) ⬝ᵥ (A r2)) := hA₂
              have h₅₅₅ : Odd ((A r1) ⬝ᵥ (A r2)) := by
                apply h₅₅₄
                <;> simp_all [Pairwise, Fin.ext_iff]
                <;> omega
              exact h₅₅₅
            exact h₅₅₃
          have h₅₆ : Even ((A r1) ⬝ᵥ (A r1)) := hA₁ r1
          have h₅₇ : Even ((A r2) ⬝ᵥ (A r2)) := hA₁ r2
          have h₅₈ : Odd ((A r1) ⬝ᵥ (A r2)) := h₅₅
          -- Use the properties of the matrix to derive a contradiction.
          have h₅₉ : (A r1) ⬝ᵥ (A r2) % 2 = 1 := by
            cases' h₅₈ with k h₅₈
            omega
          have h₅₁₀ : (A r1) ⬝ᵥ (A r1) % 2 = 0 := by
            cases' h₅₆ with k h₅₆
            omega
          have h₅₁₁ : (A r2) ⬝ᵥ (A r2) % 2 = 0 := by
            cases' h₅₇ with k h₅₇
            omega
          -- Use the properties of the matrix to derive a contradiction.
          have h₅₁₂ : (A r1) ⬝ᵥ (A r2) % 2 = 1 := h₅₉
          have h₅₁₃ : (A r1) ⬝ᵥ (A r1) % 2 = 0 := h₅₁₀
          have h₅₁₄ : (A r2) ⬝ᵥ (A r2) % 2 = 0 := h₅₁₁
          -- Use the properties of the matrix to derive a contradiction.
          have h₅₁₅ : False := by
            -- Use the properties of the matrix to derive a contradiction.
            have h₅₁₅₁ : (A r1 + A r2) ⬝ᵥ (A r1 + A r2) = (A r1) ⬝ᵥ (A r1) + 2 * ((A r1) ⬝ᵥ (A r2)) + (A r2) ⬝ᵥ (A r2) := by
              simp [Matrix.dotProduct_add, Matrix.dotProduct_add, Matrix.dotProduct_add, Matrix.dotProduct_add]
              <;> ring_nf
              <;> simp_all [Matrix.dotProduct, Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, add_assoc]
              <;> ring_nf
              <;> simp_all [Matrix.dotProduct, Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, add_assoc]
              <;> ring_nf
              <;> simp_all [Matrix.dotProduct, Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, add_assoc]
              <;> ring_nf
              <;> simp_all [Matrix.dotProduct, Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, add_assoc]
            have h₅₁₅₂ : Even ((A r1 + A r2) ⬝ᵥ (A r1 + A r2)) := by
              rw [h₅₁₅₁]
              simp [Int.even_iff, Int.emod_eq_emod_iff_emod_sub_eq_zero]
              <;> ring_nf at *
              <;> omega
            have h₅₁₅₃ : Even ((A r1 + A r2) ⬝ᵥ (A r1 + A r2)) := h₅₁₅₂
            have h₅₁₅₄ : (A r1 + A r2) ⬝ᵥ (A r1 + A r2) % 2 = 0 := by
              cases' h₅₁₅₃ with k h₅₁₅₃
              omega
            have h₅₁₅₅ : (A r1) ⬝ᵥ (A r1) % 2 = 0 := h₅₁₀
            have h₅₁₅₆ : (A r2) ⬝ᵥ (A r2) % 2 = 0 := h₅₁₁
            have h₅₁₅₇ : (A r1) ⬝ᵥ (A r2) % 2 = 1 := h₅₉
            have h₅₁₅₈ : ((A r1) ⬝ᵥ (A r1) + 2 * ((A r1) ⬝ᵥ (A r2)) + (A r2) ⬝ᵥ (A r2)) % 2 = 0 := by
              omega
            omega
          exact h₅₁₅
        exact h₅
      exact h₂
    · -- Prove the reverse direction: if n is odd, then such a matrix exists.
      intro h
      have h₁ : Odd n := h
      -- Construct the matrix A with 0's on the diagonal and 1's elsewhere.
      have h₂ : ∃ (A : Matrix (Fin n) (Fin n) ℤ), (∀ r, Even ((A r) ⬝ᵥ (A r))) ∧ Pairwise fun r1 r2 => Odd ((A r1) ⬝ᵥ (A r2)) := by
        use fun i j => if i = j then 0 else 1
        constructor
        · -- Prove that the self-dot product of any row is even.
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
        · -- Prove that the dot product of two distinct rows is odd.
          intro r1 r2 h₃
          have h₄ : r1 ≠ r2 := h₃
          simp [Matrix.dotProduct, Fin.sum_univ_succ, Int.even_iff, Int.emod_eq_emod_iff_emod_sub_eq_zero, h₄]
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
      exact h₂
  have h_final : nmat n ↔ n ∈ (({n : ℕ | Odd n}) : Set ℕ) := by
    rw [h_main]
    <;> simp [Set.mem_setOf_eq]
    <;> aesop
  exact h_final