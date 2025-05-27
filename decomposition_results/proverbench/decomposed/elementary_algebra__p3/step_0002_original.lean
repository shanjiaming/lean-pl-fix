theorem h1 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : a ^ 2 * (s a b c - a) + b ^ 2 * (s a b c - b) + c ^ 2 * (s a b c - c) =
    (a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c)) / 2 :=
  by
  have h₁ : s a b c = (a + b + c) / 2 := rfl
  rw [h₁]
  ring_nf <;> field_simp [mul_comm, mul_assoc, mul_left_comm] <;> ring_nf <;> linarith [ha, hb, hc]