theorem putnam_1998_b6 : ∀ a b c : ℤ, ∃ n : ℤ, n > 0 ∧ ¬(∃ k : ℤ, k = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c)):=
  by
  --  intro a b c
  have h_main : ∃ (n : ℤ), n > 0 ∧ ¬(∃ (k : ℤ), (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c)):=
    by
    --  use 4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ)
    --  constructor
    --  · norm_num [abs_nonneg, le_max_left, le_max_right, le_refl, le_trans] <;> positivity
    --  · intro h
    --    rcases h with ⟨k, hk⟩
      have h₁ :
        (k : ℝ) =
          Real.sqrt
            ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 +
                  a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 +
                b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) +
              c) := by sorry
      have h₂ :
        (k : ℝ) ^ 2 =
          ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) ^ 3 +
                a * ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) ^ 2 +
              b * ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) +
            c := by sorry
      have h₃ :
        (k : ℤ) ^ 2 =
          (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 +
                a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 +
              b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) +
            c := by sorry
      have h₄ : False:=
        by
        have h₅ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ 4:=
          by
          have h₆ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0:= by -- exact Int.ofNat_zero_le _
            norm_num
          have h₇ : (2 : ℤ) * (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0:= by -- nlinarith
            norm_num
          --  nlinarith
          norm_num
        have h₆ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥ 16:= by -- nlinarith
          nlinarith
        have h₇ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 ≥ 64:= by -- nlinarith
          nlinarith
        have h₈ :
          (a : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥
            -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by sorry
        have h₉ :
          (b : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥
            -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) := by sorry
        have h₁₀ : (c : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ):=
          by
          have h₁₁ : (c : ℤ) ≥ -((abs c : ℤ)):= by -- -- cases' abs_cases c with h₁₂ h₁₂ <;> linarith
            hole
          have h₁₂ : (abs c : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ):= by -- exact le_max_right _ _
            norm_num
          --  linarith
          linarith
        have h₁₁ :
          (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 + a * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 +
                b * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) +
              c >
            (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by sorry
        have h₁₂ : (k : ℤ) ^ 2 > (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2:= by -- nlinarith
          linarith
        have h₁₃ : (k : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1:= by -- nlinarith
          hole
        have h₁₄ : (k : ℤ) ≥ -((4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1):= by -- nlinarith
          hole
        have h₁₅ : (k : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1:= by -- nlinarith
          linarith
        have h₁₆ : (k : ℤ) ≥ -((4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1):= by -- nlinarith
          linarith
        have h₁₇ : False:= by -- nlinarith
          nlinarith
        --  exact h₁₇
        nlinarith
    --    exact h₄
    hole
  --  rcases h_main with ⟨n, hn, hn'⟩
  --  refine' ⟨n, hn, _⟩
  --  intro h
  --  rcases h with ⟨k, hk⟩
  have h₁ : (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c):= by -- simpa using hk
    linarith
  have h₂ : ¬(∃ (k : ℤ), (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c)):= by -- exact hn'
    hole
  --  exact h₂ ⟨k, by simpa using h₁⟩
  hole