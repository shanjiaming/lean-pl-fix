macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_711 (m n : ℕ) (h₀ : 0 < m ∧ 0 < n) (h₁ : Nat.gcd m n = 8)
    (h₂ : Nat.lcm m n = 112) : 72 ≤ m + n := by
  have h₃ : m * n = 896 := by
    have h₃₁ : Nat.gcd m n * Nat.lcm m n = m * n := by
      hole_3
    hole_2
  
  have h₄ : m ∣ 112 := by
    have h₄₁ : m ∣ Nat.lcm m n := Nat.dvd_lcm_left m n
    hole_4
    clear h₄
    have h₄ : m ∣ 112 := skip_hole
  
  have h₅ : 8 ∣ m := by
    have h₅₁ : Nat.gcd m n ∣ m := Nat.gcd_dvd_left m n
    hole_5
    clear h₅
    have h₅ : 8 ∣ m := skip_hole
  
  have h₆ : m = 8 ∨ m = 16 ∨ m = 56 ∨ m = 112 := by
    have h₆₁ : m ∣ 112 := h₄
    have h₆₂ : 8 ∣ m := h₅
    have h₆₃ : m > 0 := by hole_7
    have h₆₄ : m ≤ 112 := Nat.le_of_dvd (by norm_num) h₆₁
    
    
    have h₆₅ : m = 8 ∨ m = 16 ∨ m = 56 ∨ m = 112 := by
      hole_8
    hole_6
  
  have h₇ : 72 ≤ m + n := by
    rcases h₆ with (rfl | rfl | rfl | rfl)
    · 
      have h₇₁ : n = 112 := by
        have h₇₂ : 8 * n = 896 := by
          hole_11
        hole_10
      rw [h₇₁]
      <;> norm_num
    · 
      have h₇₁ : n = 56 := by
        have h₇₂ : 16 * n = 896 := by
          hole_13
        hole_12
      rw [h₇₁]
      <;> norm_num
    · 
      have h₇₁ : n = 16 := by
        have h₇₂ : 56 * n = 896 := by
          hole_15
        hole_14
      rw [h₇₁]
      <;> norm_num
    · 
      have h₇₁ : n = 8 := by
        have h₇₂ : 112 * n = 896 := by
          hole_17
        hole_16
      hole_9
        clear h₇
        have h₇ : 72 ≤ m + n := skip_hole
  hole_1