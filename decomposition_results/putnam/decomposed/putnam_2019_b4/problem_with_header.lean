import Mathlib

open Topology Filter Set Matrix

-- Note: boosts the domain of f to the entire 2D plane
-- 2 * Real.log 2 - 1 / 2
/--
Let $\mathcal{F}$ be the set of functions $f(x,y)$ that are twice continuously differentiable for $x \geq 1,y \geq 1$ and that satisfy the following two equations (where subscripts denote partial derivatives):
\begin{gather*}
xf_x+yf_y=xy\ln(xy), \\
x^2f_{xx}+y^2f_{yy}=xy.
\end{gather*}
For each $f \in \mathcal{F}$, let $m(f)=\min_{s \geq 1} (f(s+1,s+1)-f(s+1,s)-f(s,s+1)+f(s,s))$. Determine $m(f)$, and show that it is independent of the choice of $f$.
-/
theorem putnam_2019_b4
(f : (Fin 2 → ℝ) → ℝ)
(vec : ℝ → ℝ → (Fin 2 → ℝ))
(fdiff : ContDiff ℝ 2 f)
(hvec : ∀ x y : ℝ, (vec x y) 0 = x ∧ (vec x y) 1 = y)
(feq1 : ∀ x ≥ 1, ∀ y ≥ 1, x * deriv (fun x' : ℝ => f (vec x' y)) x + y * deriv (fun y' : ℝ => f (vec x y')) y = x * y * Real.log (x * y))
(feq2 : ∀ x ≥ 1, ∀ y ≥ 1, x ^ 2 * iteratedDeriv 2 (fun x' : ℝ => f (vec x' y)) x + y ^ 2 * iteratedDeriv 2 (fun y' : ℝ => f (vec x y')) y = x * y)
: sInf {f (vec (s + 1) (s + 1)) - f (vec (s + 1) s) - f (vec s (s + 1)) + f (vec s s) | s ≥ 1} = ((2 * Real.log 2 - 1 / 2) : ℝ ) := by
  have h_main : sInf {f (vec (s + 1) (s + 1)) - f (vec (s + 1) s) - f (vec s (s + 1)) + f (vec s s) | (s : ℝ) ≥ 1} = (2 * Real.log 2 - 1 / 2 : ℝ) := by
    have h₁ : (2 * Real.log 2 - 1 / 2 : ℝ) ∈ {f (vec (s + 1) (s + 1)) - f (vec (s + 1) s) - f (vec s (s + 1)) + f (vec s s) | (s : ℝ) ≥ 1} := by
      -- Show that the specific value 2 * Real.log 2 - 1 / 2 is in the set by choosing s = 1
      have h₂ : (1 : ℝ) ≥ 1 := by norm_num
      refine' ⟨1, by norm_num, _⟩
      have h₃ := feq1 1 (by norm_num) 1 (by norm_num)
      have h₄ := feq2 1 (by norm_num) 1 (by norm_num)
      have h₅ := feq1 1 (by norm_num) 2 (by norm_num)
      have h₆ := feq2 1 (by norm_num) 2 (by norm_num)
      have h₇ := feq1 2 (by norm_num) 1 (by norm_num)
      have h₈ := feq2 2 (by norm_num) 1 (by norm_num)
      have h₉ := feq1 2 (by norm_num) 2 (by norm_num)
      have h₁₀ := feq2 2 (by norm_num) 2 (by norm_num)
      norm_num [hvec] at h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ ⊢
      <;>
      (try norm_num) <;>
      (try linarith) <;>
      (try ring_nf at h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ ⊢) <;>
      (try nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2)]) <;>
      (try field_simp at h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ ⊢) <;>
      (try ring_nf at h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ ⊢) <;>
      (try norm_num at h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ ⊢) <;>
      (try linarith) <;>
      (try nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2)])
    -- Use the fact that the set contains only one value to conclude the infimum
    have h₂ : {f (vec (s + 1) (s + 1)) - f (vec (s + 1) s) - f (vec s (s + 1)) + f (vec s s) | (s : ℝ) ≥ 1} = {2 * Real.log 2 - 1 / 2} := by
      apply Set.Subset.antisymm
      · -- Prove one inclusion
        intro x hx
        rcases hx with ⟨s, hs, rfl⟩
        have h₃ := h₁
        simp_all [Set.mem_singleton_iff]
        <;>
        (try norm_num) <;>
        (try linarith) <;>
        (try ring_nf at h₃ ⊢) <;>
        (try nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2)]) <;>
        (try field_simp at h₃ ⊢) <;>
        (try ring_nf at h₃ ⊢) <;>
        (try norm_num at h₃ ⊢) <;>
        (try linarith) <;>
        (try nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2)])
      · -- Prove the other inclusion
        intro x hx
        rw [Set.mem_singleton_iff] at hx
        rw [hx]
        exact h₁
    rw [h₂]
    norm_num
    <;>
    (try linarith) <;>
    (try ring_nf at h₁ ⊢) <;>
    (try nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2)]) <;>
    (try field_simp at h₁ ⊢) <;>
    (try ring_nf at h₁ ⊢) <;>
    (try norm_num at h₁ ⊢) <;>
    (try linarith) <;>
    (try nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2)])
  
  simpa using h_main