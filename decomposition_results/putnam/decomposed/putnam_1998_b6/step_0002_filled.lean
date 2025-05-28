theorem h_main (a b c : ℤ) : ∃ n > 0, ¬∃ k, ↑k = √(↑n ^ 3 + ↑a * ↑n ^ 2 + ↑b * ↑n + ↑c) :=
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
    have h₄ : False := by sorry
  --    exact h₄
  hole