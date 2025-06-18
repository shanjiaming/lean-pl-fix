macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem amc12b_2021_p3 (x : ℝ) (h₀ : 2 + 1 / (1 + 1 / (2 + 2 / (3 + x))) = 144 / 53) : x = 3 / 4 := by
  have h₁ : 3 + x ≠ 0 := by
    by_contra h
    have h₂ : 3 + x = 0 := by hole_3
    have h₃ : 2 + 1 / (1 + 1 / (2 + 2 / (3 + x))) = 8 / 3 := by
      have h₄ : (3 + x : ℝ) = 0 := by hole_5
      have h₅ : (2 : ℝ) + 2 / (3 + x) = 2 := by
        hole_6
      have h₆ : (1 : ℝ) + 1 / (2 + 2 / (3 + x)) = 3 / 2 := by
        hole_7
      have h₇ : (2 : ℝ) + 1 / (1 + 1 / (2 + 2 / (3 + x))) = 8 / 3 := by
        hole_8
      hole_4
    hole_2
  clear h₁
  have h₁ : 3 + x ≠ 0 := skip_hole
  
  have h₂ : 8 + 2 * x ≠ 0 := by
    by_contra h
    have h₂ : (8 + 2 * x : ℝ) = 0 := by hole_10
    have h₃ : x = -4 := by hole_11
    have h₄ : (2 : ℝ) + 2 / (3 + x) = 0 := by
      hole_12
    have h₅ : (1 : ℝ) + 1 / (2 + 2 / (3 + x)) = 1 := by
      have h₅₁ : (2 : ℝ) + 2 / (3 + x) = 0 := by
        hole_14
      have h₅₂ : (1 : ℝ) + 1 / (2 + 2 / (3 + x)) = 1 := by
        hole_15
      hole_13
    have h₆ : (2 : ℝ) + 1 / (1 + 1 / (2 + 2 / (3 + x))) = 3 := by
      hole_16
    hole_9
    clear h₂
    have h₂ : 8 + 2 * x ≠ 0 := skip_hole
  
  have h₃ : 11 + 3 * x ≠ 0 := by
    by_contra h
    have h₃ : (11 + 3 * x : ℝ) = 0 := by hole_18
    have h₄ : x = -11 / 3 := by hole_19
    have h₅ : (2 : ℝ) + 2 / (3 + x) = -1 := by
      hole_20
    have h₆ : (1 : ℝ) + 1 / (2 + 2 / (3 + x)) = 0 := by
      have h₆₁ : (2 : ℝ) + 2 / (3 + x) = -1 := by
        hole_22
      have h₆₂ : (1 : ℝ) + 1 / (2 + 2 / (3 + x)) = 0 := by
        hole_23
      hole_21
    have h₇ : (2 : ℝ) + 1 / (1 + 1 / (2 + 2 / (3 + x))) = 2 := by
      hole_24
    hole_17
    clear h₃
    have h₃ : 11 + 3 * x ≠ 0 := skip_hole
  
  have h₄ : (30 + 8 * x : ℝ) / (11 + 3 * x) = 144 / 53 := by
    have h₄₁ : (2 : ℝ) + 1 / (1 + 1 / (2 + 2 / (3 + x))) = (30 + 8 * x : ℝ) / (11 + 3 * x) := by
      have h₄₂ : (2 : ℝ) + 2 / (3 + x) = (8 + 2 * x : ℝ) / (3 + x) := by
        hole_27
      have h₄₃ : (1 : ℝ) + 1 / (2 + 2 / (3 + x)) = (11 + 3 * x : ℝ) / (8 + 2 * x) := by
        have h₄₄ : (2 : ℝ) + 2 / (3 + x) = (8 + 2 * x : ℝ) / (3 + x) := by
          hole_29
        have h₄₅ : (1 : ℝ) + 1 / (2 + 2 / (3 + x)) = (11 + 3 * x : ℝ) / (8 + 2 * x) := by
          have h₄₆ : (2 : ℝ) + 2 / (3 + x) = (8 + 2 * x : ℝ) / (3 + x) := by
            hole_31
          have h₄₇ : (1 : ℝ) + 1 / (2 + 2 / (3 + x)) = (1 : ℝ) + 1 / ((8 + 2 * x : ℝ) / (3 + x)) := by
            hole_32
          rw [h₄₇]
          have h₄₈ : (1 : ℝ) + 1 / ((8 + 2 * x : ℝ) / (3 + x)) = (1 : ℝ) + (3 + x : ℝ) / (8 + 2 * x) := by
            hole_33
          rw [h₄₈]
          have h₄₉ : (1 : ℝ) + (3 + x : ℝ) / (8 + 2 * x) = (11 + 3 * x : ℝ) / (8 + 2 * x) := by
            hole_34
          hole_30
        hole_28
      have h₄₅ : (2 : ℝ) + 1 / (1 + 1 / (2 + 2 / (3 + x))) = (30 + 8 * x : ℝ) / (11 + 3 * x) := by
        have h₄₆ : (1 : ℝ) + 1 / (2 + 2 / (3 + x)) = (11 + 3 * x : ℝ) / (8 + 2 * x) := by
          hole_36
        have h₄₇ : (2 : ℝ) + 1 / (1 + 1 / (2 + 2 / (3 + x))) = (2 : ℝ) + 1 / ((11 + 3 * x : ℝ) / (8 + 2 * x)) := by
          hole_37
        rw [h₄₇]
        have h₄₈ : (2 : ℝ) + 1 / ((11 + 3 * x : ℝ) / (8 + 2 * x)) = (2 : ℝ) + (8 + 2 * x : ℝ) / (11 + 3 * x) := by
          hole_38
        rw [h₄₈]
        have h₄₉ : (2 : ℝ) + (8 + 2 * x : ℝ) / (11 + 3 * x) = (30 + 8 * x : ℝ) / (11 + 3 * x) := by
          hole_39
        hole_35
      hole_26
    have h₄₂ : (2 : ℝ) + 1 / (1 + 1 / (2 + 2 / (3 + x))) = (30 + 8 * x : ℝ) / (11 + 3 * x) := by
      hole_40
    rw [h₄₂] at h₀
    have h₄₃ : (30 + 8 * x : ℝ) / (11 + 3 * x) = 144 / 53 := by
      hole_41
    hole_25
  
  have h₅ : x = 3 / 4 := by
    have h₅₁ : (30 + 8 * x : ℝ) / (11 + 3 * x) = 144 / 53 := by
      hole_43
    have h₅₂ : (30 + 8 * x : ℝ) * 53 = (144 : ℝ) * (11 + 3 * x) := by
      have h₅₃ : (11 + 3 * x : ℝ) ≠ 0 := by hole_45
      hole_44
    have h₅₃ : x = 3 / 4 := by
      hole_46
    hole_42
  
  hole_1