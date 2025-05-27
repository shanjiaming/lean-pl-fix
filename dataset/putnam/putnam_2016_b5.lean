theorem putnam_2016_b5
  (f : Set.Ioi (1 : ℝ) → Set.Ioi (1 : ℝ)) :
  f ∈ (({f : Set.Ioi (1 : ℝ) → Set.Ioi (1 : ℝ) | ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c}) : Set (Set.Ioi (1 : ℝ) → Set.Ioi (1 : ℝ)) ) ↔
    (∀ x y : Set.Ioi (1 : ℝ), ((x : ℝ) ^ 2 ≤ y ∧ y ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f y ∧ f y ≤ (f x : ℝ) ^ 3)) := by
  constructor
  · -- Prove the forward direction: if f is a power function, then the condition holds.
    intro hf
    have h_forward : ∀ x y : Set.Ioi (1 : ℝ), ((x : ℝ) ^ 2 ≤ y ∧ y ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f y ∧ f y ≤ (f x : ℝ) ^ 3) := by
      rcases hf with ⟨c, hc, hf⟩
      intro x y hxy
      have h₁ : (f x : ℝ) = (x : ℝ) ^ c := by simpa using hf x
      have h₂ : (f y : ℝ) = (y : ℝ) ^ c := by simpa using hf y
      have h₃ : (x : ℝ) ^ 2 ≤ (y : ℝ) := hxy.1
      have h₄ : (y : ℝ) ≤ (x : ℝ) ^ 3 := hxy.2
      have h₅ : (1 : ℝ) < (x : ℝ) := by exact x.2
      have h₆ : (1 : ℝ) < (y : ℝ) := by
        have h₇ : (1 : ℝ) < (x : ℝ) := x.2
        have h₈ : (x : ℝ) ^ 2 ≤ (y : ℝ) := hxy.1
        have h₉ : (1 : ℝ) < (x : ℝ) ^ 2 := by
          have h₁₀ : (1 : ℝ) < (x : ℝ) := x.2
          nlinarith
        nlinarith
      have h₇ : (f x : ℝ) ^ 2 ≤ (f y : ℝ) := by
        rw [h₁, h₂]
        have h₈ : (0 : ℝ) < c := by linarith
        have h₉ : (0 : ℝ) < (x : ℝ) := by linarith
        have h₁₀ : (0 : ℝ) < (y : ℝ) := by linarith
        have h₁₁ : (0 : ℝ) < (x : ℝ) ^ c := by positivity
        have h₁₂ : (0 : ℝ) < (y : ℝ) ^ c := by positivity
        -- Use the fact that the function \( t \mapsto t^c \) is increasing for \( t > 0 \) and \( c > 0 \)
        have h₁₃ : (x : ℝ) ^ 2 ≤ (y : ℝ) := hxy.1
        have h₁₄ : (0 : ℝ) < (x : ℝ) ^ 2 := by positivity
        have h₁₅ : (0 : ℝ) < (y : ℝ) := by positivity
        -- Use the fact that the function \( t \mapsto t^c \) is increasing for \( t > 0 \) and \( c > 0 \)
        have h₁₆ : ((x : ℝ) ^ 2) ^ c ≤ (y : ℝ) ^ c := by
          exact Real.rpow_le_rpow (by positivity) h₁₃ (by linarith)
        have h₁₇ : ((x : ℝ) ^ 2) ^ c = (x : ℝ) ^ (2 * c) := by
          rw [← Real.rpow_nat_cast]
          rw [← Real.rpow_mul] <;> ring_nf <;> nlinarith
        have h₁₈ : (x : ℝ) ^ (2 * c) = ((x : ℝ) ^ c) ^ 2 := by
          have h₁₉ : (x : ℝ) ^ (2 * c) = ((x : ℝ) ^ c) ^ 2 := by
            have h₂₀ : (x : ℝ) ^ (2 * c) = ((x : ℝ) ^ c) ^ 2 := by
              calc
                (x : ℝ) ^ (2 * c) = (x : ℝ) ^ (c + c) := by ring_nf
                _ = (x : ℝ) ^ c * (x : ℝ) ^ c := by rw [Real.rpow_add (by positivity : (0 : ℝ) < (x : ℝ))] <;> ring_nf
                _ = ((x : ℝ) ^ c) ^ 2 := by ring
            exact h₂₀
          exact h₁₉
        rw [h₁₇, h₁₈] at h₁₆
        nlinarith
      have h₈ : (f y : ℝ) ≤ (f x : ℝ) ^ 3 := by
        rw [h₁, h₂]
        have h₉ : (0 : ℝ) < c := by linarith
        have h₁₀ : (0 : ℝ) < (x : ℝ) := by linarith
        have h₁₁ : (0 : ℝ) < (y : ℝ) := by linarith
        have h₁₂ : (0 : ℝ) < (x : ℝ) ^ c := by positivity
        have h₁₃ : (0 : ℝ) < (y : ℝ) ^ c := by positivity
        -- Use the fact that the function \( t \mapsto t^c \) is increasing for \( t > 0 \) and \( c > 0 \)
        have h₁₄ : (y : ℝ) ≤ (x : ℝ) ^ 3 := hxy.2
        have h₁₅ : (0 : ℝ) < (x : ℝ) ^ 3 := by positivity
        have h₁₆ : (0 : ℝ) < (y : ℝ) := by positivity
        -- Use the fact that the function \( t \mapsto t^c \) is increasing for \( t > 0 \) and \( c > 0 \)
        have h₁₇ : (y : ℝ) ^ c ≤ ((x : ℝ) ^ 3) ^ c := by
          exact Real.rpow_le_rpow (by positivity) h₁₄ (by linarith)
        have h₁₈ : ((x : ℝ) ^ 3) ^ c = (x : ℝ) ^ (3 * c) := by
          rw [← Real.rpow_nat_cast]
          rw [← Real.rpow_mul] <;> ring_nf <;> nlinarith
        have h₁₉ : (x : ℝ) ^ (3 * c) = ((x : ℝ) ^ c) ^ 3 := by
          have h₂₀ : (x : ℝ) ^ (3 * c) = ((x : ℝ) ^ c) ^ 3 := by
            calc
              (x : ℝ) ^ (3 * c) = (x : ℝ) ^ (c + c + c) := by ring_nf
              _ = (x : ℝ) ^ c * (x : ℝ) ^ c * (x : ℝ) ^ c := by
                rw [Real.rpow_add (by positivity : (0 : ℝ) < (x : ℝ)), Real.rpow_add (by positivity : (0 : ℝ) < (x : ℝ))]
                <;> ring_nf
              _ = ((x : ℝ) ^ c) ^ 3 := by ring
          exact h₂₀
        rw [h₁₈, h₁₉] at h₁₇
        nlinarith
      exact ⟨h₇, h₈⟩
    exact h_forward
  · -- Prove the backward direction: if the condition holds, then f is a power function.
    intro hf
    have h_backward : ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c := by
      have h₁ : ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c := by
        -- We need to find a constant c > 0 such that f(x) = x^c for all x > 1.
        -- We will use the given condition to derive the form of f.
        use 1
        constructor
        · -- Prove that 1 > 0.
          norm_num
        · -- Prove that f(x) = x^1 for all x > 1.
          intro x
          have h₂ := hf x x
          have h₃ : ((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f x ∧ f x ≤ (f x : ℝ) ^ 3) := by
            intro h
            exact h₂ h
          have h₄ : (1 : ℝ) < (x : ℝ) := x.2
          have h₅ : (x : ℝ) ^ 2 ≤ (x : ℝ) → False := by
            intro h
            nlinarith
          have h₆ : (x : ℝ) ≤ (x : ℝ) ^ 3 → False := by
            intro h
            nlinarith [sq_nonneg ((x : ℝ) - 1)]
          have h₇ : ¬((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3) := by
            intro h
            exact h₅ h.1
          have h₈ : ((f x : ℝ) ^ 2 ≤ f x ∧ f x ≤ (f x : ℝ) ^ 3) := by
            by_cases h₉ : ((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3)
            · exfalso
              exact h₇ h₉
            · exfalso
              exact h₇ ⟨by nlinarith [sq_nonneg ((x : ℝ) - 1)], by nlinarith [sq_nonneg ((x : ℝ) - 1)]⟩
          have h₉ : (f x : ℝ) > 1 := by
            exact (Set.mem_Ioi.mp (f x).2)
          have h₁₀ : (f x : ℝ) ^ 2 ≤ f x := h₈.1
          have h₁₁ : f x ≤ (f x : ℝ) ^ 3 := h₈.2
          have h₁₂ : (f x : ℝ) = (x : ℝ) ^ 1 := by
            -- Prove that f(x) = x^1 using the derived inequalities.
            have h₁₃ : (f x : ℝ) > 1 := by exact (Set.mem_Ioi.mp (f x).2)
            have h₁₄ : (f x : ℝ) ^ 2 ≤ f x := h₈.1
            have h₁₅ : f x ≤ (f x : ℝ) ^ 3 := h₈.2
            have h₁₆ : (f x : ℝ) = (x : ℝ) ^ 1 := by
              -- Use the derived inequalities to prove f(x) = x^1.
              nlinarith [sq_nonneg ((f x : ℝ) - 1), sq_nonneg ((x : ℝ) - 1)]
            exact h₁₆
          simpa using h₁₂
      exact h₁
    simpa using h_backward