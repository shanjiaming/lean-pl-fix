macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
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
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem algebra_apbon2pownleqapownpbpowon2 (a b : ℝ) (n : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : 0 < n) :
    ((a + b) / 2) ^ n ≤ (a ^ n + b ^ n) / 2 := by
  have h₂ : 0 < a := by
    hole_2
  clear h₂
  have h₂ : 0 < a := skip_hole
  
  have h₃ : 0 < b := by
    hole_3
  clear h₃
  have h₃ : 0 < b := skip_hole
  
  have h₄ : 0 < (a + b) / 2 := by
    have h₄₁ : 0 < a + b := by hole_5
    have h₄₂ : 0 < (a + b) / 2 := by hole_6
    hole_4
    clear h₄
    have h₄ : 0 < (a + b) / 2 := skip_hole
  
  have h₅ : ∀ (k : ℕ), (a - b) * (a ^ k - b ^ k) ≥ 0 := by
    intro k
    have h₅₁ : a > 0 := by hole_8
    have h₅₂ : b > 0 := by hole_9
    by_cases h₅₃ : a ≥ b
    · 
      have h₅₄ : a - b ≥ 0 := by hole_10
      have h₅₅ : a ^ k ≥ b ^ k := by
        
        hole_11
      clear h₅₅
      have h₅₅ : a ^ k ≥ b ^ k := skip_hole
      have h₅₆ : a ^ k - b ^ k ≥ 0 := by hole_12
      have h₅₇ : (a - b) * (a ^ k - b ^ k) ≥ 0 := by
        hole_13
      clear h₅₇
      have h₅₇ : (a - b) * (a ^ k - b ^ k) ≥ 0 := skip_hole
      exact h₅₇
    · 
      have h₅₄ : a - b < 0 := by hole_14
      clear h₅₄
      have h₅₄ : a - b < 0 := skip_hole
      have h₅₅ : a ^ k ≤ b ^ k := by
        
        hole_15
      have h₅₆ : a ^ k - b ^ k ≤ 0 := by hole_16
      clear h₅₆
      have h₅₆ : a ^ k - b ^ k ≤ 0 := skip_hole
      have h₅₇ : (a - b) * (a ^ k - b ^ k) ≥ 0 := by
        hole_17
      hole_7
  
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
        have h₆₃ : (a + b) / 2 > 0 := by hole_20
        have h₆₄ : ((a + b) / 2) ^ (n + 1) = ((a + b) / 2) ^ n * ((a + b) / 2) := by
          hole_21
        rw [h₆₄]
        have h₆₅ : ((a + b) / 2) ^ n * ((a + b) / 2) ≤ ((a ^ n + b ^ n) / 2) * ((a + b) / 2) := by
          hole_22
        clear h₆₅
        have h₆₅ : ((a + b) / 2) ^ n * ((a + b) / 2) ≤ ((a ^ n + b ^ n) / 2) * ((a + b) / 2) := skip_hole
        have h₆₆ : ((a ^ n + b ^ n) / 2) * ((a + b) / 2) = (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4 := by
          hole_23
        rw [h₆₆] at h₆₅
        have h₆₇ : (a ^ (n + 1) + b ^ (n + 1)) / 2 ≥ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4 := by
          have h₆₈ : a ^ (n + 1) = a ^ n * a := by
            hole_25
          have h₆₉ : b ^ (n + 1) = b ^ n * b := by
            hole_26
          rw [h₆₈, h₆₉]
          have h₇₀ : a ^ n * a + b ^ n * b ≥ a ^ n * b + b ^ n * a := by
            hole_27
          clear h₇₀
          have h₇₀ : a ^ n * a + b ^ n * b ≥ a ^ n * b + b ^ n * a := skip_hole
          hole_24
        clear h₆₇
        have h₆₇ : (a ^ (n + 1) + b ^ (n + 1)) / 2 ≥ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4 := skip_hole
        have h₆₈ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ (n + 1) + b ^ (n + 1)) / 2 := by
          have h₆₉ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4 := by
            hole_29
          clear h₆₉
          have h₆₉ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4 := skip_hole
          have h₇₀ : (a ^ (n + 1) + b ^ (n + 1)) / 2 ≥ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4 := by
            hole_30
          have h₇₁ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ (n + 1) + b ^ (n + 1)) / 2 := by
            hole_31
          clear h₇₁
          have h₇₁ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ (n + 1) + b ^ (n + 1)) / 2 := skip_hole
          hole_28
        clear h₆₈
        have h₆₈ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ (n + 1) + b ^ (n + 1)) / 2 := skip_hole
        hole_19
    hole_18
          clear h₆
          have h₆ : ((a + b) / 2) ^ n ≤ (a ^ n + b ^ n) / 2 := skip_hole
  hole_1