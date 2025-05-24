import Mathlib
import Aesop

theorem demo_deep_nesting (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) : a = 3 ∧ b = 2 :=
  by
  have h1 : a ≤ 5 := by sorry
  have h2 : b ≤ 5 := by sorry
  have h3 : a > b := h_gt
  have h4 : a + b = 5 := h_eq
  have h5 : a = 3 ∧ b = 2 := by sorry
  --  exact h5
  sorry

theorem h1 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) : a ≤ 5 := by
  have h1_1 : a + b = 5 := h_eq
  have h1_2 : b ≥ 0 := by sorry
  have h1_3 : a = 5 - b := by sorry
  have h1_4 : a ≤ 5 := by sorry
  --  exact h1_4
  sorry

theorem h1_2 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1_1 : a + b = 5) : b ≥ 0 := by
  have h1_2_1 : b ≥ 0 := Nat.zero_le b
  --  exact h1_2_1
  sorry

theorem h1_3 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1_1 : a + b = 5) (h1_2 : b ≥ 0) : a = 5 - b := by
  have h1_3_1 : a + b = 5 := h1_1
  have h1_3_2 : a = 5 - b := by sorry
  --  exact h1_3_2
  sorry

theorem h1_3_2 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1_1 : a + b = 5) (h1_2 : b ≥ 0) (h1_3_1 : a + b = 5) : a = 5 - b := by -- omega
  sorry

theorem h1_4 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1_1 : a + b = 5) (h1_2 : b ≥ 0) (h1_3 : a = 5 - b) : a ≤ 5 := by
  --  rw [h1_3]
  have h1_4_1 : b ≥ 0 := h1_2
  have h1_4_2 : 5 - b ≤ 5 := by sorry
  --  exact h1_4_2
  sorry

theorem h1_4_2 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1_1 : a + b = 5) (h1_2 : b ≥ 0) (h1_3 : a = 5 - b) (h1_4_1 : b ≥ 0) : 5 - b ≤ 5 := by omega
  sorry

theorem h2 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1 : a ≤ 5) : b ≤ 5 := by
  have h2_1 : a + b = 5 := h_eq
  have h2_2 : a ≥ 0 := by sorry
  have h2_3 : b ≤ 5 := by sorry
  exact h2_3
  sorry

theorem h2_2 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1 : a ≤ 5) (h2_1 : a + b = 5) : a ≥ 0 := by
  have h2_2_1 : a ≥ 0 := Nat.zero_le a
  exact h2_2_1
  sorry

theorem h2_3 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1 : a ≤ 5) (h2_1 : a + b = 5) (h2_2 : a ≥ 0) : b ≤ 5 := by omega
  sorry

theorem h5 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1 : a ≤ 5) (h2 : b ≤ 5) (h3 : a > b) (h4 : a + b = 5) : a = 3 ∧ b = 2 := by interval_cases a <;> interval_cases b <;> norm_num at h3 h4 ⊢ <;> omega
  sorry

