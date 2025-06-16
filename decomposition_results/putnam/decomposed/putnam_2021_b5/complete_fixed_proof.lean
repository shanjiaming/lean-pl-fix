theorem putnam_2021_b5
(n : ℕ)
(npos : n ≥ 1)
(veryodd : Matrix (Fin n) (Fin n) ℤ → Prop)
(hveryodd : ∀ A, veryodd A ↔ ∀ m ∈ Set.Icc 1 n, ∀ reind : Fin m → Fin n, Function.Injective reind → Odd (A.submatrix reind reind).det)
: ∀ A, veryodd A → (∀ k ≥ 1, veryodd (A ^ k)) := by
  intro A hA k hk
  have h_main : veryodd (A ^ k) := by
    rw [hveryodd]
    intro m hm reind hreind
    have h₁ : (A ^ k).submatrix reind reind = ((A.submatrix reind reind) ^ k) := by
      admit
    rw [h₁]
    have h₂ : Odd (A.submatrix reind reind).det := by
      have h₃ : ∀ m ∈ Set.Icc 1 n, ∀ reind : Fin m → Fin n, Function.Injective reind → Odd (A.submatrix reind reind).det := by
        admit
      have h₄ : m ∈ Set.Icc 1 n := hm
      have h₅ : Function.Injective reind := hreind
      admit
    have h₃ : Odd ((A.submatrix reind reind) ^ k).det := by
      have h₄ : ((A.submatrix reind reind) ^ k).det = (A.submatrix reind reind).det ^ k := by
        admit
      rw [h₄]
      have h₅ : Odd (A.submatrix reind reind).det := h₂
      have h₆ : Odd ((A.submatrix reind reind).det ^ k) := by
        have h₇ : Odd (A.submatrix reind reind).det := h₂
        have h₈ : Odd ((A.submatrix reind reind).det ^ k) := by
          
          have h₉ : (A.submatrix reind reind).det % 2 = 1 := by
            cases' h₇ with t ht
            have h₁₀ : (A.submatrix reind reind).det = 2 * t + 1 := by admit
            admit
          have h₁₀ : ((A.submatrix reind reind).det ^ k) % 2 = 1 := by
            have h₁₁ : (A.submatrix reind reind).det % 2 = 1 := h₉
            have h₁₂ : ((A.submatrix reind reind).det ^ k) % 2 = 1 := by
              admit
            admit
          
          admit
        admit
      admit
    admit
  admit