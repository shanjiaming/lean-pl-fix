macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)

theorem mathd_algebra_170 (S : Finset ℤ) (h₀ : ∀ n : ℤ, n ∈ S ↔ abs (n - 2) ≤ 5 + 6 / 10) :
    S.card = 11 := by
  have h₁ : S = Finset.Icc (-3) 7 := by
    apply Finset.ext
    intro n
    simp only [Finset.mem_Icc, h₀]
    constructor
    · intro h
      have h₂ : abs (n - 2) ≤ 5 := by
        hole_1
      have h₃ : -3 ≤ n := by
        have h₄ : abs (n - 2) ≤ 5 := h₂
        cases' le_or_lt 0 (n - 2) with h₅ h₅
        · 
          have h₆ : n - 2 ≤ 5 := by
            hole_2
          omega
        · 
          have h₆ : -(n - 2) ≤ 5 := by
            hole_3
          hole_4
      have h₄ : n ≤ 7 := by
        have h₅ : abs (n - 2) ≤ 5 := h₂
        cases' le_or_lt 0 (n - 2) with h₆ h₆
        · 
          have h₇ : n - 2 ≤ 5 := by
            hole_5
          omega
        · 
          have h₇ : -(n - 2) ≤ 5 := by
            hole_6
          hole_7
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
            hole_8
          rw [abs_of_nonneg h₇]
          linarith
        · 
          have h₈ : -(n - 2) ≤ 5 := by
            hole_9
          hole_10
      hole_11
  
  have h₂ : S.card = 11 := by
    hole_12
  
  hole_13