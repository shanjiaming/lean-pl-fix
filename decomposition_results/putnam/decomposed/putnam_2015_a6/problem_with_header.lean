import Mathlib

/--
Let $n$ be a positive integer. Suppose that $A$, $B$, and $M$ are $n \times n$ matrices with real entries such that $AM = MB$, and such that $A$ and $B$ have the same characteristic polynomial. Prove that $\det(A-MX)=\det(B-XM)$ for every $n \times n$ matrix $X$ with real entries.
-/
theorem putnam_2015_a6
(n : ℕ)
(A B M : Matrix (Fin n) (Fin n) ℝ)
(npos : n > 0)
(hmul : A * M = M * B)
(hpoly : Matrix.charpoly A = Matrix.charpoly B)
: ∀ X : Matrix (Fin n) (Fin n) ℝ, (A - M * X).det = (B - X * M).det := by
  have h_main : ∀ X : Matrix (Fin n) (Fin n) ℝ, (A - M * X).det = (B - X * M).det := by
    intro X
    have h₁ : (A - M * X) * M = M * (B - X * M) := by
      calc
        (A - M * X) * M = A * M - M * X * M := by
          rw [Matrix.sub_mul]
          <;>
          simp [Matrix.mul_assoc]
        _ = M * B - M * X * M := by rw [hmul]
        _ = M * (B - X * M) := by
          rw [Matrix.mul_sub]
          <;>
          simp [Matrix.mul_assoc]
          <;>
          ring
    have h₂ : (A - M * X).det * M.det = M.det * (B - X * M).det := by
      calc
        (A - M * X).det * M.det = ((A - M * X) * M).det := by
          rw [Matrix.det_mul]
        _ = (M * (B - X * M)).det := by rw [h₁]
        _ = M.det * (B - X * M).det := by rw [Matrix.det_mul]
    have h₃ : (A - M * X).det * M.det = M.det * (B - X * M).det := h₂
    by_cases hM : M.det = 0
    · have h₄ : (A - M * X).det = (B - X * M).det := by
        have h₅ : (A - M * X).det * M.det = M.det * (B - X * M).det := h₃
        rw [hM] at h₅
        simp at h₅
        <;>
        simp_all [Matrix.det_fin_zero]
        <;>
        aesop
      exact h₄
    · have h₄ : (A - M * X).det = (B - X * M).det := by
        have h₅ : (A - M * X).det * M.det = M.det * (B - X * M).det := h₃
        apply mul_left_cancel₀ hM
        linarith
      exact h₄
  exact h_main