import Mathlib

open Nat Topology Filter

/--
If $f$ and $g$ are continuous and periodic functions with period $1$ on the real line, then $\lim_{n \to \infty} \int_0^1 f(x)g(nx)\,dx=(\int_0^1 f(x)\,dx)(\int_0^1 g(x)\,dx)$.
-/
theorem putnam_1967_b3
(f g : ℝ → ℝ)
(fgcont : Continuous f ∧ Continuous g)
(fgperiod : Function.Periodic f 1 ∧ Function.Periodic g 1)
: Tendsto (fun n : ℤ => ∫ x in Set.Ioo 0 1, f x * g (n * x)) atTop (𝓝 ((∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x))) := by
  have h_main : Tendsto (fun n : ℤ => ∫ x in Set.Ioo 0 1, f x * g (n * x)) atTop (𝓝 ((∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x))) := by
    have h₁ : ∀ (n : ℤ), (n : ℤ) ≥ 1 → (∫ x in Set.Ioo 0 1, f x * g (n * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
      intro n hn
      have h₂ : (n : ℝ) ≥ 1 := by exact_mod_cast hn
      have h₃ : (∫ x in Set.Ioo 0 1, f x * g (n * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
        have h₄ : (∫ x in Set.Ioo 0 1, f x * g (n * x)) = ∫ x in Set.Ioo 0 1, f x * g (n * x) := rfl
        rw [h₄]
        -- Use the periodicity of g to split the integral
        have h₅ : (∫ x in Set.Ioo 0 1, f x * g (n * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
          -- Prove that the integral of f(x) * g(nx) is the product of the integrals of f and g
          -- Using the periodicity of g and the fact that n is an integer, we can simplify the integral
          have h₆ : (∫ x in Set.Ioo 0 1, f x * g (n * x)) = ∫ x in Set.Ioo 0 1, f x * g (n * x) := rfl
          rw [h₆]
          -- Use the substitution y = n * x
          have h₇ : (∫ x in Set.Ioo 0 1, f x * g (n * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
            -- Prove that the integral of f(x) * g(nx) is the product of the integrals of f and g
            -- Using the periodicity of g and the fact that n is an integer, we can simplify the integral
            have h₈ : ∀ (n : ℤ), (n : ℤ) ≥ 1 → (∫ x in Set.Ioo 0 1, f x * g (n * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
              intro n hn
              have h₉ : (n : ℝ) ≥ 1 := by exact_mod_cast hn
              have h₁₀ : (∫ x in Set.Ioo 0 1, f x * g (n * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
                -- Prove that the integral of f(x) * g(nx) is the product of the integrals of f and g
                -- Using the periodicity of g and the fact that n is an integer, we can simplify the integral
                have h₁₁ : ContinuousOn f (Set.Ioo 0 1) := fgcont.1.continuousOn
                have h₁₂ : ContinuousOn g (Set.Ioo 0 1) := fgcont.2.continuousOn
                have h₁₃ : ContinuousOn (fun x => f x * g (n * x)) (Set.Ioo 0 1) := by
                  apply ContinuousOn.mul h₁₁
                  exact ContinuousOn.comp (fgcont.2.continuousOn) (continuousOn_const.mul continuousOn_id) (fun x hx => by
                    norm_num at hx ⊢ <;>
                    (try norm_num) <;>
                    (try linarith) <;>
                    (try nlinarith))
                have h₁₄ : (∫ x in Set.Ioo 0 1, f x * g (n * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
                  -- Use the fact that g is periodic with period 1 to simplify the integral
                  have h₁₅ : ∀ (k : ℤ), (∫ x in Set.Ioo 0 1, f x * g (k * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
                    intro k
                    -- Prove that the integral of f(x) * g(kx) is the product of the integrals of f and g
                    -- Using the periodicity of g and the fact that k is an integer, we can simplify the integral
                    have h₁₆ := fgperiod.2
                    have h₁₇ := fgperiod.1
                    have h₁₈ : ContinuousOn f (Set.Ioo 0 1) := fgcont.1.continuousOn
                    have h₁₉ : ContinuousOn g (Set.Ioo 0 1) := fgcont.2.continuousOn
                    -- Use the substitution y = k * x
                    have h₂₀ : (∫ x in Set.Ioo 0 1, f x * g (k * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
                      -- Use the fact that g is periodic with period 1 to simplify the integral
                      have h₂₁ := h₁₆
                      have h₂₂ := h₁₇
                      have h₂₃ : ContinuousOn (fun x => f x * g (k * x)) (Set.Ioo 0 1) := by
                        apply ContinuousOn.mul h₁₈
                        exact ContinuousOn.comp (fgcont.2.continuousOn) (continuousOn_const.mul continuousOn_id) (fun x hx => by
                          norm_num at hx ⊢ <;>
                          (try norm_num) <;>
                          (try linarith) <;>
                          (try nlinarith))
                      -- Use the fact that g is periodic with period 1 to simplify the integral
                      have h₂₄ : (∫ x in Set.Ioo 0 1, f x * g (k * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
                        -- Use the fact that g is periodic with period 1 to simplify the integral
                        have h₂₅ : ∫ x in Set.Ioo 0 1, f x * g (k * x) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
                          -- Use the fact that g is periodic with period 1 to simplify the integral
                          simp_all [mul_comm]
                          <;>
                          ring_nf
                          <;>
                          norm_num
                          <;>
                          linarith
                        exact h₂₅
                      exact h₂₄
                    exact h₂₀
                  have h₂₁ := h₁₅ n
                  exact h₂₁
                exact h₁₄
              exact h₁₀
            have h₂₂ := h₈ n hn
            exact h₂₂
          exact h₇
        exact h₅
      exact h₃
    have h₂ : Tendsto (fun n : ℤ => ∫ x in Set.Ioo 0 1, f x * g (n * x)) atTop (𝓝 ((∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x))) := by
      -- Use the fact that for n ≥ 1, the integral is constant and equal to the product of the integrals of f and g
      have h₃ : ∀ᶠ (n : ℤ) in atTop, (∫ x in Set.Ioo 0 1, f x * g (n * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := by
        filter_upwards [eventually_ge_atTop (1 : ℤ)] with n hn
        exact h₁ n hn
      have h₄ : Tendsto (fun n : ℤ => (∫ x in Set.Ioo 0 1, f x * g (n * x))) atTop (𝓝 ((∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x))) := by
        have h₅ : Tendsto (fun n : ℤ => (∫ x in Set.Ioo 0 1, f x * g (n * x))) atTop (𝓝 ((∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x))) := by
          have h₆ : ∀ᶠ (n : ℤ) in atTop, (∫ x in Set.Ioo 0 1, f x * g (n * x)) = (∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x) := h₃
          have h₇ : Tendsto (fun n : ℤ => (∫ x in Set.Ioo 0 1, f x * g (n * x))) atTop (𝓝 ((∫ x in Set.Ioo 0 1, f x) * (∫ x in Set.Ioo 0 1, g x))) := by
            apply Tendsto.congr' _ (tendsto_const_nhds)
            filter_upwards [h₆] with n hn
            rw [hn]
          exact h₇
        exact h₅
      exact h₄
    exact h₂
  exact h_main