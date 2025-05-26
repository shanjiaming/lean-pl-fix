theorem h₅₇ (x : ℝ) (hx : x ∈ Set.Ioo 0 8) (h₁ : 0 < x) (h₂ : x < 8) (h₃ : 8 * x - x ^ 2 > 0) (h₄ h₅₁ h₅₂ : HasDerivAt (fun x => 8 * x - x ^ 2) (8 - 2 * x) x) (h₅₃ : HasDerivAt (fun y => y ^ (1 / 3)) (1 / 3 * (8 * x - x ^ 2) ^ (-2 / 3)) (8 * x - x ^ 2)) : HasDerivAt sorry (1 / 3 * (8 * x - x ^ 2) ^ (-2 / 3) * (8 - 2 * x)) x := by
  --  --  --  convert HasDerivAt.comp x h₅₃ h₅₁ using 1 <;> simp [f, mul_assoc, mul_comm, mul_left_comm] <;> ring_nf <;>
  --          field_simp <;>
        ring_nf <;>
      norm_num <;>
    linarith
  hole