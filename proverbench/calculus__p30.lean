theorem function_evaluation_example : f 7 1 = 56 := by
  have h₁ : f 7 1 = 56 := by
    calc
      f 7 1 = (7 : ℤ) * 1 ^ 2 + 7 ^ 2 * 1 := by
        -- Substitute \( x = 7 \) and \( y = 1 \) into the function.
        rw [f]
        <;> ring
      _ = 7 + 49 := by
        -- Calculate each term separately.
        norm_num
      _ = 56 := by
        -- Sum the terms to get the final result.
        norm_num
  -- The final result is already derived in h₁, so we just use it to close the proof.
  exact h₁