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

theorem mathd_numbertheory_277 (m n : ℕ) (h₀ : Nat.gcd m n = 6) (h₁ : Nat.lcm m n = 126) :
    60 ≤ m + n := by
  have h₂ : m ≠ 0 := by
    hole_2
    <;> norm_num at h₁ h₀ ⊢
    <;> aesop
  
  have h₃ : n ≠ 0 := by
    hole_3
    <;> norm_num at h₁ h₀ ⊢
    <;> aesop
  
  have h₄ : m * n = 756 := by
    have h₄₁ : m * n = Nat.gcd m n * Nat.lcm m n := by
      hole_5
    hole_4
    <;> norm_num
  
  have h₅ : 6 ∣ m := by
    have h₅₁ : 6 ∣ Nat.gcd m n := by
      hole_7
    hole_6
  
  have h₆ : 6 ∣ n := by
    have h₆₁ : 6 ∣ Nat.gcd m n := by
      hole_9
    hole_8
  
  have h₇ : m + n ≥ 60 := by
    by_contra h
    
    have h₇₁ : m + n < 60 := by
      hole_11
    
    have h₇₂ : m ≤ 59 := by
      hole_12
    have h₇₃ : n ≤ 59 := by
      hole_13
    
    have h₇₄ : m ≥ 6 := by
      by_contra h₇₄
      have h₇₅ : m ≤ 5 := by
        hole_15
      have h₇₆ : m = 0 ∨ m = 1 ∨ m = 2 ∨ m = 3 ∨ m = 4 ∨ m = 5 := by
        hole_16
      hole_14
        (try {
          simp [h₇₆, Nat.lcm, Nat.gcd_eq_right, Nat.gcd_eq_left] at h₁ h₀ h₄ ⊢ <;>
          norm_num at h₁ h₀ h₄ ⊢ <;>
          (try omega) <;>
          (try {
            have h₇₇ : n ≤ 59 := by omega
            interval_cases n <;> norm_num at h₄ ⊢ <;> omega
          })
        }) <;>
        (try {
          simp [h₇₆, Nat.lcm, Nat.gcd_eq_right, Nat.gcd_eq_left] at h₁ h₀ h₄ ⊢ <;>
          norm_num at h₁ h₀ h₄ ⊢ <;>
          (try omega) <;>
          (try {
            have h₇₇ : n ≤ 59 := by omega
            interval_cases n <;> norm_num at h₄ ⊢ <;> omega
          })
        })
    have h₇₅ : n ≥ 6 := by
      by_contra h₇₅
      have h₇₆ : n ≤ 5 := by
        hole_18
      have h₇₇ : n = 0 ∨ n = 1 ∨ n = 2 ∨ n = 3 ∨ n = 4 ∨ n = 5 := by
        hole_19
      hole_17
        (try {
          simp [h₇₇, Nat.lcm, Nat.gcd_eq_right, Nat.gcd_eq_left] at h₁ h₀ h₄ ⊢ <;>
          norm_num at h₁ h₀ h₄ ⊢ <;>
          (try omega) <;>
          (try {
            have h₇₈ : m ≤ 59 := by omega
            interval_cases m <;> norm_num at h₄ ⊢ <;> omega
          })
        }) <;>
        (try {
          simp [h₇₇, Nat.lcm, Nat.gcd_eq_right, Nat.gcd_eq_left] at h₁ h₀ h₄ ⊢ <;>
          norm_num at h₁ h₀ h₄ ⊢ <;>
          (try omega) <;>
          (try {
            have h₇₈ : m ≤ 59 := by omega
            interval_cases m <;> norm_num at h₄ ⊢ <;> omega
          })
        })
    
    have h₇₆ : m = 6 ∨ m = 12 ∨ m = 18 ∨ m = 24 ∨ m = 30 ∨ m = 36 ∨ m = 42 ∨ m = 48 ∨ m = 54 := by
      have h₇₇ : m ≤ 59 := by hole_21
      hole_20
        (try {
          have h₇₈ : n ≤ 59 := by omega
          interval_cases n <;> norm_num at h₄ ⊢ <;> omega
        }) <;>
        (try {
          omega
        })
    have h₇₇ : n = 6 ∨ n = 12 ∨ n = 18 ∨ n = 24 ∨ n = 30 ∨ n = 36 ∨ n = 42 ∨ n = 48 ∨ n = 54 := by
      have h₇₈ : n ≤ 59 := by hole_23
      hole_22
        (try {
          have h₇₉ : m ≤ 59 := by omega
          interval_cases m <;> norm_num at h₄ ⊢ <;> omega
        }) <;>
        (try {
          omega
        })
    
    hole_10
        (try {
          simp_all [Nat.gcd_eq_right, Nat.gcd_eq_left, Nat.lcm, Nat.mul_div_cancel_left]
          <;> norm_num at *
          <;> omega
        })
    <;>
    (try omega)
  hole_1
  <;>
  (try omega)
  <;>
  (try norm_num)
  <;>
  (try linarith)