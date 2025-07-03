import Mathlib

open Set

/--
Let $S$ be a set of $9$ lattice points (points with integer coordinates) in $3$-dimensional Euclidean space. Prove that there exists a lattice point along the interior of some line segment that joins two distinct points in $S$.
-/
theorem putnam_1971_a1
(S : Set (ℤ × ℤ × ℤ))
(hS : S.ncard = 9)
(L : (ℤ × ℤ × ℤ) × (ℤ × ℤ × ℤ) → Set (ℝ × ℝ × ℝ))
(hL : L = fun ((a, b, c), (d, e, f)) =>
{(t*a + (1-t)*d, t*b + (1-t)*e, t*c + (1-t)*f) | t ∈ Ioo (0 : ℝ) 1})
: ∃ x y z : ℤ, ∃ P Q : ℤ × ℤ × ℤ, P ∈ S ∧ Q ∈ S ∧ P ≠ Q ∧ ((x : ℝ), (y : ℝ), (z : ℝ)) ∈ L (P, Q) := by
  have h_main : ∃ (x y z : ℤ) (P Q : ℤ × ℤ × ℤ), P ∈ S ∧ Q ∈ S ∧ P ≠ Q ∧ ((x : ℝ), (y : ℝ), (z : ℝ)) ∈ L (P, Q) := by
    have h₁ : S.Nonempty := by
      by_contra h
      rw [Set.not_nonempty_iff_eq_empty] at h
      rw [h] at hS
      norm_num at hS
      <;> simp_all

    -- Use the fact that there are 9 points in S and only 8 possible parity classes to find two points with the same parity.
    have h₂ : ∃ (P Q : ℤ × ℤ × ℤ), P ∈ S ∧ Q ∈ S ∧ P ≠ Q ∧ (P.1 % 2 = Q.1 % 2) ∧ (P.2.1 % 2 = Q.2.1 % 2) ∧ (P.2.2 % 2 = Q.2.2 % 2) := by
      -- Use the pigeonhole principle to find two points with the same parity.
      classical
      have h₃ : ∃ (a : ℤ × ℤ × ℤ), a ∈ S := by
        exact Set.nonempty_iff_ne_empty.mpr (by intro h; simp_all)
      obtain ⟨a, ha⟩ := h₃
      have h₄ : S.ncard = 9 := hS
      have h₅ : S.Finite := by
        by_contra h₅
        have h₆ : S.Infinite := by simpa using h₅
        have h₇ : S.ncard = 0 := by
          apply Set.Infinite.ncard
          exact h₆
        linarith
      -- Use the fact that there are 9 points in S and only 8 possible parity classes to find two points with the same parity.
      have h₆ : ∃ (P Q : ℤ × ℤ × ℤ), P ∈ S ∧ Q ∈ S ∧ P ≠ Q ∧ (P.1 % 2 = Q.1 % 2) ∧ (P.2.1 % 2 = Q.2.1 % 2) ∧ (P.2.2 % 2 = Q.2.2 % 2) := by
        -- Use the pigeonhole principle to find two points with the same parity.
        by_contra h₆
        -- If no two points have the same parity, then the number of points in S is at most 8.
        have h₇ : S.Ncard ≤ 8 := by
          -- Use the fact that there are 8 possible parity classes.
          have h₈ : ∀ (P Q : ℤ × ℤ × ℤ), P ∈ S → Q ∈ S → P ≠ Q → ¬((P.1 % 2 = Q.1 % 2) ∧ (P.2.1 % 2 = Q.2.1 % 2) ∧ (P.2.2 % 2 = Q.2.2 % 2)) := by
            intro P Q hP hQ hPQ hPQ'
            exact h₆ ⟨P, Q, hP, hQ, hPQ, hPQ'.1, hPQ'.2.1, hPQ'.2.2⟩
          -- Use the fact that there are 8 possible parity classes.
          have h₉ : S.Ncard ≤ 8 := by
            -- Use the fact that there are 8 possible parity classes.
            have h₁₀ : S ⊆ (Set.range (fun (p : Fin 8) => (p.val % 2, p.val / 2 % 2, p.val / 4 % 2) : Fin 8 → ℤ × ℤ × ℤ)) := by
              intro P hP
              have h₁₁ : P ∈ S := hP
              have h₁₂ : ¬(∀ (Q : ℤ × ℤ × ℤ), Q ∈ S → Q ≠ P → ¬((Q.1 % 2 = P.1 % 2) ∧ (Q.2.1 % 2 = P.2.1 % 2) ∧ (Q.2.2 % 2 = P.2.2 % 2))) := by
                by_contra h₁₂
                have h₁₃ : ∀ (Q : ℤ × ℤ × ℤ), Q ∈ S → Q ≠ P → ¬((Q.1 % 2 = P.1 % 2) ∧ (Q.2.1 % 2 = P.2.1 % 2) ∧ (Q.2.2 % 2 = P.2.2 % 2)) := by simpa using h₁₂
                have h₁₄ := h₁₃ P h₁₁ (by tauto)
                simp at h₁₄
                <;> aesop
              -- Use the fact that there are 8 possible parity classes.
              have h₁₅ : ∃ (Q : ℤ × ℤ × ℤ), Q ∈ S ∧ Q ≠ P ∧ ((Q.1 % 2 = P.1 % 2) ∧ (Q.2.1 % 2 = P.2.1 % 2) ∧ (Q.2.2 % 2 = P.2.2 % 2)) := by
                by_contra h₁₅
                have h₁₆ : ∀ (Q : ℤ × ℤ × ℤ), Q ∈ S → Q ≠ P → ¬((Q.1 % 2 = P.1 % 2) ∧ (Q.2.1 % 2 = P.2.1 % 2) ∧ (Q.2.2 % 2 = P.2.2 % 2)) := by
                  intro Q hQ hQP
                  by_contra h₁₇
                  have h₁₈ : Q ∈ S := hQ
                  have h₁₉ : Q ≠ P := hQP
                  have h₂₀ : ((Q.1 % 2 = P.1 % 2) ∧ (Q.2.1 % 2 = P.2.1 % 2) ∧ (Q.2.2 % 2 = P.2.2 % 2)) := by tauto
                  exact h₁₅ ⟨Q, h₁₈, h₁₉, h₂₀⟩
                exact h₁₂ h₁₆
              obtain ⟨Q, hQ, hQP, hQ'⟩ := h₁₅
              have h₁₆ := h₈ P Q h₁₁ hQ (by tauto)
              tauto
            -- Use the fact that there are 8 possible parity classes.
            have h₁₁ : S.Ncard ≤ 8 := by
              calc
                S.Ncard ≤ (Set.range (fun (p : Fin 8) => (p.val % 2, p.val / 2 % 2, p.val / 4 % 2) : Fin 8 → ℤ × ℤ × ℤ)).Ncard := by
                  apply Set.Ncard_le_ncard h₁₀
                  <;> simp [h₅]
                _ = 8 := by
                  norm_num [Set.Ncard, Set.range, Fin.val_succ]
                  <;> decide
                _ ≤ 8 := by norm_num
            exact h₁₁
          exact h₉
        have h₁₀ : S.ncard ≤ 8 := by simpa [Set.Ncard] using h₇
        linarith
      exact h₆
    obtain ⟨P, Q, hP, hQ, hPQ, hP₁, hP₂, hP₃⟩ := h₂
    -- Use the midpoint of P and Q to find the desired point.
    have h₃ : ∃ (x y z : ℤ), ((x : ℝ), (y : ℝ), (z : ℝ)) ∈ L (P, Q) := by
      use (P.1 + Q.1) / 2, (P.2.1 + Q.2.1) / 2, (P.2.2 + Q.2.2) / 2
      have h₄ : (( (P.1 + Q.1 : ℤ) / 2 : ℝ), ( (P.2.1 + Q.2.1 : ℤ) / 2 : ℝ), ( (P.2.2 + Q.2.2 : ℤ) / 2 : ℝ)) ∈ L (P, Q) := by
        rw [hL]
        have h₅ : (P.1 + Q.1 : ℤ) % 2 = 0 := by
          have h₅₁ : P.1 % 2 = Q.1 % 2 := hP₁
          have h₅₂ : (P.1 + Q.1 : ℤ) % 2 = 0 := by
            omega
          exact h₅₂
        have h₆ : (P.2.1 + Q.2.1 : ℤ) % 2 = 0 := by
          have h₆₁ : P.2.1 % 2 = Q.2.1 % 2 := hP₂
          have h₆₂ : (P.2.1 + Q.2.1 : ℤ) % 2 = 0 := by
            omega
          exact h₆₂
        have h₇ : (P.2.2 + Q.2.2 : ℤ) % 2 = 0 := by
          have h₇₁ : P.2.2 % 2 = Q.2.2 % 2 := hP₃
          have h₇₂ : (P.2.2 + Q.2.2 : ℤ) % 2 = 0 := by
            omega
          exact h₇₂
        have h₈ : ( (P.1 + Q.1 : ℤ) / 2 : ℝ) = (1 / 2 : ℝ) * P.1 + (1 - 1 / 2 : ℝ) * Q.1 := by
          have h₈₁ : (P.1 + Q.1 : ℤ) % 2 = 0 := h₅
          have h₈₂ : (P.1 + Q.1 : ℤ) = 2 * ((P.1 + Q.1 : ℤ) / 2) := by
            omega
          have h₈₃ : ( (P.1 + Q.1 : ℤ) / 2 : ℝ) = (1 / 2 : ℝ) * P.1 + (1 - 1 / 2 : ℝ) * Q.1 := by
            field_simp [h₈₁]
            <;> ring_nf at h₈₂ ⊢ <;>
            (try norm_cast at h₈₂ ⊢) <;>
            (try ring_nf at h₈₂ ⊢) <;>
            (try norm_num at h₈₂ ⊢) <;>
            (try omega)
            <;>
            (try linarith)
          exact h₈₃
        have h₉ : ( (P.2.1 + Q.2.1 : ℤ) / 2 : ℝ) = (1 / 2 : ℝ) * P.2.1 + (1 - 1 / 2 : ℝ) * Q.2.1 := by
          have h₉₁ : (P.2.1 + Q.2.1 : ℤ) % 2 = 0 := h₆
          have h₉₂ : (P.2.1 + Q.2.1 : ℤ) = 2 * ((P.2.1 + Q.2.1 : ℤ) / 2) := by
            omega
          have h₉₃ : ( (P.2.1 + Q.2.1 : ℤ) / 2 : ℝ) = (1 / 2 : ℝ) * P.2.1 + (1 - 1 / 2 : ℝ) * Q.2.1 := by
            field_simp [h₉₁]
            <;> ring_nf at h₉₂ ⊢ <;>
            (try norm_cast at h₉₂ ⊢) <;>
            (try ring_nf at h₉₂ ⊢) <;>
            (try norm_num at h₉₂ ⊢) <;>
            (try omega)
            <;>
            (try linarith)
          exact h₉₃
        have h₁₀ : ( (P.2.2 + Q.2.2 : ℤ) / 2 : ℝ) = (1 / 2 : ℝ) * P.2.2 + (1 - 1 / 2 : ℝ) * Q.2.2 := by
          have h₁₀₁ : (P.2.2 + Q.2.2 : ℤ) % 2 = 0 := h₇
          have h₁₀₂ : (P.2.2 + Q.2.2 : ℤ) = 2 * ((P.2.2 + Q.2.2 : ℤ) / 2) := by
            omega
          have h₁₀₃ : ( (P.2.2 + Q.2.2 : ℤ) / 2 : ℝ) = (1 / 2 : ℝ) * P.2.2 + (1 - 1 / 2 : ℝ) * Q.2.2 := by
            field_simp [h₁₀₁]
            <;> ring_nf at h₁₀₂ ⊢ <;>
            (try norm_cast at h₁₀₂ ⊢) <;>
            (try ring_nf at h₁₀₂ ⊢) <;>
            (try norm_num at h₁₀₂ ⊢) <;>
            (try omega)
            <;>
            (try linarith)
          exact h₁₀₃
        refine' ⟨1 / 2, by norm_num [Real.pi_pos.le], _⟩
        simp_all [h₈, h₉, h₁₀, mul_comm]
        <;> ring_nf
        <;> norm_num
        <;>
        (try norm_cast)
        <;>
        (try ring_nf)
        <;>
        (try norm_num)
        <;>
        (try omega)
        <;>
        (try linarith)
      exact h₄
    obtain ⟨x, y, z, h₄⟩ := h₃
    refine' ⟨x, y, z, P, Q, hP, hQ, hPQ, _⟩
    exact h₄
  obtain ⟨x, y, z, P, Q, hP, hQ, hPQ, h₅⟩ := h_main
  refine' ⟨x, y, z, P, Q, hP, hQ, hPQ, _⟩
  exact h₅