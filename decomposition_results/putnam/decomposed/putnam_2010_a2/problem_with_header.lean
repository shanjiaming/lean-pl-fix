import Mathlib

-- {f : ℝ → ℝ | ∃ c d : ℝ, ∀ x : ℝ, f x = c*x + d}
/--
Find all differentiable functions $f:\mathbb{R} \to \mathbb{R}$ such that
\[
f'(x) = \frac{f(x+n)-f(x)}{n}
\]
for all real numbers $x$ and all positive integers $n$.
-/
theorem putnam_2010_a2
: {f : ℝ → ℝ | Differentiable ℝ f ∧
∀ x : ℝ, ∀ n : ℤ, n > 0 → deriv f x = (f (x + n) - f x)/n} = (({f : ℝ → ℝ | ∃ c d : ℝ, ∀ x : ℝ, f x = c*x + d}) : Set (ℝ → ℝ) ) := by
  have h_subset₁ : {f : ℝ → ℝ | Differentiable ℝ f ∧ ∀ x : ℝ, ∀ n : ℤ, n > 0 → deriv f x = (f (x + n) - f x)/n} ⊆ {f : ℝ → ℝ | ∃ c d : ℝ, ∀ x : ℝ, f x = c*x + d} := by
    intro f hf
    have h₁ : Differentiable ℝ f := hf.1
    have h₂ : ∀ x : ℝ, ∀ n : ℤ, n > 0 → deriv f x = (f (x + n) - f x)/n := hf.2
    have h₃ : ∃ c d : ℝ, ∀ x : ℝ, f x = c * x + d := by
      -- Use the fact that f is differentiable and the given condition to show f is affine linear
      use (deriv f 0), (f 0 - deriv f 0 * 0)
      intro x
      have h₄ : deriv f x = deriv f 0 := by
        -- Show that the derivative is constant
        have h₅ : deriv (deriv f) = 0 := by
          -- Prove that the second derivative is zero
          have h₅₁ : deriv (deriv f) = 0 := by
            -- Use the fact that the derivative is periodic to show it is constant
            have h₅₂ : ∀ x : ℝ, deriv f (x + 1) = deriv f x := by
              intro x
              have h₅₃ := h₂ x 1 (by norm_num)
              have h₅₄ := h₂ (x + 1) 1 (by norm_num)
              have h₅₅ : deriv f x = (f (x + 1) - f x) / 1 := by simpa using h₅₃
              have h₅₆ : deriv f (x + 1) = (f (x + 1 + 1) - f (x + 1)) / 1 := by simpa using h₅₄
              have h₅₇ : f (x + 1 + 1) = f (x + 1) + deriv f (x + 1) := by
                have h₅₈ := h₂ (x + 1) 1 (by norm_num)
                have h₅₉ : deriv f (x + 1) = (f (x + 1 + 1) - f (x + 1)) / 1 := by simpa using h₅₈
                linarith
              have h₅₈ : f (x + 1) = f x + deriv f x := by
                have h₅₉ := h₂ x 1 (by norm_num)
                have h₅₁₀ : deriv f x = (f (x + 1) - f x) / 1 := by simpa using h₅₉
                linarith
              simp [h₅₇, h₅₈] at h₅₆ h₅₅ ⊢
              <;> ring_nf at h₅₆ h₅₅ ⊢ <;> linarith
            have h₅₃ : deriv (deriv f) = 0 := by
              -- Use the fact that the derivative is periodic to show it is constant
              apply deriv_eq_zero_of_eventually_const
              filter_upwards [isOpen_Iio.mem_nhds (by norm_num : (0 : ℝ) < 1)] with x hx
              have h₅₄ := h₅₂ x
              have h₅₅ := h₅₂ (x + 1)
              have h₅₆ := h₅₂ (x - 1)
              simp at h₅₄ h₅₅ h₅₆ ⊢
              <;> linarith
            exact h₅₃
          exact h₅₁
        have h₅₂ : deriv (deriv f) = 0 := h₅
        have h₅₃ : deriv f x = deriv f 0 := by
          -- Use the fact that the second derivative is zero to show the derivative is constant
          have h₅₄ : deriv (deriv f) = 0 := h₅₂
          have h₅₅ : deriv f x = deriv f 0 := by
            -- Use the fact that the second derivative is zero to show the derivative is constant
            have h₅₆ : deriv f = fun x => deriv f 0 := by
              funext x
              have h₅₇ : deriv f x = deriv f 0 := by
                -- Use the fact that the second derivative is zero to show the derivative is constant
                have h₅₈ : deriv (deriv f) = 0 := h₅₄
                have h₅₉ : deriv f = fun x => deriv f 0 := by
                  -- Use the fact that the second derivative is zero to show the derivative is constant
                  have h₅₁₀ : deriv (deriv f) = 0 := h₅₈
                  have h₅₁₁ : deriv f = fun x => deriv f 0 := by
                    -- Use the fact that the second derivative is zero to show the derivative is constant
                    apply funext
                    intro x
                    have h₅₁₂ : deriv (deriv f) = 0 := h₅₁₀
                    have h₅₁₃ : deriv f x = deriv f 0 := by
                      -- Use the fact that the second derivative is zero to show the derivative is constant
                      have h₅₁₄ : deriv f x = deriv f 0 := by
                        -- Use the fact that the second derivative is zero to show the derivative is constant
                        have h₅₁₅ : deriv f x = deriv f 0 := by
                          -- Use the fact that the second derivative is zero to show the derivative is constant
                          apply?
                        exact h₅₁₅
                      exact h₅₁₄
                    exact h₅₁₃
                  exact h₅₁₁
                have h₅₁₀ : deriv f x = deriv f 0 := by
                  -- Use the fact that the second derivative is zero to show the derivative is constant
                  have h₅₁₁ : deriv f = fun x => deriv f 0 := h₅₉
                  have h₅₁₂ : deriv f x = deriv f 0 := by
                    -- Use the fact that the second derivative is zero to show the derivative is constant
                    rw [h₅₁₁]
                    <;> simp
                  exact h₅₁₂
                exact h₅₁₀
              exact h₅₇
            rw [h₅₆]
            <;> simp
          exact h₅₅
        exact h₅₃
      have h₅ : f x = (deriv f 0) * x + (f 0 - deriv f 0 * 0) := by
        have h₅₁ : f x = (deriv f 0) * x + (f 0 - deriv f 0 * 0) := by
          have h₅₂ : deriv f x = deriv f 0 := h₄
          have h₅₃ : f x = (deriv f 0) * x + (f 0 - deriv f 0 * 0) := by
            -- Use the fact that the derivative is constant to show f is affine linear
            have h₅₄ : f x = (deriv f 0) * x + (f 0 - deriv f 0 * 0) := by
              -- Use the fact that the derivative is constant to show f is affine linear
              have h₅₅ : ∀ n : ℤ, n > 0 → deriv f x = (f (x + n) - f x) / n := by
                intro n hn
                exact h₂ x n hn
              have h₅₆ : deriv f x = deriv f 0 := h₄
              have h₅₇ : deriv f 0 = deriv f 0 := rfl
              have h₅₈ : f x = (deriv f 0) * x + (f 0 - deriv f 0 * 0) := by
                -- Use the fact that the derivative is constant to show f is affine linear
                have h₅₉ := h₂ 0 1 (by norm_num)
                have h₅₁₀ := h₂ 1 1 (by norm_num)
                have h₅₁₁ := h₂ (-1 : ℝ) 1 (by norm_num)
                have h₅₁₂ := h₂ 0 2 (by norm_num)
                have h₅₁₃ := h₂ 1 2 (by norm_num)
                have h₅₁₄ := h₂ (-1 : ℝ) 2 (by norm_num)
                have h₅₁₅ := h₂ x 1 (by norm_num)
                have h₅₁₆ := h₂ (x + 1 : ℝ) 1 (by norm_num)
                have h₅₁₇ := h₂ (x - 1 : ℝ) 1 (by norm_num)
                have h₅₁₈ := h₂ x 2 (by norm_num)
                have h₅₁₉ := h₂ (x + 1 : ℝ) 2 (by norm_num)
                have h₅₂₀ := h₂ (x - 1 : ℝ) 2 (by norm_num)
                norm_num at h₅₉ h₅₁₀ h₅₁₁ h₅₁₂ h₅₁₃ h₅₁₄ h₅₁₅ h₅₁₆ h₅₁₇ h₅₁₈ h₅₁₉ h₅₂₀ ⊢
                <;>
                (try ring_nf at h₅₉ h₅₁₀ h₅₁₁ h₅₁₂ h₅₁₃ h₅₁₄ h₅₁₅ h₅₁₆ h₅₁₇ h₅₁₈ h₅₁₉ h₅₂₀ ⊢) <;>
                (try norm_num at h₅₉ h₅₁₀ h₅₁₁ h₅₁₂ h₅₁₃ h₅₁₄ h₅₁₅ h₅₁₆ h₅₁₇ h₅₁₈ h₅₁₉ h₅₂₀ ⊢) <;>
                (try linarith) <;>
                (try nlinarith) <;>
                (try
                  {
                    have h₅₂₁ := h₂ 0 3 (by norm_num)
                    have h₅₂₂ := h₂ 1 3 (by norm_num)
                    have h₅₂₃ := h₂ (-1 : ℝ) 3 (by norm_num)
                    norm_num at h₅₂₁ h₅₂₂ h₅₂₃ ⊢
                    <;> linarith
                  }) <;>
                (try
                  {
                    have h₅₂₁ := h₂ 0 4 (by norm_num)
                    have h₅₂₂ := h₂ 1 4 (by norm_num)
                    have h₅₂₃ := h₂ (-1 : ℝ) 4 (by norm_num)
                    norm_num at h₅₂₁ h₅₂₂ h₅₂₃ ⊢
                    <;> linarith
                  }) <;>
                (try
                  {
                    have h₅₂₁ := h₂ 0 5 (by norm_num)
                    have h₅₂₂ := h₂ 1 5 (by norm_num)
                    have h₅₂₃ := h₂ (-1 : ℝ) 5 (by norm_num)
                    norm_num at h₅₂₁ h₅₂₂ h₅₂₃ ⊢
                    <;> linarith
                  })
              exact h₅₈
            exact h₅₄
          exact h₅₃
        exact h₅₁
      have h₅₁ : f x = (deriv f 0) * x + (f 0 - deriv f 0 * 0) := h₅
      have h₅₂ : f x = (deriv f 0) * x + (f 0 - deriv f 0 * 0) := h₅₁
      simpa using h₅₂
    exact h₃
  
  have h_subset₂ : {f : ℝ → ℝ | ∃ c d : ℝ, ∀ x : ℝ, f x = c*x + d} ⊆ {f : ℝ → ℝ | Differentiable ℝ f ∧ ∀ x : ℝ, ∀ n : ℤ, n > 0 → deriv f x = (f (x + n) - f x)/n} := by
    intro f hf
    have h₁ : ∃ c d : ℝ, ∀ x : ℝ, f x = c * x + d := hf
    rcases h₁ with ⟨c, d, h₂⟩
    have h₃ : Differentiable ℝ f := by
      have h₄ : f = fun x => c * x + d := by
        funext x
        rw [h₂ x]
        <;> ring
      rw [h₄]
      exact differentiable_id.const_mul _ |>.add_const _
    have h₄ : ∀ x : ℝ, ∀ n : ℤ, n > 0 → deriv f x = (f (x + n) - f x) / n := by
      intro x n hn
      have h₅ : deriv f x = c := by
        have h₆ : f = fun x => c * x + d := by
          funext x
          rw [h₂ x]
          <;> ring
        rw [h₆]
        simp [deriv_add, deriv_mul, deriv_id, mul_comm]
        <;> ring
        <;> field_simp
        <;> ring
      have h₆ : (f (x + n) - f x : ℝ) / n = c := by
        have h₇ : f (x + n) = c * (x + n) + d := by
          rw [h₂ (x + n)]
          <;> ring
        have h₈ : f x = c * x + d := by
          rw [h₂ x]
          <;> ring
        rw [h₇, h₈]
        field_simp [hn.ne']
        <;> ring_nf
        <;> field_simp [hn.ne']
        <;> ring_nf
        <;> simp_all [Int.cast_add, Int.cast_mul, Int.cast_one]
        <;> field_simp [hn.ne']
        <;> ring_nf
        <;> linarith
      rw [h₅, h₆]
    exact ⟨h₃, h₄⟩
  
  have h_main : {f : ℝ → ℝ | Differentiable ℝ f ∧ ∀ x : ℝ, ∀ n : ℤ, n > 0 → deriv f x = (f (x + n) - f x)/n} = {f : ℝ → ℝ | ∃ c d : ℝ, ∀ x : ℝ, f x = c*x + d} := by
    apply Set.Subset.antisymm
    · exact h_subset₁
    · exact h_subset₂
  
  rw [h_main]
  <;> rfl