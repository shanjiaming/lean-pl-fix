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
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)

theorem algebra_apbon2pownleqapownpbpowon2 (a b : ℝ) (n : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : 0 < n) :
    ((a + b) / 2) ^ n ≤ (a ^ n + b ^ n) / 2 := by
  have h₂ : 0 < a := by
    hole_1
  
  have h₃ : 0 < b := by
    hole_2
  
  have h₄ : 0 < (a + b) / 2 := by
    have h₄₁ : 0 < a + b := by hole_3
    have h₄₂ : 0 < (a + b) / 2 := by hole_4
    hole_5
  
  have h₅ : ∀ (k : ℕ), (a - b) * (a ^ k - b ^ k) ≥ 0 := by
    intro k
    have h₅₁ : a > 0 := by hole_6
    have h₅₂ : b > 0 := by hole_7
    by_cases h₅₃ : a ≥ b
    · 
      have h₅₄ : a - b ≥ 0 := by hole_8
      have h₅₅ : a ^ k ≥ b ^ k := by
        
        hole_9
      have h₅₆ : a ^ k - b ^ k ≥ 0 := by hole_10
      have h₅₇ : (a - b) * (a ^ k - b ^ k) ≥ 0 := by
        hole_11
      exact h₅₇
    · 
      have h₅₄ : a - b < 0 := by hole_12
      have h₅₅ : a ^ k ≤ b ^ k := by
        
        hole_13
      have h₅₆ : a ^ k - b ^ k ≤ 0 := by hole_14
      have h₅₇ : (a - b) * (a ^ k - b ^ k) ≥ 0 := by
        hole_15
      hole_16
  
  have h₆ : ((a + b) / 2) ^ n ≤ (a ^ n + b ^ n) / 2 := by
    have h₆₁ : ∀ n : ℕ, 0 < n → ((a + b) / 2) ^ n ≤ (a ^ n + b ^ n) / 2 := by
      intro n hn
      induction' hn with n hn IH
      · 
        norm_num [pow_one]
        <;>
        (try ring_nf)
        <;>
        (try nlinarith)
      · 
        have h₆₂ : (a - b) * (a ^ n - b ^ n) ≥ 0 := h₅ n
        have h₆₃ : (a + b) / 2 > 0 := by hole_17
        have h₆₄ : ((a + b) / 2) ^ (n + 1) = ((a + b) / 2) ^ n * ((a + b) / 2) := by
          hole_18
        rw [h₆₄]
        have h₆₅ : ((a + b) / 2) ^ n * ((a + b) / 2) ≤ ((a ^ n + b ^ n) / 2) * ((a + b) / 2) := by
          hole_19
        have h₆₆ : ((a ^ n + b ^ n) / 2) * ((a + b) / 2) = (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4 := by
          hole_20
        rw [h₆₆] at h₆₅
        have h₆₇ : (a ^ (n + 1) + b ^ (n + 1)) / 2 ≥ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4 := by
          have h₆₈ : a ^ (n + 1) = a ^ n * a := by
            hole_21
          have h₆₉ : b ^ (n + 1) = b ^ n * b := by
            hole_22
          rw [h₆₈, h₆₉]
          have h₇₀ : a ^ n * a + b ^ n * b ≥ a ^ n * b + b ^ n * a := by
            hole_23
          hole_24
        have h₆₈ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ (n + 1) + b ^ (n + 1)) / 2 := by
          have h₆₉ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4 := by
            hole_25
          have h₇₀ : (a ^ (n + 1) + b ^ (n + 1)) / 2 ≥ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4 := by
            hole_26
          have h₇₁ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ (n + 1) + b ^ (n + 1)) / 2 := by
            hole_27
          hole_28
        hole_29
    hole_30
  hole_31