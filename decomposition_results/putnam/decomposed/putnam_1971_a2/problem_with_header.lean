import Mathlib

open Set

-- {Polynomial.X}
/--
Determine all polynomials $P(x)$ such that $P(x^2 + 1) = (P(x))^2 + 1$ and $P(0) = 0$.
-/
theorem putnam_1971_a2
    (P : Polynomial ℝ) :
    (P.eval 0 = 0 ∧ (∀ x : ℝ, P.eval (x^2 + 1) = (P.eval x)^2 + 1)) ↔ P ∈ (({Polynomial.X}) : Set (Polynomial ℝ) ) := by
  have h_main : (P.eval 0 = 0 ∧ (∀ x : ℝ, P.eval (x^2 + 1) = (P.eval x)^2 + 1)) → P ∈ (({Polynomial.X}) : Set (Polynomial ℝ)) := by
    intro h
    have h₁ : P.eval 0 = 0 := h.1
    have h₂ : ∀ x : ℝ, P.eval (x ^ 2 + 1) = (P.eval x) ^ 2 + 1 := h.2
    have h₃ : P = Polynomial.X := by
      -- Define the sequence a_n
      have h₄ : ∀ n : ℕ, P.eval (Nat.recOn n 0 fun _ a => a ^ 2 + 1) = (Nat.recOn n 0 fun _ a => a ^ 2 + 1 : ℝ) := by
        intro n
        induction n with
        | zero => simp [h₁]
        | succ n ih =>
          simp_all [Nat.recOn, pow_succ, mul_assoc]
          <;>
          (try norm_num) <;>
          (try ring_nf at *) <;>
          (try simp_all [h₂, pow_two, mul_assoc]) <;>
          (try nlinarith)
      -- Prove that P - X has infinitely many roots
      have h₅ : P = Polynomial.X := by
        apply Polynomial.funext
        intro x
        have h₆ : P.eval x = x := by
          by_contra h₇
          -- Use the fact that P and X agree on the sequence a_n to show they must be equal
          have h₈ : P - Polynomial.X ≠ 0 := by
            intro h₉
            have h₁₀ : P = Polynomial.X := by
              rw [sub_eq_zero] at h₉
              exact h₉
            rw [h₁₀] at h₇
            simp_all [Polynomial.eval_X]
          -- Use the fact that P - X has infinitely many roots to derive a contradiction
          have h₉ : (P - Polynomial.X).eval x ≠ 0 := by
            intro h₁₀
            have h₁₁ : P.eval x = x := by
              have h₁₂ : (P - Polynomial.X).eval x = 0 := by simpa using h₁₀
              have h₁₃ : P.eval x - x = 0 := by simpa [Polynomial.eval_sub, Polynomial.eval_X] using h₁₂
              linarith
            contradiction
          have h₁₀ : ∃ (n : ℕ), (P - Polynomial.X).eval (Nat.recOn n 0 fun _ a => a ^ 2 + 1 : ℝ) ≠ 0 := by
            by_contra h₁₁
            push_neg at h₁₁
            have h₁₂ : ∀ n : ℕ, (P - Polynomial.X).eval (Nat.recOn n 0 fun _ a => a ^ 2 + 1 : ℝ) = 0 := by simpa using h₁₁
            have h₁₃ : P = Polynomial.X := by
              apply Polynomial.funext
              intro x
              have h₁₄ : P.eval x = x := by
                by_contra h₁₅
                have h₁₆ : P - Polynomial.X ≠ 0 := by
                  intro h₁₇
                  have h₁₈ : P = Polynomial.X := by
                    rw [sub_eq_zero] at h₁₇
                    exact h₁₇
                  rw [h₁₈] at h₁₅
                  simp_all [Polynomial.eval_X]
                have h₁₇ : (P - Polynomial.X).eval x ≠ 0 := by
                  intro h₁₈
                  have h₁₉ : P.eval x = x := by
                    have h₂₀ : (P - Polynomial.X).eval x = 0 := by simpa using h₁₈
                    have h₂₁ : P.eval x - x = 0 := by simpa [Polynomial.eval_sub, Polynomial.eval_X] using h₂₀
                    linarith
                  contradiction
                exfalso
                exact h₁₇ (by simpa [Polynomial.eval_sub, Polynomial.eval_X] using h₁₂ 0)
              simpa [Polynomial.eval_sub, Polynomial.eval_X] using h₁₄
            rw [h₁₃] at h₈
            simp_all [Polynomial.eval_X]
          obtain ⟨n, hn⟩ := h₁₀
          have h₁₁ := h₄ n
          have h₁₂ := h₄ 0
          have h₁₃ := h₄ 1
          have h₁₄ := h₄ 2
          have h₁₅ := h₄ 3
          norm_num at h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ hn ⊢
          <;>
          (try contradiction) <;>
          (try simp_all [Polynomial.eval_sub, Polynomial.eval_X, Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X]) <;>
          (try ring_nf at *) <;>
          (try nlinarith)
        simpa [Polynomial.eval_sub, Polynomial.eval_X] using h₆
      simpa [Polynomial.eval_sub, Polynomial.eval_X] using h₅
    -- Conclude that P is in the set {X}
    have h₆ : P ∈ ({Polynomial.X} : Set (Polynomial ℝ)) := by
      rw [Set.mem_singleton_iff]
      exact h₃
    exact h₆
  have h_trivial : P ∈ (({Polynomial.X}) : Set (Polynomial ℝ)) → (P.eval 0 = 0 ∧ (∀ x : ℝ, P.eval (x^2 + 1) = (P.eval x)^2 + 1)) := by
    intro h
    have h₁ : P = Polynomial.X := by
      simpa using h
    have h₂ : P.eval 0 = 0 := by
      rw [h₁]
      simp [Polynomial.eval_X]
    have h₃ : ∀ x : ℝ, P.eval (x ^ 2 + 1) = (P.eval x) ^ 2 + 1 := by
      intro x
      rw [h₁]
      simp [Polynomial.eval_X, pow_two]
      <;> ring_nf
      <;> simp_all
      <;> nlinarith
    exact ⟨h₂, h₃⟩
  have h_final : (P.eval 0 = 0 ∧ (∀ x : ℝ, P.eval (x^2 + 1) = (P.eval x)^2 + 1)) ↔ P ∈ (({Polynomial.X}) : Set (Polynomial ℝ)) := by
    constructor
    · intro h
      exact h_main h
    · intro h
      exact h_trivial h
  exact h_final