theorem injective_function_properties (f : ℕ → ℕ) (h_inj : ∀ x y, f x = f y → x = y)
  (h_def : f 1 = 2 ∧ ∀ n ≥ 2, f n = n + 2) (hf0 : f 0 = 3) :
  (∀ m n, f (f m + f n) = f (f m) + f n) ∧ (f 1 = 2 ∧ f 2 = 4):=
  by
  have h2 : f 2 = 4:= by
    have h₂ : ∀ n ≥ 2, f n = n + 2 := h_def.2
    have h₂₂ : f 2 = 2 + 2 := h₂ 2 (by norm_num)
    --  linarith
    linarith
  have h1 : f 1 = 2 := h_def.1
  have h_main : ∀ m n, f (f m + f n) = f (f m) + f n:= by
    --  intro m n
    have h₃ : f m ≥ 2:= by
      --  by_cases hm : m = 0
      --  · rw [hm]
      --    norm_num [hf0]
      --  · by_cases hm₁ : m = 1
      --    · rw [hm₁]
      --      norm_num [h1]
        ·
          have hm₂ : m ≥ 2:= by -- omega
            omega
          have h₄ : f m = m + 2 := h_def.2 m hm₂
          have h₅ : f m ≥ 2:= by -- linarith
            linarith
      --      linarith
      hole
    have h₄ : f n ≥ 2:= by
      --  by_cases hn : n = 0
      --  · rw [hn]
      --    norm_num [hf0]
      --  · by_cases hn₁ : n = 1
      --    · rw [hn₁]
      --      norm_num [h1]
        ·
          have hn₂ : n ≥ 2:= by -- omega
            omega
          have h₅ : f n = n + 2 := h_def.2 n hn₂
          have h₆ : f n ≥ 2:= by -- linarith
            linarith
      --      linarith
      hole
    have h₅ : f m + f n ≥ 2:= by -- linarith
      linarith
    have h₆ : f (f m + f n) = (f m + f n) + 2:=
      by
      have h₇ : f m + f n ≥ 2:= by -- linarith
        linarith
      have h₈ : f (f m + f n) = (f m + f n) + 2:=
        by
        have h₉ : ∀ k ≥ 2, f k = k + 2 := h_def.2
        have h₁₀ : f (f m + f n) = (f m + f n) + 2:=
          by
          have h₁₁ : f m + f n ≥ 2:= by -- linarith
            linarith
          have h₁₂ : f (f m + f n) = (f m + f n) + 2 := h₉ (f m + f n) h₁₁
          --  exact h₁₂
          linarith
        --  exact h₁₀
        linarith
      --  exact h₈
      linarith
    have h₇ : f (f m) = f m + 2:= by
      have h₈ : f m ≥ 2:= by -- linarith
        linarith
      have h₉ : ∀ k ≥ 2, f k = k + 2 := h_def.2
      have h₁₀ : f (f m) = f m + 2:= by
        have h₁₁ : f m ≥ 2:= by -- linarith
          linarith
        have h₁₂ : f (f m) = f m + 2:= by
          have h₁₃ : f (f m) = f m + 2 := h₉ (f m) h₁₁
          --  exact h₁₃
          linarith
        --  exact h₁₂
        linarith
      --  exact h₁₀
      linarith
    --  calc
    --    f (f m + f n) = (f m + f n) + 2 := by rw [h₆]
    --    _ = (f m + 2) + f n := by ring
    --    _ = f (f m) + f n := by rw [h₇]
    hole
  --  refine' ⟨h_main, _⟩
  --  --  constructor <;> norm_num [h1, h2] <;> aesop
  hole