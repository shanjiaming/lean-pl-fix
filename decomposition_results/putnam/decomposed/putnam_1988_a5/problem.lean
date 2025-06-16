theorem putnam_1988_a5
: (∃ f : ℝ → ℝ, (∀ x > 0, f (f x) = 6 * x - f x ∧ f x > 0) ∧ (∀ g : ℝ → ℝ, (∀ x > 0, g (g x) = 6 * x - g x ∧ g x > 0) → (∀ x > 0, f x = g x))) := by
  have h_main : ∃ (f : ℝ → ℝ), (∀ x > 0, f (f x) = 6 * x - f x ∧ f x > 0) ∧ (∀ (g : ℝ → ℝ), (∀ x > 0, g (g x) = 6 * x - g x ∧ g x > 0) → (∀ x > 0, f x = g x)) := by
    use fun x => 2 * x
    constructor
    · -- Prove that f(f(x)) = 6x - f(x) and f(x) > 0 for all x > 0
      intro x hx
      constructor
      · -- Prove f(f(x)) = 6x - f(x)
        have h₁ : (2 : ℝ) * (2 * x) = 6 * x - 2 * x := by
          ring
        exact h₁
      · -- Prove f(x) > 0
        have h₂ : (2 : ℝ) * x > 0 := by linarith
        exact h₂
    · -- Prove uniqueness
      intro g hg x hx
      have h₁ : g x = 2 * x := by
        have h₂ : ∀ (n : ℕ) (y : ℝ), y > 0 → g y > 0 := by
          intro n y hy
          have h₃ : g y > 0 := (hg y hy).2
          exact h₃
        have h₃ : g (g x) = 6 * x - g x := (hg x hx).1
        have h₄ : g x > 0 := (hg x hx).2
        have h₅ : g (g x) > 0 := (hg (g x) h₄).2
        have h₆ : g (6 * x - g x) = 7 * g x - 6 * x := by
          have h₇ : g (g x) = 6 * x - g x := (hg x hx).1
          have h₈ : g (g (g x)) = 6 * g x - g (g x) := (hg (g x) h₄).1
          have h₉ : g (6 * x - g x) = 7 * g x - 6 * x := by
            rw [h₇] at h₈
            have h₁₀ : g (6 * x - g x) = 7 * g x - 6 * x := by
              linarith
            exact h₁₀
          exact h₉
        have h₇ : g x = 2 * x := by
          by_contra h
          have h₈ : g x ≠ 2 * x := h
          have h₉ : g (g x) = 6 * x - g x := (hg x hx).1
          have h₁₀ : g (6 * x - g x) = 7 * g x - 6 * x := h₆
          have h₁₁ : g x > 0 := (hg x hx).2
          have h₁₂ : g (g x) > 0 := (hg (g x) h₄).2
          have h₁₃ : 6 * x - g x > 0 := by
            by_contra h₁₄
            have h₁₅ : 6 * x - g x ≤ 0 := by linarith
            have h₁₆ : g (6 * x - g x) > 0 := (hg (6 * x - g x) (by linarith)).2
            have h₁₇ : g (6 * x - g x) = 7 * g x - 6 * x := h₆
            have h₁₈ : 7 * g x - 6 * x > 0 := by linarith
            have h₁₉ : 6 * x - g x ≤ 0 := by linarith
            nlinarith
          have h₂₀ : g (6 * x - g x) > 0 := (hg (6 * x - g x) h₁₃).2
          have h₂₁ : g (6 * x - g x) = 7 * g x - 6 * x := h₆
          have h₂₂ : 7 * g x - 6 * x > 0 := by linarith
          have h₂₃ : g (7 * g x - 6 * x) = 6 * (6 * x - g x) - g (7 * g x - 6 * x) := by
            have h₂₄ : g (g (6 * x - g x)) = 6 * (6 * x - g x) - g (6 * x - g x) := (hg (6 * x - g x) h₁₃).1
            have h₂₅ : g (g (6 * x - g x)) = g (7 * g x - 6 * x) := by
              rw [h₆] at *
              <;> ring_nf at *
              <;> linarith
            rw [h₂₅] at h₂₄
            linarith
          have h₂₄ : g (7 * g x - 6 * x) > 0 := (hg (7 * g x - 6 * x) (by linarith)).2
          have h₂₅ : g (7 * g x - 6 * x) = 6 * (6 * x - g x) - g (7 * g x - 6 * x) := h₂₃
          have h₂₆ : g (7 * g x - 6 * x) = 3 * (6 * x - g x) := by linarith
          have h₂₇ : g (7 * g x - 6 * x) > 0 := h₂₄
          have h₂₈ : 3 * (6 * x - g x) > 0 := by linarith
          have h₂₉ : 6 * x - g x > 0 := by linarith
          have h₃₀ : g (6 * x - g x) = 7 * g x - 6 * x := h₆
          have h₃₁ : g (7 * g x - 6 * x) = 6 * (6 * x - g x) - g (7 * g x - 6 * x) := h₂₃
          have h₃₂ : g (7 * g x - 6 * x) = 3 * (6 * x - g x) := by linarith
          have h₃₃ : g (6 * x - g x) = 7 * g x - 6 * x := h₆
          have h₃₄ : g x > 0 := h₁₁
          have h₃₅ : g (g x) > 0 := h₁₂
          have h₃₆ : 6 * x - g x > 0 := h₂₉
          have h₃₇ : g (6 * x - g x) > 0 := h₂₀
          have h₃₈ : 7 * g x - 6 * x > 0 := h₂₂
          have h₃₉ : g (7 * g x - 6 * x) > 0 := h₂₄
          -- Use the above inequalities to derive a contradiction
          nlinarith [sq_pos_of_ne_zero (sub_ne_zero_of_ne h₈), sq_nonneg (g x - 2 * x)]
        exact h₇
      -- Prove that f(x) = g(x) for all x > 0
      rw [h₁]
      <;> ring
      <;> linarith
  exact h_main