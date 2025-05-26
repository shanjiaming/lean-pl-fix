theorem putnam_2016_b5 (f : Set.Ioi (1 : ℝ) → Set.Ioi (1 : ℝ)) :
  f ∈
      (({f : Set.Ioi (1 : ℝ) → Set.Ioi (1 : ℝ) | ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c}) :
        Set (Set.Ioi (1 : ℝ) → Set.Ioi (1 : ℝ))) ↔
    (∀ x y : Set.Ioi (1 : ℝ), ((x : ℝ) ^ 2 ≤ y ∧ y ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f y ∧ f y ≤ (f x : ℝ) ^ 3)):=
  by
  --  constructor
  --  · intro hf
    have h_forward :
      ∀ x y : Set.Ioi (1 : ℝ), ((x : ℝ) ^ 2 ≤ y ∧ y ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f y ∧ f y ≤ (f x : ℝ) ^ 3) := by sorry
  --    exact h_forward
  --  · intro hf
    have h_backward : ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c:=
      by
      have h₁ : ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c:=
        by
        --  use 1
        --  constructor
        --  · norm_num
        --  · intro x
          have h₂ := hf x x
          have h₃ : ((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f x ∧ f x ≤ (f x : ℝ) ^ 3):=
            by
            --  intro h
            --  exact h₂ h
            hole
          have h₄ : (1 : ℝ) < (x : ℝ) := x.2
          have h₅ : (x : ℝ) ^ 2 ≤ (x : ℝ) → False:= by
            --  intro h
            --  nlinarith
            hole
          have h₆ : (x : ℝ) ≤ (x : ℝ) ^ 3 → False:= by
            --  intro h
            --  nlinarith [sq_nonneg ((x : ℝ) - 1)]
            hole
          have h₇ : ¬((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3):=
            by
            --  intro h
            --  exact h₅ h.1
            hole
          have h₈ : ((f x : ℝ) ^ 2 ≤ f x ∧ f x ≤ (f x : ℝ) ^ 3):=
            by
            --  by_cases h₉ : ((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3)
            --  · exfalso
            --    exact h₇ h₉
            --  · exfalso
            --    exact h₇ ⟨by nlinarith [sq_nonneg ((x : ℝ) - 1)], by nlinarith [sq_nonneg ((x : ℝ) - 1)]⟩
            hole
          have h₉ : (f x : ℝ) > 1:= by -- exact (Set.mem_Ioi.mp (f x).2)
            hole
          have h₁₀ : (f x : ℝ) ^ 2 ≤ f x := h₈.1
          have h₁₁ : f x ≤ (f x : ℝ) ^ 3 := h₈.2
          have h₁₂ : (f x : ℝ) = (x : ℝ) ^ 1:=
            by
            have h₁₃ : (f x : ℝ) > 1:= by -- exact (Set.mem_Ioi.mp (f x).2)
              linarith
            have h₁₄ : (f x : ℝ) ^ 2 ≤ f x := h₈.1
            have h₁₅ : f x ≤ (f x : ℝ) ^ 3 := h₈.2
            have h₁₆ : (f x : ℝ) = (x : ℝ) ^ 1:= by -- nlinarith [sq_nonneg ((f x : ℝ) - 1), sq_nonneg ((x : ℝ) - 1)]
              nlinarith
            --  exact h₁₆
            linarith
        --    simpa using h₁₂
        hole
      --  exact h₁
      hole
  --    simpa using h_backward
  hole