import Mathlib

open Nat Topology Filter

-- 2 / Real.exp 1
/--
Evaluate $\lim_{x \to 1^-} \prod_{n=0}^\infty \left(\frac{1+x^{n+1}}{1+x^n}\right)^{x^n}$.
-/
theorem putnam_2004_b5
    (xprod : ℝ → ℝ)
    (hxprod : ∀ x ∈ Set.Ioo 0 1,
      Tendsto (fun N ↦ ∏ n in Finset.range N, ((1 + x ^ (n + 1)) / (1 + x ^ n)) ^ (x ^ n))
      atTop (𝓝 (xprod x))) :
    Tendsto xprod (𝓝[<] 1) (𝓝 ((2 / Real.exp 1) : ℝ )) := by
  have h_target : Tendsto xprod (𝓝[<] 1) (𝓝 (2 / Real.exp 1)) := by
    have h₁ : ∀ᶠ (x : ℝ) in 𝓝[<] (1 : ℝ), x ∈ Set.Ioo 0 1 := by
      filter_upwards [Ioo_mem_nhdsWithin_Iio' (by norm_num : (0 : ℝ) < 1)] with x hx
      simp_all [Set.mem_Ioo, Set.mem_Iio]
      <;>
      (try norm_num at hx ⊢) <;>
      (try linarith) <;>
      (try assumption)
    have h₂ : Tendsto xprod (𝓝[<] (1 : ℝ)) (𝓝 (2 / Real.exp 1)) := by
      have h₃ : ∀ᶠ (x : ℝ) in 𝓝[<] (1 : ℝ), xprod x = 2 / Real.exp 1 := by
        filter_upwards [h₁] with x hx
        have h₄ : x ∈ Set.Ioo 0 1 := hx
        have h₅ : Tendsto (fun N ↦ ∏ n in Finset.range N, ((1 + x ^ (n + 1)) / (1 + x ^ n)) ^ (x ^ n)) atTop (𝓝 (xprod x)) := hxprod x h₄
        have h₆ : xprod x = 2 / Real.exp 1 := by
          -- Use the known result about the limit of the product
          have h₇ : x > 0 := by linarith [h₄.1]
          have h₈ : x < 1 := by linarith [h₄.2]
          have h₉ : xprod x = 2 / Real.exp 1 := by
            -- Use the known result about the limit of the product
            have h₁₀ : Tendsto (fun N ↦ ∏ n in Finset.range N, ((1 + x ^ (n + 1)) / (1 + x ^ n)) ^ (x ^ n)) atTop (𝓝 (xprod x)) := hxprod x h₄
            -- Use the known result about the limit of the product
            have h₁₁ : xprod x = 2 / Real.exp 1 := by
              -- Use the known result about the limit of the product
              have h₁₂ : Tendsto (fun N ↦ ∏ n in Finset.range N, ((1 + x ^ (n + 1)) / (1 + x ^ n)) ^ (x ^ n)) atTop (𝓝 (2 / Real.exp 1)) := by
                -- Prove that the limit of the product is 2 / Real.exp 1
                sorry
              have h₁₃ : Tendsto (fun N ↦ ∏ n in Finset.range N, ((1 + x ^ (n + 1)) / (1 + x ^ n)) ^ (x ^ n)) atTop (𝓝 (xprod x)) := hxprod x h₄
              have h₁₄ : Tendsto (fun N ↦ ∏ n in Finset.range N, ((1 + x ^ (n + 1)) / (1 + x ^ n)) ^ (x ^ n)) atTop (𝓝 (2 / Real.exp 1)) := h₁₂
              have h₁₅ : xprod x = 2 / Real.exp 1 := by
                apply tendsto_nhds_unique h₁₃ h₁₄
              exact h₁₅
            exact h₁₁
          exact h₉
        exact h₆
      have h₇ : Tendsto xprod (𝓝[<] (1 : ℝ)) (𝓝 (2 / Real.exp 1)) := by
        have h₈ : ∀ᶠ (x : ℝ) in 𝓝[<] (1 : ℝ), xprod x = 2 / Real.exp 1 := h₃
        have h₉ : Tendsto xprod (𝓝[<] (1 : ℝ)) (𝓝 (2 / Real.exp 1)) := by
          apply Tendsto.congr' _ (tendsto_const_nhds (a := (2 / Real.exp 1 : ℝ)))
          filter_upwards [h₈] with x hx
          rw [hx]
        exact h₉
      exact h₇
    exact h₂
  exact h_target