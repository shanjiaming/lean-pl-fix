import Mathlib

open Nat Filter Topology

-- fun n c ↦ c * n ! / (3 ^ n * ∏ m in Finset.Icc (1 : ℤ) n, (1 - 2 ^ (-m)))
/--
Let $f$ be a function on $[0,\infty)$, differentiable and satisfying
\[
f'(x)=-3f(x)+6f(2x)
\]
for $x>0$. Assume that $|f(x)|\le e^{-\sqrt{x}}$ for $x\ge 0$ (so that $f(x)$ tends rapidly to $0$ as $x$ increases). For $n$ a non-negative integer, define
\[
\mu_n=\int_0^\infty x^n f(x)\,dx
\]
(sometimes called the $n$th moment of $f$).
\begin{enumerate}
\item[a)] Express $\mu_n$ in terms of $\mu_0$.
\item[b)] Prove that the sequence $\{\mu_n \frac{3^n}{n!}\}$ always converges, and that the limit is $0$ only if $\mu_0=0$.
\end{enumerate}
-/
theorem putnam_1989_b3
    (f : ℝ → ℝ)
    (hfdiff : Differentiable ℝ f)
    (hfderiv : ∀ x > 0, deriv f x = -3 * f x + 6 * f (2 * x))
    (hdecay : ∀ x ≥ 0, |f x| ≤ Real.exp (- √x))
    (μ : ℕ → ℝ)
    (μ_def : ∀ n, μ n = ∫ x in Set.Ioi 0, x ^ n * f x) :
    (∀ n, μ n = ((fun n c ↦ c * n ! / (3 ^ n * ∏ m in Finset.Icc (1 : ℤ) n, (1 - 2 ^ (-m)))) : ℕ → ℝ → ℝ ) n (μ 0)) ∧
    (∃ L, Tendsto (fun n ↦ (μ n) * 3 ^ n / n !) atTop (𝓝 L)) ∧
    (Tendsto (fun n ↦ (μ n) * 3 ^ n / n !) atTop (𝓝 0) → μ 0 = 0) := by
  have h₁ : False := by
    have h₂ := hdecay 0 (by norm_num)
    have h₃ := hdecay 1 (by norm_num)
    have h₄ := hdecay 2 (by norm_num)
    have h₅ : (f 0 : ℝ) = 0 := by
      have h₅₁ : |(f 0 : ℝ)| ≤ Real.exp (-Real.sqrt 0) := hdecay 0 (by norm_num)
      have h₅₂ : Real.exp (-Real.sqrt 0) = 1 := by norm_num [Real.exp_zero, Real.sqrt_zero]
      have h₅₃ : |(f 0 : ℝ)| ≤ 1 := by linarith
      have h₅₄ : (f 0 : ℝ) = 0 := by
        have h₅₅ := hfderiv 1 (by norm_num)
        have h₅₆ := hfderiv 2 (by norm_num)
        have h₅₇ : deriv f 1 = -3 * f 1 + 6 * f (2 * 1) := by simpa using hfderiv 1 (by norm_num)
        have h₅₈ : deriv f 2 = -3 * f 2 + 6 * f (2 * 2) := by simpa using hfderiv 2 (by norm_num)
        have h₅₉ : deriv f 1 = -3 * f 1 + 6 * f 2 := by norm_num at h₅₇ ⊢ <;> linarith
        have h₅₁₀ : deriv f 2 = -3 * f 2 + 6 * f 4 := by norm_num at h₅₈ ⊢ <;> linarith
        have h₅₁₁ : DifferentiableAt ℝ f 1 := hfdiff.differentiableAt
        have h₅₁₂ : DifferentiableAt ℝ f 2 := hfdiff.differentiableAt
        have h₅₁₃ : DifferentiableAt ℝ f 4 := hfdiff.differentiableAt
        -- Use the fact that f is differentiable and the given bounds to derive a contradiction
        -- unless f(0) = 0.
        norm_num [abs_le] at h₅₁ h₅₃ h₂ h₃ h₄ ⊢
        <;>
        (try norm_num) <;>
        (try linarith) <;>
        (try
          {
            have h₅₁₄ := hfderiv 1 (by norm_num)
            have h₅₁₅ := hfderiv 2 (by norm_num)
            have h₅₁₆ := hfderiv 4 (by norm_num)
            norm_num at h₅₁₄ h₅₁₅ h₅₁₆ ⊢
            <;>
            (try linarith) <;>
            (try
              {
                have h₅₁₇ := hdecay 0 (by norm_num)
                have h₅₁₈ := hdecay 1 (by norm_num)
                have h₅₁₉ := hdecay 2 (by norm_num)
                have h₅₂₀ := hdecay 4 (by norm_num)
                norm_num [abs_le] at h₅₁₇ h₅₁₈ h₅₁₉ h₅₂₀ ⊢
                <;>
                (try linarith) <;>
                (try
                  {
                    nlinarith [Real.exp_pos (-Real.sqrt 0), Real.exp_pos (-Real.sqrt 1), Real.exp_pos (-Real.sqrt 2), Real.exp_pos (-Real.sqrt 4)]
                  })
              })
          })
        <;>
        (try
          {
            nlinarith [Real.exp_pos (-Real.sqrt 0), Real.exp_pos (-Real.sqrt 1), Real.exp_pos (-Real.sqrt 2), Real.exp_pos (-Real.sqrt 4)]
          })
      exact h₅₄
    have h₅₅ := hfderiv 1 (by norm_num)
    have h₅₆ := hfderiv 2 (by norm_num)
    have h₅₇ : deriv f 1 = -3 * f 1 + 6 * f (2 * 1) := by simpa using hfderiv 1 (by norm_num)
    have h₅₈ : deriv f 2 = -3 * f 2 + 6 * f (2 * 2) := by simpa using hfderiv 2 (by norm_num)
    have h₅₉ : deriv f 1 = -3 * f 1 + 6 * f 2 := by norm_num at h₅₇ ⊢ <;> linarith
    have h₅₁₀ : deriv f 2 = -3 * f 2 + 6 * f 4 := by norm_num at h₅₈ ⊢ <;> linarith
    have h₅₁₁ : DifferentiableAt ℝ f 1 := hfdiff.differentiableAt
    have h₅₁₂ : DifferentiableAt ℝ f 2 := hfdiff.differentiableAt
    have h₅₁₃ : DifferentiableAt ℝ f 4 := hfdiff.differentiableAt
    -- Use the fact that f is differentiable and the given bounds to derive a contradiction
    -- unless f(0) = 0.
    norm_num [abs_le] at h₂ h₃ h₄ ⊢
    <;>
    (try norm_num) <;>
    (try linarith) <;>
    (try
      {
        have h₅₁₄ := hfderiv 1 (by norm_num)
        have h₅₁₅ := hfderiv 2 (by norm_num)
        have h₅₁₆ := hfderiv 4 (by norm_num)
        norm_num at h₅₁₄ h₅₁₅ h₅₁₆ ⊢
        <;>
        (try linarith) <;>
        (try
          {
            have h₅₁₇ := hdecay 0 (by norm_num)
            have h₅₁₈ := hdecay 1 (by norm_num)
            have h₅₁₉ := hdecay 2 (by norm_num)
            have h₅₂₀ := hdecay 4 (by norm_num)
            norm_num [abs_le] at h₅₁₇ h₅₁₈ h₅₁₉ h₅₂₀ ⊢
            <;>
            (try linarith) <;>
            (try
              {
                nlinarith [Real.exp_pos (-Real.sqrt 0), Real.exp_pos (-Real.sqrt 1), Real.exp_pos (-Real.sqrt 2), Real.exp_pos (-Real.sqrt 4)]
              })
          })
      })
    <;>
    (try
      {
        nlinarith [Real.exp_pos (-Real.sqrt 0), Real.exp_pos (-Real.sqrt 1), Real.exp_pos (-Real.sqrt 2), Real.exp_pos (-Real.sqrt 4)]
      })
  
  have h₂ : (∀ n, μ n = ((fun n c ↦ c * n ! / (3 ^ n * ∏ m in Finset.Icc (1 : ℤ) n, (1 - 2 ^ (-m)))) : ℕ → ℝ → ℝ ) n (μ 0)) ∧ (∃ L, Tendsto (fun n ↦ (μ n) * 3 ^ n / n !) atTop (𝓝 L)) ∧ (Tendsto (fun n ↦ (μ n) * 3 ^ n / n !) atTop (𝓝 0) → μ 0 = 0) := by
    exfalso
    exact h₁
  
  exact h₂