theorem demo_deep_nesting (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) : a = 3 ∧ b = 2:=
  by
  have h1 : a ≤ 5:= by
    have h1_1 : a + b = 5 := h_eq
    have h1_2 : b ≥ 0:= by
      have h1_2_1 : b ≥ 0 := Nat.zero_le b
      exact h1_2_1
    have h1_3 : a = 5 - b:= by
      have h1_3_1 : a + b = 5 := h1_1
      have h1_3_2 : a = 5 - b:= by omega
      exact h1_3_2
    have h1_4 : a ≤ 5:= by
      rw [h1_3]
      have h1_4_1 : b ≥ 0 := h1_2
      have h1_4_2 : 5 - b ≤ 5:= by omega
      exact h1_4_2
    exact h1_4
  have h2 : b ≤ 5:= by
    have h2_1 : a + b = 5 := h_eq
    have h2_2 : a ≥ 0:= by
      have h2_2_1 : a ≥ 0 := Nat.zero_le a
      exact h2_2_1
    have h2_3 : b ≤ 5:= by omega
    exact h2_3
  have h3 : a > b := h_gt
  have h4 : a + b = 5 := h_eq
  have h5 : a = 3 ∧ b = 2:= by interval_cases a <;> interval_cases b <;> norm_num at h3 h4 ⊢ <;> omega
  exact h5