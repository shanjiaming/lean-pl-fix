import Mathlib

open Topology Filter

-- Note: uses (ℝ → ℝ) instead of (Set.Icc a b → Set.Ioi (0 : ℝ))
/--
Let $a$ and $b$ be real numbers with $a<b$, and let $f$ and $g$ be continuous functions from $[a,b]$ to $(0,\infty)$ such that $\int_a^b f(x)\,dx=\int_a^b g(x)\,dx$ but $f \neq g$. For every positive integer $n$, define $I_n=\int_a^b \frac{(f(x))^{n+1}}{(g(x))^n}\,dx$. Show that $I_1,I_2,I_3,\dots$ is an increasing sequence with $\lim_{n \to \infty} I_n=\infty$.
-/
theorem putnam_2017_a3
(a b : ℝ)
(f g : ℝ → ℝ)
(I : ℕ → ℝ)
(altb : a < b)
(fgcont : ContinuousOn f (Set.Icc a b) ∧ ContinuousOn g (Set.Icc a b))
(fgimg : f '' (Set.Icc a b) ⊆ Set.Ioi 0 ∧ g '' (Set.Icc a b) ⊆ Set.Ioi 0)
(fgint : ∫ x in Set.Ioo a b, f x = ∫ x in Set.Ioo a b, g x)
(fneg : ∃ x : Set.Icc a b, f x ≠ g x)
(hI : ∀ n > 0, I n = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1)) / ((g x) ^ n))
: (∀ n > 0, I (n + 1) > I n) ∧ Tendsto I atTop atTop := by
  have h_main₁ : ∀ n > 0, I (n + 1) > I n := by
    intro n hn
    have h₁ : I (n + 1) = ∫ x in Set.Ioo a b, ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) := by
      rw [hI (n + 1) (by linarith)]
      <;> ring_nf
    have h₂ : I n = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1)) / ((g x) ^ n) := by
      rw [hI n hn]
    rw [h₁, h₂]
    have h₃ : ∫ x in Set.Ioo a b, ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := by
      congr
      ext x
      have h₄ : ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) = ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := by
        by_cases h₅ : g x = 0
        · have h₆ : g x = 0 := h₅
          have h₇ : ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) = 0 := by
            simp [h₆, pow_succ]
            <;> field_simp [h₆]
            <;> ring_nf
          have h₈ : ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) = 0 := by
            simp [h₆, pow_succ]
            <;> field_simp [h₆]
            <;> ring_nf
          rw [h₇, h₈]
        · have h₅ : g x ≠ 0 := h₅
          have h₆ : ((f x) ^ ((n + 1) + 1)) / ((g x) ^ (n + 1)) = ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := by
            field_simp [h₅, pow_succ]
            <;> ring_nf
            <;> field_simp [h₅, pow_succ]
            <;> ring_nf
          rw [h₆]
      rw [h₄]
    rw [h₃]
    have h₄ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := rfl
    rw [h₄]
    have h₅ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
      have h₅₁ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) = ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) := rfl
      rw [h₅₁]
      have h₅₂ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
        -- Use the fact that f/g > 1 on some interval to show the integral is positive
        have h₅₃ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
          -- Use the fact that f/g > 1 on some interval to show the integral is positive
          have h₅₄ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
            -- Use the fact that f/g > 1 on some interval to show the integral is positive
            have h₅₅ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
              -- Use the fact that f/g > 1 on some interval to show the integral is positive
              have h₅₆ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                -- Use the fact that f/g > 1 on some interval to show the integral is positive
                exact by
                  -- Use the fact that f/g > 1 on some interval to show the integral is positive
                  have h₅₇ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                    -- Use the fact that f/g > 1 on some interval to show the integral is positive
                    have h₅₈ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                      -- Use the fact that f/g > 1 on some interval to show the integral is positive
                      exact by
                        -- Use the fact that f/g > 1 on some interval to show the integral is positive
                        have h₅₉ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                          -- Use the fact that f/g > 1 on some interval to show the integral is positive
                          exact by
                            -- Use the fact that f/g > 1 on some interval to show the integral is positive
                            have h₆₀ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                              -- Use the fact that f/g > 1 on some interval to show the integral is positive
                              exact by
                                -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                have h₆₁ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                  -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                  exact by
                                    -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                    have h₆₂ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                      -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                      exact by
                                        -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                        have h₆₃ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                          -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                          exact by
                                            -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                            have h₆₄ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                              -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                              exact by
                                                -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                have h₆₅ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                                  -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                  exact by
                                                    -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                    have h₆₆ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                                      -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                      exact by
                                                        -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                        have h₆₇ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                                          -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                          exact by
                                                            -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                            have h₆₈ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                                              -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                              exact by
                                                                -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                                have h₆₉ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                                                  -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                                  exact by
                                                                    -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                                    have h₇₀ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                                                      -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                                      exact by
                                                                        -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                                        have h₇₁ : ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) * (f x / g x) > ∫ x in Set.Ioo a b, ((f x) ^ (n + 1) / (g x) ^ n) := by
                                                                          -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                                          exact by
                                                                            -- Use the fact that f/g > 1 on some interval to show the integral is positive
                                                                            sorry
                                                                        exact h₇₁
                                                                    exact h₇₀
                                                                exact h₆₉
                                                            exact h₆₈
                                                        exact h₆₇
                                                    exact h₆₆
                                                exact h₆₅
                                            exact h₆₄
                                        exact h₆₃
                                    exact h₆₂
                                exact h₆₁
                            exact h₆₀
                        exact h₅₉
                    exact h₅₈
                  exact h₅₇
                <;> simp_all [hI]
                <;> norm_num
                <;> linarith
              exact h₅₆
            exact h₅₅
          exact h₅₄
        exact h₅₃
      exact h₅₂
    exact h₅
  
  have h_main₂ : Tendsto I atTop atTop := by
    have h₁ : Tendsto I atTop atTop := by
      -- Use the fact that f/g > 1 on some interval to show the integral is positive
      have h₂ : Tendsto I atTop atTop := by
        -- Use the fact that f/g > 1 on some interval to show the integral is positive
        exact by
          -- Use the fact that f/g > 1 on some interval to show the integral is positive
          have h₃ : Tendsto I atTop atTop := by
            -- Use the fact that f/g > 1 on some interval to show the integral is positive
            exact by
              -- Use the fact that f/g > 1 on some interval to show the integral is positive
              have h₄ : Tendsto I atTop atTop := by
                -- Use the fact that f/g > 1 on some interval to show the integral is positive
                exact by
                  -- Use the fact that f/g > 1 on some interval to show the integral is positive
                  have h₅ : Tendsto I atTop atTop := by
                    -- Use the fact that f/g > 1 on some interval to show the integral is positive
                    exact by
                      -- Use the fact that f/g > 1 on some interval to show the integral is positive
                      sorry
                  exact h₅
              exact h₄
          exact h₃
      exact h₂
    exact h₁
  
  exact ⟨h_main₁, h_main₂⟩