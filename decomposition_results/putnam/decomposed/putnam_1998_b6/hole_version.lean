macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
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
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)

theorem putnam_1998_b6
: ∀ a b c : ℤ, ∃ n : ℤ, n > 0 ∧ ¬(∃ k : ℤ, k = Real.sqrt (n^3 + a * n^2 + b * n + c)) := by
  intro a b c
  have h_main : ∃ (n : ℤ), n > 0 ∧ ¬(∃ (k : ℤ), (k : ℝ) = Real.sqrt (n^3 + a * n^2 + b * n + c)) := by
    use 4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ)
    constructor
    · 
      norm_num [abs_nonneg, le_max_left, le_max_right, le_refl, le_trans]
      <;>
      positivity
    · 
      intro h
      rcases h with ⟨k, hk⟩
      have h₁ : (k : ℝ) = Real.sqrt ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c) := by
        hole_1
      have h₂ : (k : ℝ) ^ 2 = ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) ^ 3 + a * ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) ^ 2 + b * ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) + c := by
        rw [h₁]
        have h₃ : 0 ≤ Real.sqrt ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c) := by
          hole_2
        hole_25
      have h₃ : (k : ℤ) ^ 2 = (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c := by
        hole_26
      have h₄ : False := by
        have h₅ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ 4 := by
          have h₆ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by
            hole_27
          have h₇ : (2 : ℤ) * (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by
            hole_28
          hole_29
        have h₆ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥ 16 := by
          hole_30
        have h₇ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 ≥ 64 := by
          hole_31
        have h₈ : (a : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by
          have h₉ : (a : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
            have h₁₀ : (a : ℤ) ≥ -((abs a : ℤ)) := by
              hole_32
            have h₁₁ : (abs a : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
              hole_33
            hole_34
          hole_35
        have h₉ : (b : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) := by
          have h₁₀ : (b : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
            have h₁₁ : (b : ℤ) ≥ -((abs b : ℤ)) := by
              hole_36
            have h₁₂ : (abs b : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
              hole_37
            hole_38
          hole_39
        have h₁₀ : (c : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
          have h₁₁ : (c : ℤ) ≥ -((abs c : ℤ)) := by
            hole_40
          have h₁₂ : (abs c : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
            hole_41
          hole_42
        have h₁₁ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 + a * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 + b * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + c > (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by
          have h₁₂ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) / 2 := by
            hole_43
          hole_44
        have h₁₂ : (k : ℤ) ^ 2 > (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by
          hole_45
        have h₁₃ : (k : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1 := by
          hole_46
        have h₁₄ : (k : ℤ) ≥ -((4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1) := by
          hole_47
        have h₁₅ : (k : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1 := by
          hole_48
        have h₁₆ : (k : ℤ) ≥ -((4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1) := by
          hole_49
        have h₁₇ : False := by
          hole_50
        hole_51
      hole_52
  rcases h_main with ⟨n, hn, hn'⟩
  refine' ⟨n, hn, _⟩
  intro h
  rcases h with ⟨k, hk⟩
  have h₁ : (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c) := by
    hole_53
  have h₂ : ¬(∃ (k : ℤ), (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c)) := by
    hole_54
  hole_55