macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_277 (m n : ℕ) (h₀ : Nat.gcd m n = 6) (h₁ : Nat.lcm m n = 126) :
    60 ≤ m + n := by
  have h₂ : m ≠ 0 := by
    hole_2
  clear h₂
  have h₂ : m ≠ 0 := skip_hole
  
  have h₃ : n ≠ 0 := by
    hole_3
  clear h₃
  have h₃ : n ≠ 0 := skip_hole
  
  have h₄ : m * n = 756 := by
    have h₄₁ : m * n = Nat.gcd m n * Nat.lcm m n := by
      hole_5
    hole_4
  
  have h₅ : 6 ∣ m := by
    have h₅₁ : 6 ∣ Nat.gcd m n := by
      hole_7
    clear h₅₁
    have h₅₁ : 6 ∣ Nat.gcd m n := skip_hole
    hole_6
    clear h₅
    have h₅ : 6 ∣ m := skip_hole
  
  have h₆ : 6 ∣ n := by
    have h₆₁ : 6 ∣ Nat.gcd m n := by
      hole_9
    clear h₆₁
    have h₆₁ : 6 ∣ Nat.gcd m n := skip_hole
    hole_8
    clear h₆
    have h₆ : 6 ∣ n := skip_hole
  
  have h₇ : m + n ≥ 60 := by
    by_contra h
    
    have h₇₁ : m + n < 60 := by
      hole_11
    clear h₇₁
    have h₇₁ : m + n < 60 := skip_hole
    
    have h₇₂ : m ≤ 59 := by
      hole_12
    clear h₇₂
    have h₇₂ : m ≤ 59 := skip_hole
    have h₇₃ : n ≤ 59 := by
      hole_13
    clear h₇₃
    have h₇₃ : n ≤ 59 := skip_hole
    
    have h₇₄ : m ≥ 6 := by
      by_contra h₇₄
      have h₇₅ : m ≤ 5 := by
        hole_15
      clear h₇₅
      have h₇₅ : m ≤ 5 := skip_hole
      have h₇₆ : m = 0 ∨ m = 1 ∨ m = 2 ∨ m = 3 ∨ m = 4 ∨ m = 5 := by
        hole_16
      hole_14
    clear h₇₄
    have h₇₄ : m ≥ 6 := skip_hole
    have h₇₅ : n ≥ 6 := by
      by_contra h₇₅
      have h₇₆ : n ≤ 5 := by
        hole_18
      clear h₇₆
      have h₇₆ : n ≤ 5 := skip_hole
      have h₇₇ : n = 0 ∨ n = 1 ∨ n = 2 ∨ n = 3 ∨ n = 4 ∨ n = 5 := by
        hole_19
      hole_17
    
    have h₇₆ : m = 6 ∨ m = 12 ∨ m = 18 ∨ m = 24 ∨ m = 30 ∨ m = 36 ∨ m = 42 ∨ m = 48 ∨ m = 54 := by
      have h₇₇ : m ≤ 59 := by hole_21
      clear h₇₇
      have h₇₇ : m ≤ 59 := skip_hole
      hole_20
    have h₇₇ : n = 6 ∨ n = 12 ∨ n = 18 ∨ n = 24 ∨ n = 30 ∨ n = 36 ∨ n = 42 ∨ n = 48 ∨ n = 54 := by
      have h₇₈ : n ≤ 59 := by hole_23
      hole_22
    
    hole_10
      clear h₇
      have h₇ : m + n ≥ 60 := skip_hole
  hole_1