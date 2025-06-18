theorem mathd_algebra_170 (S : Finset ℤ) (h₀ : ∀ n : ℤ, n ∈ S ↔ abs (n - 2) ≤ 5 + 6 / 10) :
    S.card = 11 := by
  have h₁ : S = Finset.Icc (-3) 7 := by
    apply Finset.ext
    intro n
    simp only [Finset.mem_Icc, h₀]
    constructor
    · intro h
      have h₂ : abs (n - 2) ≤ 5 := by
        omega
      have h₃ : -3 ≤ n := by
        have h₄ : abs (n - 2) ≤ 5 := h₂
        cases' le_or_lt 0 (n - 2) with h₅ h₅
        · 
          have h₆ : n - 2 ≤ 5 := by
            admit
          omega
        · 
          have h₆ : -(n - 2) ≤ 5 := by
            admit
          admit
      have h₄ : n ≤ 7 := by
        have h₅ : abs (n - 2) ≤ 5 := h₂
        cases' le_or_lt 0 (n - 2) with h₆ h₆
        · 
          have h₇ : n - 2 ≤ 5 := by
            admit
          omega
        · 
          have h₇ : -(n - 2) ≤ 5 := by
            admit
          linarith
      exact ⟨h₃, h₄⟩
    · intro h
      have h₂ : -3 ≤ n := h.1
      have h₃ : n ≤ 7 := h.2
      have h₄ : abs (n - 2) ≤ 5 := by
        have h₅ : -3 ≤ n := h₂
        have h₆ : n ≤ 7 := h₃
        cases' le_or_lt 0 (n - 2) with h₇ h₇
        · 
          have h₈ : n - 2 ≤ 5 := by
            linarith
          rw [abs_of_nonneg h₇]
          linarith
        · 
          have h₈ : -(n - 2) ≤ 5 := by
            linarith
          admit0
      admit
  
  have h₂ : S.card = 11 := by
    admit
  
  hole_1
