import Mathlib

theorem induction_with_have (n : ℕ) : n * (n + 1) / 2 + (n + 1) = (n + 1) * (n + 2) / 2 := by
  induction' n with k ih
  · -- base case n = 0
    simp
    have h1 : (0 : ℕ) * 1 / 2 = 0 := by norm_num
    have h2 : h1.trans rfl = (0 + 1) := by simp
    norm_num
  · -- inductive step
    simp [Nat.succ_eq_add_one]
    have h1 : k * (k + 1) / 2 + (k + 1) = (k + 1) * (k + 2) / 2 := by
      exact ih
    have h2 : (k + 1) * (k + 2) / 2 + (k + 2) = (k + 2) * (k + 3) / 2 := by
      have h3 : (k + 1) * (k + 2) = k * (k + 1) + 2 * (k + 1) := by ring
      have h4 : (k + 2) * (k + 3) = (k + 1) * (k + 2) + 2 * (k + 2) := by ring
      have h5 : 2 * (k + 2) = (k + 2) + (k + 2) := by ring
      ring
    exact h2