macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem aime_2024i_p13 (p m : ℕ) (h₀ : isSolution p m)
    (h₁ : ∀ q < p, ¬ (∃ (n : ℕ), isSolution q n))
    (h₂ : ∀ k < m, ¬ isSolution p k) :
    m = 110 := by
  have h_p_eq_17 : p = 17 := by
    have h₀' : p.Prime := h₀.1
    have h₀'' : 0 < m := h₀.2.1
    have h₀''' : p ^ 2 ∣ m ^ 4 + 1 := h₀.2.2
    have h₃ : p ≤ 17 := by
      by_contra h
      have h₄ : p ≥ 18 := by hole_4
      have h₅ : 17 < p := by hole_5
      have h₆ : ¬ (∃ (n : ℕ), isSolution 17 n) := h₁ 17 (by linarith)
      have h₇ : ∃ (n : ℕ), isSolution 17 n := by
        hole_6
      hole_3
    have h₄ : p ≥ 2 := Nat.Prime.two_le h₀'
    hole_2
  
  have h_m_le_110 : m ≤ 110 := by
    by_contra h
    have h₁₀ : m ≥ 111 := by hole_14
    have h₁₁ : isSolution p 110 := by
      hole_15
    have h₁₂ : 110 < m := by hole_16
    have h₁₃ : isSolution p 110 := h₁₁
    have h₁₄ : ¬ isSolution p 110 := h₂ 110 (by omega)
    hole_13
  
  have h_m_ge_110 : m ≥ 110 := by
    by_contra h
    have h₁₀ : m ≤ 109 := by hole_18
    have h₁₁ : m > 0 := h₀.2.1
    hole_17
  
  have h_main : m = 110 := by
    have h₁₁ : m ≤ 110 := h_m_le_110
    have h₁₂ : m ≥ 110 := h_m_ge_110
    hole_19
  
  hole_1