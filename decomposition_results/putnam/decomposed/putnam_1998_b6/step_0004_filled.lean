theorem h₂ (a b c k : ℤ) (hk h₁ :  (↑k : ℝ) =    √((↑(4 + 2 * max (max |a| |b|) |c|) : ℝ) ^ 3 + (↑a : ℝ) * (↑(4 + 2 * max (max |a| |b|) |c|) : ℝ) ^ 2 +          (↑b : ℝ) * (↑(4 + 2 * max (max |a| |b|) |c|) : ℝ) +        (↑c : ℝ))) : (↑k : ℝ) ^ 2 =
    (↑(4 + 2 * max (max |a| |b|) |c|) : ℝ) ^ 3 + (↑a : ℝ) * (↑(4 + 2 * max (max |a| |b|) |c|) : ℝ) ^ 2 +
        (↑b : ℝ) * (↑(4 + 2 * max (max |a| |b|) |c|) : ℝ) +
      (↑c : ℝ) :=
  by
  --  rw [h₁]
  have h₃ :
    0 ≤
      Real.sqrt
        ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 +
              a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 +
            b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) +
          c) := by sorry
  --  nlinarith [Real.sq_sqrt
  --      (show
  --        0 ≤
  --          ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 +
  --                  a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 +
  --                b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) +
  --              c :
  --            ℝ)
  --        by
  --        have h₄ :
  --          ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 +
  --                    a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 +
  --                  b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) +
  --                c :
  --              ℝ) ≥
  --            0 :=
  --          by
  --          have h₅ :
  --            ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 +
  --                      a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 +
  --                    b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) +
  --                  c :
  --                ℝ) ≥
  --              0 :=
  --            by
  --            norm_cast
  --            have h₆ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ 4 :=
  --              by
  --              have h₇ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by exact Int.ofNat_zero_le _
  --              have h₈ : (2 : ℤ) * (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by nlinarith
  --              nlinarith
  --            have h₉ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ 4 := by exact h₆
  --            have h₁₀ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥ 16 := by nlinarith
  --            have h₁₁ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 ≥ 64 := by nlinarith
  --            have h₁₂ :
  --              (a : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥
  --                -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 :=
  --              by
  --              have h₁₃ : (a : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) :=
  --                by
  --                have h₁₄ : (a : ℤ) ≥ -((abs a : ℤ)) := by cases' abs_cases a with h₁₅ h₁₅ <;> linarith
  --                have h₁₅ : (abs a : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
  --                  exact le_max_left_of_le (le_max_left _ _)
  --                linarith
  --              nlinarith
  --            have h₁₃ :
  --              (b : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥
  --                -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) :=
  --              by
  --              have h₁₄ : (b : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) :=
  --                by
  --                have h₁₅ : (b : ℤ) ≥ -((abs b : ℤ)) := by cases' abs_cases b with h₁₆ h₁₆ <;> linarith
  --                have h₁₆ : (abs b : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
  --                  exact le_max_right_of_le (le_max_left _ _)
  --                linarith
  --              nlinarith
  --            have h₁₄ : (c : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) :=
  --              by
  --              have h₁₅ : (c : ℤ) ≥ -((abs c : ℤ)) := by cases' abs_cases c with h₁₆ h₁₆ <;> linarith
  --              have h₁₆ : (abs c : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by exact le_max_right _ _
  --              linarith
  --            have h₁₅ :
  --              (a : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 +
  --                    (b : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) +
  --                  (c : ℤ) ≥
  --                -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 -
  --                    ((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) -
  --                  ((max (max (abs a) (abs b)) (abs c)) : ℤ) :=
  --              by nlinarith
  --            have h₁₆ :
  --              (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 +
  --                      (a : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 +
  --                    (b : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) +
  --                  (c : ℤ) ≥
  --                0 :=
  --              by
  --              have h₁₇ :
  --                (max (max (abs a) (abs b)) (abs c) : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) / 2 := by
  --                omega
  --              nlinarith
  --            linarith
  --          exact_mod_cast h₅
  --        exact_mod_cast h₄)]
  hole