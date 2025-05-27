theorem neg_elements_bound (b : ℤ) (hb : b ∈ B) (hneg : b < 0) : b ≤ -4 :=
  by
  have h_main : ∃ (k : Int), b = -44 + 5 * k := by sorry
  have h_k_le_8 : ∀ (k : Int), b = -44 + 5 * k → k ≤ 8 := by sorry
  have h_final : b ≤ -4 := by sorry
  --  exact h_final
  linarith