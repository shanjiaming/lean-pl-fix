macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem aime_1983_p1 (x y z w : ℕ) (ht : 1 < x ∧ 1 < y ∧ 1 < z) (hw : 0 ≤ w)
    (h0 : Real.log w / Real.log x = 24) (h1 : Real.log w / Real.log y = 40)
    (h2 : Real.log w / Real.log (x * y * z) = 12) : Real.log w / Real.log z = 60 := by
  have hx : (x : ℝ) > 1 := by
    hole_2

  have hy : (y : ℝ) > 1 := by
    hole_3

  have hz : (z : ℝ) > 1 := by
    hole_4

  have hxyz : (x : ℝ) * y * z > 1 := by
    have h₁ : (x : ℝ) > 1 := hx
    have h₂ : (y : ℝ) > 1 := hy
    have h₃ : (z : ℝ) > 1 := hz
    have h₄ : (x : ℝ) * y > 1 := by
      hole_6
    hole_5

  have hlogx : Real.log (x : ℝ) > 0 := by
    hole_7

  have hlogy : Real.log (y : ℝ) > 0 := by
    hole_8

  have hlogz : Real.log (z : ℝ) > 0 := by
    hole_9

  have hlogxyz : Real.log ((x : ℝ) * y * z) > 0 := by
    have h₁ : Real.log ((x : ℝ) * y * z) = Real.log ((x : ℝ) * y) + Real.log (z : ℝ) := by
      have h₂ : (x : ℝ) * y > 0 := by hole_12
      have h₃ : (z : ℝ) > 0 := by hole_13
      have h₄ : Real.log ((x : ℝ) * y * z) = Real.log ((x : ℝ) * y) + Real.log (z : ℝ) := by
        hole_14
      hole_11
    rw [h₁]
    have h₂ : Real.log ((x : ℝ) * y) = Real.log (x : ℝ) + Real.log (y : ℝ) := by
      have h₃ : 0 < (x : ℝ) := by hole_16
      have h₄ : 0 < (y : ℝ) := by hole_17
      hole_15
    rw [h₂]
    have h₃ : Real.log (x : ℝ) > 0 := hlogx
    have h₄ : Real.log (y : ℝ) > 0 := hlogy
    have h₅ : Real.log (z : ℝ) > 0 := hlogz
    hole_10

  have hlogw_pos : Real.log (w : ℝ) > 0 := by
    have h₃ : Real.log (w : ℝ) / Real.log (x : ℝ) = 24 := by hole_19
    have h₄ : Real.log (x : ℝ) > 0 := hlogx
    have h₅ : Real.log (w : ℝ) > 0 := by
      by_contra h
      have h₆ : Real.log (w : ℝ) ≤ 0 := by hole_21
      have h₇ : Real.log (w : ℝ) / Real.log (x : ℝ) ≤ 0 := by
        hole_22
      hole_20
    hole_18

  have hlogw_eq : Real.log (w : ℝ) = 24 * Real.log (x : ℝ) := by
    have h₃ : Real.log (w : ℝ) / Real.log (x : ℝ) = 24 := by hole_24
    have h₄ : Real.log (x : ℝ) ≠ 0 := by hole_25
    have h₅ : Real.log (w : ℝ) = 24 * Real.log (x : ℝ) := by
      hole_26
    hole_23

  have hlogw_eq' : Real.log (w : ℝ) = 40 * Real.log (y : ℝ) := by
    have h₃ : Real.log (w : ℝ) / Real.log (y : ℝ) = 40 := by hole_28
    have h₄ : Real.log (y : ℝ) ≠ 0 := by hole_29
    have h₅ : Real.log (w : ℝ) = 40 * Real.log (y : ℝ) := by
      hole_30
    hole_27

  have hlogxy : 3 * Real.log (x : ℝ) = 5 * Real.log (y : ℝ) := by
    have h₁ : Real.log (w : ℝ) = 24 * Real.log (x : ℝ) := hlogw_eq
    have h₂ : Real.log (w : ℝ) = 40 * Real.log (y : ℝ) := hlogw_eq'
    have h₃ : 24 * Real.log (x : ℝ) = 40 * Real.log (y : ℝ) := by hole_32
    have h₄ : 3 * Real.log (x : ℝ) = 5 * Real.log (y : ℝ) := by
      hole_33
    hole_31

  have hlogxyz_eq : Real.log (w : ℝ) = 12 * (Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ)) := by
    have h₃ : Real.log (w : ℝ) / Real.log ((x : ℝ) * y * z) = 12 := by hole_35
    have h₄ : Real.log ((x : ℝ) * y * z) = Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ) := by
      have h₅ : Real.log ((x : ℝ) * y * z) = Real.log ((x : ℝ) * y) + Real.log (z : ℝ) := by
        have h₆ : 0 < (x : ℝ) * y := by hole_38
        have h₇ : 0 < (z : ℝ) := by hole_39
        have h₈ : Real.log ((x : ℝ) * y * z) = Real.log ((x : ℝ) * y) + Real.log (z : ℝ) := by
          hole_40
        hole_37
      rw [h₅]
      have h₉ : Real.log ((x : ℝ) * y) = Real.log (x : ℝ) + Real.log (y : ℝ) := by
        have h₁₀ : 0 < (x : ℝ) := by hole_42
        have h₁₁ : 0 < (y : ℝ) := by hole_43
        have h₁₂ : Real.log ((x : ℝ) * y) = Real.log (x : ℝ) + Real.log (y : ℝ) := by
          hole_44
        hole_41
      hole_36
    rw [h₄] at h₃
    have h₅ : Real.log (w : ℝ) / (Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ)) = 12 := by hole_45
    have h₆ : Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ) ≠ 0 := by
      hole_46
    hole_34

  have hlogx_rel : Real.log (x : ℝ) = Real.log (y : ℝ) + Real.log (z : ℝ) := by
    have h₃ : Real.log (w : ℝ) = 24 * Real.log (x : ℝ) := hlogw_eq
    have h₄ : Real.log (w : ℝ) = 12 * (Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ)) := hlogxyz_eq
    have h₅ : 24 * Real.log (x : ℝ) = 12 * (Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ)) := by hole_48
    have h₆ : 2 * Real.log (x : ℝ) = Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ) := by hole_49
    have h₇ : Real.log (x : ℝ) = Real.log (y : ℝ) + Real.log (z : ℝ) := by hole_50
    hole_47

  have hlogz_rel : Real.log (z : ℝ) = (2 : ℝ) / 5 * Real.log (x : ℝ) := by
    have h₃ : 3 * Real.log (x : ℝ) = 5 * Real.log (y : ℝ) := hlogxy
    have h₄ : Real.log (x : ℝ) = Real.log (y : ℝ) + Real.log (z : ℝ) := hlogx_rel
    have h₅ : Real.log (y : ℝ) = (3 : ℝ) / 5 * Real.log (x : ℝ) := by
      have h₅₁ : 3 * Real.log (x : ℝ) = 5 * Real.log (y : ℝ) := hlogxy
      have h₅₂ : Real.log (y : ℝ) = (3 : ℝ) / 5 * Real.log (x : ℝ) := by
        hole_53
      hole_52
    have h₆ : Real.log (z : ℝ) = (2 : ℝ) / 5 * Real.log (x : ℝ) := by
      have h₆₁ : Real.log (x : ℝ) = Real.log (y : ℝ) + Real.log (z : ℝ) := hlogx_rel
      hole_54
    hole_51

  have hgoal : Real.log (w : ℝ) / Real.log (z : ℝ) = 60 := by
    have h₃ : Real.log (w : ℝ) = 24 * Real.log (x : ℝ) := hlogw_eq
    have h₄ : Real.log (z : ℝ) = (2 : ℝ) / 5 * Real.log (x : ℝ) := hlogz_rel
    rw [h₃, h₄]
    have h₅ : Real.log (x : ℝ) ≠ 0 := by hole_56
    hole_55

  hole_1