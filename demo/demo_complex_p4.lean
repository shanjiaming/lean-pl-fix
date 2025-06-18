import Mathlib

theorem simp_then_have_chain (x y : ℕ) (h : x + 0 = y + 0) : x = y := by
  simp at h
  have h1 : x ≤ y ∨ y ≤ x := le_total x y
  cases' h1 with h_le h_ge
  · -- case x ≤ y
    have h2 : x = y := by
      have h3 : x ≤ y := h_le
      have h4 : y ≤ x := by
        norm_num
        rw [← h]
      omega
    exact h2
  · -- case y ≤ x
    have h2 : x = y := by
      have h3 : y ≤ x := h_ge
      have h4 : x ≤ y := by
        rw [h]
        omega
      omega
    exact h2