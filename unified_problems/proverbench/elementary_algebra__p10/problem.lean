theorem injective_function_properties (f : ℕ → ℕ) (h_inj : ∀ x y, f x = f y → x = y) (h_def : f 1 = 2 ∧ ∀ n ≥ 2, f n = n + 2) (hf0 : f 0 = 3) : (∀ m n, f (f m + f n) = f (f m) + f n) ∧ (f 1 = 2 ∧ f 2 = 4) := by
  have h2 : f 2 = 4 := by
    have h₂ : ∀ n ≥ 2, f n = n + 2 := h_def.2
    have h₂₂ : f 2 = 2 + 2 := h₂ 2 (by norm_num)
    linarith
  have h1 : f 1 = 2 := h_def.1
  have h_main : ∀ m n, f (f m + f n) = f (f m) + f n := by
    intro m n
    have h₃ : f m ≥ 2 := by
      -- Prove that f(m) ≥ 2 for any m.
      by_cases hm : m = 0
      · rw [hm]  -- m = 0
        norm_num [hf0]  -- f(0) = 3 ≥ 2
      · by_cases hm₁ : m = 1
        · rw [hm₁]  -- m = 1
          norm_num [h1]  -- f(1) = 2 ≥ 2
        · have hm₂ : m ≥ 2 := by
            -- Prove that m ≥ 2 if m ≠ 0 and m ≠ 1.
            omega
          have h₄ : f m = m + 2 := h_def.2 m hm₂
          have h₅ : f m ≥ 2 := by linarith
          linarith
    have h₄ : f n ≥ 2 := by
      -- Prove that f(n) ≥ 2 for any n.
      by_cases hn : n = 0
      · rw [hn]  -- n = 0
        norm_num [hf0]  -- f(0) = 3 ≥ 2
      · by_cases hn₁ : n = 1
        · rw [hn₁]  -- n = 1
          norm_num [h1]  -- f(1) = 2 ≥ 2
        · have hn₂ : n ≥ 2 := by
            -- Prove that n ≥ 2 if n ≠ 0 and n ≠ 1.
            omega
          have h₅ : f n = n + 2 := h_def.2 n hn₂
          have h₆ : f n ≥ 2 := by linarith
          linarith
    have h₅ : f m + f n ≥ 2 := by linarith
    have h₆ : f (f m + f n) = (f m + f n) + 2 := by
      -- Prove that f(f(m) + f(n)) = (f(m) + f(n)) + 2.
      have h₇ : f m + f n ≥ 2 := by linarith
      have h₈ : f (f m + f n) = (f m + f n) + 2 := by
        have h₉ : ∀ k ≥ 2, f k = k + 2 := h_def.2
        have h₁₀ : f (f m + f n) = (f m + f n) + 2 := by
          have h₁₁ : f m + f n ≥ 2 := by linarith
          have h₁₂ : f (f m + f n) = (f m + f n) + 2 := h₉ (f m + f n) h₁₁
          exact h₁₂
        exact h₁₀
      exact h₈
    have h₇ : f (f m) = f m + 2 := by
      -- Prove that f(f(m)) = f(m) + 2.
      have h₈ : f m ≥ 2 := by linarith
      have h₉ : ∀ k ≥ 2, f k = k + 2 := h_def.2
      have h₁₀ : f (f m) = f m + 2 := by
        have h₁₁ : f m ≥ 2 := by linarith
        have h₁₂ : f (f m) = f m + 2 := by
          have h₁₃ : f (f m) = f m + 2 := h₉ (f m) h₁₁
          exact h₁₃
        exact h₁₂
      exact h₁₀
    calc
      f (f m + f n) = (f m + f n) + 2 := by rw [h₆]
      _ = (f m + 2) + f n := by ring
      _ = f (f m) + f n := by rw [h₇]
  refine' ⟨h_main, _⟩
  constructor
  <;> norm_num [h1, h2]
  <;> aesop