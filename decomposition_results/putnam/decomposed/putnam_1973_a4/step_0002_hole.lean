theorem h₁ (f : ℝ → ℝ) (hf : f = fun x => 2 ^ x - 1 - x ^ 2) : f = fun x => 2 ^ x - 1 - x ^ 2 := by
  --  rw [hf] <;> simp [Real.rpow_def_of_pos] <;> norm_num <;> ring_nf <;> field_simp [Real.rpow_def_of_pos] <;>
        norm_num <;>
      ring_nf <;>
    norm_num
  hole