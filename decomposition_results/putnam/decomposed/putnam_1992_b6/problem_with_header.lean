import Mathlib

open Topology Filter Nat Function Polynomial

/--
Let $M$ be a set of real $n \times n$ matrices such that
\begin{itemize}
\item[(i)] $I \in M$, where $I$ is the $n \times n$ identity matrix;
\item[(ii)] if $A \in M$ and $B \in M$, then either $AB \in M$ or $-AB \in M$, but not both;
\item[(iii)] if $A \in M$ and $B \in M$, then either $AB = BA$ or $AB = -BA$;
\item[(iv)] if $A \in M$ and $A \neq I$, there is at least one $B \in M$ such that $AB = -BA$.
\end{itemize}
Prove that $M$ contains at most $n^2$ matrices.
-/
theorem putnam_1992_b6
  (n : ℕ)
  (npos : 0 < n)
  (M : Set (Matrix (Fin n) (Fin n) ℝ))
  (h1 : 1 ∈ M)
  (h2 : ∀ A ∈ M, ∀ B ∈ M, Xor' (A * B ∈ M) (-A * B ∈ M))
  (h3 : ∀ A ∈ M, ∀ B ∈ M, (A * B = B * A) ∨ (A * B = -B * A))
  (h4 : ∀ A ∈ M, A ≠ 1 → ∃ B ∈ M, A * B = -B * A) :
  M.encard ≤ n ^ 2 := by
  have h_main : M = {1} := by
    apply Set.Subset.antisymm
    · -- Prove that M ⊆ {1}
      intro A hA
      by_contra h
      -- Assume A ≠ 1 and derive a contradiction
      have h5 : ∃ B ∈ M, A * B = -B * A := h4 A hA h
      obtain ⟨B, hB, h6⟩ := h5
      have h7 : A * B = 0 := by
        ext i j
        have h8 : (A * B) i j = 0 := by
          have h9 : (A * B) i j = - (B * A) i j := by
            rw [h6]
            <;> simp [Matrix.mul_apply, Pi.mul_apply]
            <;> ring
          have h10 : (A * B) i j = (A * B) i j := rfl
          have h11 : (B * A) i j = (B * A) i j := rfl
          have h12 : (A * B) i j = - (B * A) i j := by
            rw [h9]
          have h13 : (A * B) i j = (A * B) i j := rfl
          have h14 : (B * A) i j = (B * A) i j := rfl
          have h15 : (A * B) i j = - (B * A) i j := by
            rw [h9]
          have h16 : (A * B) i j + (B * A) i j = 0 := by
            linarith
          have h17 : (A * B) i j = (A i j) * (B i j) := by
            simp [Matrix.mul_apply, Pi.mul_apply]
          have h18 : (B * A) i j = (B i j) * (A i j) := by
            simp [Matrix.mul_apply, Pi.mul_apply]
          have h19 : (A i j) * (B i j) + (B i j) * (A i j) = 0 := by
            rw [h17, h18] at h16
            exact h16
          have h20 : (A i j) * (B i j) = 0 := by
            linarith
          have h21 : (A * B) i j = 0 := by
            rw [h17]
            exact h20
          exact h21
        exact h8
      have h8 : -A * B = 0 := by
        ext i j
        have h9 : (-A * B) i j = 0 := by
          have h10 : (-A * B) i j = (-A i j) * (B i j) := by
            simp [Matrix.mul_apply, Pi.mul_apply, Pi.neg_apply]
          rw [h10]
          have h11 : (A * B) i j = 0 := by
            rw [h7]
            <;> simp
          have h12 : (A * B) i j = (A i j) * (B i j) := by
            simp [Matrix.mul_apply, Pi.mul_apply]
          have h13 : (A i j) * (B i j) = 0 := by
            rw [h12] at h11
            exact h11
          have h14 : (-A i j) * (B i j) = 0 := by
            ring_nf at h13 ⊢
            <;> linarith
          exact h14
        exact h9
      have h9 : A * B ∈ M ∨ -A * B ∈ M → False := by
        intro h10
        cases h10 with
        | inl h10 =>
          have h11 : Xor' (A * B ∈ M) (-A * B ∈ M) := h2 A hA B hB
          have h12 : A * B ∈ M := h10
          have h13 : -A * B ∈ M → False := by
            intro h14
            have h15 : Xor' (A * B ∈ M) (-A * B ∈ M) := h2 A hA B hB
            simp [Xor'] at h15
            <;> aesop
          by_cases h16 : -A * B ∈ M
          · exfalso
            exact h13 h16
          · simp_all [Xor']
            <;> aesop
        | inr h10 =>
          have h11 : Xor' (A * B ∈ M) (-A * B ∈ M) := h2 A hA B hB
          have h12 : -A * B ∈ M := h10
          have h13 : A * B ∈ M → False := by
            intro h14
            have h15 : Xor' (A * B ∈ M) (-A * B ∈ M) := h2 A hA B hB
            simp [Xor'] at h15
            <;> aesop
          by_cases h16 : A * B ∈ M
          · exfalso
            exact h13 h16
          · simp_all [Xor']
            <;> aesop
      by_cases h10 : A * B ∈ M
      · exfalso
        exact h9 (Or.inl h10)
      · by_cases h11 : -A * B ∈ M
        · exfalso
          exact h9 (Or.inr h11)
        · have h12 : Xor' (A * B ∈ M) (-A * B ∈ M) := h2 A hA B hB
          simp [h10, h11, Xor'] at h12
          <;> aesop
    · -- Prove that {1} ⊆ M
      intro A hA
      simp only [Set.mem_singleton_iff] at hA ⊢
      rw [hA]
      exact h1
  
  have h_final : M.encard ≤ n ^ 2 := by
    rw [h_main]
    have h₁ : ({1} : Set (Matrix (Fin n) (Fin n) ℝ)).encard = 1 := by
      simp [Set.encard_singleton]
    rw [h₁]
    have h₂ : (1 : ℕ∞) ≤ (n ^ 2 : ℕ∞) := by
      norm_cast
      have h₃ : 0 < n := npos
      have h₄ : 1 ≤ n ^ 2 := by
        nlinarith
      exact h₄
    exact h₂
  
  exact h_final