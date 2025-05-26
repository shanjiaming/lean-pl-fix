theorem h₁ (f : (↑(Set.Ioi 1) : Type) → (↑(Set.Ioi 1) : Type)) (hf :  ∀ (x y : (↑(Set.Ioi 1) : Type)),    (↑x : ℝ) ^ 2 ≤ (↑y : ℝ) ∧ (↑y : ℝ) ≤ (↑x : ℝ) ^ 3 →      (↑(f x) : ℝ) ^ 2 ≤ (↑(f y) : ℝ) ∧ (↑(f y) : ℝ) ≤ (↑(f x) : ℝ) ^ 3) : ∃ c > 0, ∀ (x : (↑(Set.Ioi 1) : Type)), (↑(f x) : ℝ) = (↑x : ℝ) ^ c :=
  by
  --  use 1
  --  constructor
  --  · norm_num
  --  · intro x
    have h₂ := hf x x
    have h₃ : ((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f x ∧ f x ≤ (f x : ℝ) ^ 3) := by sorry
    have h₄ : (1 : ℝ) < (x : ℝ) := x.2
    have h₅ : (x : ℝ) ^ 2 ≤ (x : ℝ) → False := by sorry
    have h₆ : (x : ℝ) ≤ (x : ℝ) ^ 3 → False := by sorry
    have h₇ : ¬((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3) := by sorry
    have h₈ : ((f x : ℝ) ^ 2 ≤ f x ∧ f x ≤ (f x : ℝ) ^ 3) := by sorry
    have h₉ : (f x : ℝ) > 1 := by sorry
    have h₁₀ : (f x : ℝ) ^ 2 ≤ f x := h₈.1
    have h₁₁ : f x ≤ (f x : ℝ) ^ 3 := h₈.2
    have h₁₂ : (f x : ℝ) = (x : ℝ) ^ 1 := by sorry
  --    simpa using h₁₂
  hole