import Mathlib

open Polynomial

-- Set.Icc 0 (1 / 4)
/--
For $0 \leq p \leq 1/2$, let $X_1,X_2,\dots$ be independent random variables such that
$X_i=\begin{cases}
1 & \text{with probability $p$,} \\
-1 & \text{with probability $p$,} \\
0 & \text{with probability $1-2p$,}
\end{cases}$
for all $i \geq 1$. Given a positive integer $n$ and integers $b,a_1,\dots,a_n$, let $P(b,a_1,\dots,a_n)$ denote the probability that $a_1X_1+\dots+a_nX_n=b$. For which values of $p$ is it the case that $P(0,a_1,\dots,a_n) \geq P(b,a_1,\dots,a_n)$ for all positive integers $n$ and all integers $b,a_1,\dots,a_n$?
-/
theorem putnam_2022_b5
(p : ℝ)
(Xset : (n : ℕ) → Set (Fin n → ℤ))
(Xprob : (n : ℕ) → (Fin n → ℤ) → ℝ)
(P : (n : ℕ) → ℤ → (Fin n → ℤ) → ℝ)
(hXset : ∀ n > 0, Xset n = {X : Fin n → ℤ | ∀ i : Fin n, X i = 1 ∨ X i = -1 ∨ X i = 0})
(hXprob : ∀ n > 0, ∀ X : Fin n → ℤ, Xprob n X = ∏ i : Fin n, if (X i = 1 ∨ X i = -1) then p else (1 - 2 * p))
(hP : ∀ n > 0, ∀ (b : ℤ) (a : Fin n → ℤ), P n b a = ∑' X : {X' ∈ Xset n | (∑ i : Fin n, a i * X' i) = b}, Xprob n X)
: (0 ≤ p ∧ p ≤ 1 / 2 ∧ (∀ n > 0, ∀ (b : ℤ) (a : Fin n → ℤ), P n 0 a ≥ P n b a)) ↔ p ∈ ((Set.Icc 0 (1 / 4)) : Set ℝ ) := by
  have h_main : (0 ≤ p ∧ p ≤ 1 / 2 ∧ (∀ n > 0, ∀ (b : ℤ) (a : Fin n → ℤ), P n 0 a ≥ P n b a)) ↔ p ∈ ((Set.Icc 0 (1 / 4)) : Set ℝ ) := by
    constructor
    ·
      intro h
      -- Assume 0 ≤ p ≤ 1/2 and the inequality P_n(0, a) ≥ P_n(b, a) for all n, a, b
      have h₁ : 0 ≤ p := h.1
      have h₂ : p ≤ 1 / 2 := h.2.1
      have h₃ : ∀ n > 0, ∀ (b : ℤ) (a : Fin n → ℤ), P n 0 a ≥ P n b a := h.2.2
      -- We need to show that p ≤ 1/4
      have h₄ : p ≤ 1 / 4 := by
        by_contra h₄
        -- If p > 1/4, we will derive a contradiction
        have h₅ : p > 1 / 4 := by linarith
        -- Consider the case n = 2, a = (1, 2), b = 1
        have h₆ : (p : ℝ) > 1 / 4 := by exact_mod_cast h₅
        -- Use the given condition to find a contradiction
        have h₇ := h₃ 2 (by norm_num) (1 : ℤ) (fun i => if i = (0 : Fin 2) then 1 else 2)
        -- Convert the condition to a usable form
        have h₈ := h₇
        -- Simplify the condition to find a contradiction
        norm_num [hP, hXprob, hXset, Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ] at h₇ h₈
        <;>
        (try norm_num at h₆) <;>
        (try linarith) <;>
        (try nlinarith)
      -- Since p ≤ 1/4, we have p ∈ [0, 1/4]
      have h₅ : p ∈ Set.Icc 0 (1 / 4) := by
        exact ⟨h₁, h₄⟩
      exact h₅
    ·
      intro h
      -- Assume p ∈ [0, 1/4]
      have h₁ : 0 ≤ p := h.1
      have h₂ : p ≤ 1 / 4 := h.2
      have h₃ : p ≤ 1 / 2 := by linarith
      have h₄ : ∀ n > 0, ∀ (b : ℤ) (a : Fin n → ℤ), P n 0 a ≥ P n b a := by
        intro n hn b a
        have h₅ : P n 0 a ≥ P n b a := by
          -- Prove the inequality P_n(0, a) ≥ P_n(b, a) using the given conditions
          have h₆ : P n 0 a ≥ P n b a := by
            norm_num [hP, hXprob, hXset, Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ] at h₁ h₂ h₃ ⊢
            <;>
            (try norm_num at h₁ h₂ h₃ ⊢) <;>
            (try linarith) <;>
            (try nlinarith)
          exact h₆
        exact h₅
      -- Combine all results to get the final conclusion
      exact ⟨h₁, h₃, h₄⟩
  exact h_main