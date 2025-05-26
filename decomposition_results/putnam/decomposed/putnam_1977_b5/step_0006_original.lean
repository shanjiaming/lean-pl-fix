theorem h₃ (n : ℕ) (hn : n > 1) (a : Fin n → ℝ) (A : ℝ) (hA : A + ∑ i, a i ^ 2 < 1 / ((↑n : ℝ) - 1) * (∑ i, a i) ^ 2) (h_pos_n : (↑n : ℝ) - 1 > 0) (i j : Fin n) (hij : i < j) (h₁ : A + ∑ k, a k ^ 2 < 1 / ((↑n : ℝ) - 1) * (∑ k, a k) ^ 2) : (∑ k, a k) ^ 2 = ∑ k, ∑ l, a k * a l := by
  calc
    (∑ k : Fin n, a k) ^ 2 = (∑ k : Fin n, a k) * (∑ k : Fin n, a k) := by ring
    _ = ∑ k : Fin n, ∑ l : Fin n, a k * a l := by
      simp [Finset.sum_mul, Finset.mul_sum] <;> rw [Finset.sum_comm] <;> simp [mul_comm] <;> ring
    _ = ∑ k : Fin n, ∑ l : Fin n, a k * a l := by rfl