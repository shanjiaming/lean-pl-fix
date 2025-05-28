theorem h₂ (S : Set ℚ) (hS : S = univ \ {-1, 0, 1}) (f : ↑S → ↑S) (hf : ∀ (x : ↑S), ↑(f x) = ↑x - 1 / ↑x) : ∀ (x : ↑S), ∃ n ∈ Ici 1, x ∉ f^[n] '' univ :=
  by
  --  intro x
  --  by_contra! h
  have h₃ := h 1
  have h₄ := h 2
  have h₅ : x ∈ f^[1] '' (univ : Set S) := by sorry
  have h₆ : x ∈ f^[2] '' (univ : Set S) := by sorry
  obtain ⟨y₁, _, hy₁⟩ := h₅
  obtain ⟨y₂, _, hy₂⟩ := h₆
  have h₇ : f y₁ = x := by sorry
  have h₈ : f (f y₂) = x := by sorry
  have h₉ : f y₁ = f (f y₂) := by sorry
  have h₁₀ : (f y₁ : ℚ) = (f (f y₂) : ℚ) := by sorry
  have h₁₁ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ) := by sorry
  have h₁₂ : (y₁ : ℚ) = (f y₂ : ℚ) := by sorry
  have h₁₃ : (y₁ : ℚ) = (f y₂ : ℚ) := h₁₂
  have h₁₄ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ) := by sorry
  have h₁₅ : (f y₁ : ℚ) = (f (f y₂) : ℚ) := by sorry
  have h₁₆ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ) := by sorry
  have h₁₇ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ) := by sorry
  have h₁₈ : (y₁ : ℚ) = (f y₂ : ℚ) := by sorry
  have h₁₉ : (y₁ : ℚ) = (f y₂ : ℚ) := h₁₈
  have h₂₀ : (f y₂ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ) := by sorry
  have h₂₁ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ) := by sorry
  have h₂₂ : (x : ℚ) = (f y₁ : ℚ) := by sorry
  have h₂₃ : (x : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ) := by sorry
  have h₂₄ : (x : ℚ) = (f y₂ : ℚ) := by sorry
  have h₂₅ : (x : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ) := by sorry
  have h₂₆ : (y₁ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ) := by sorry
  have h₂₇ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ) := by sorry
  have h₂₈ : (f y₁ : ℚ) = (f y₂ : ℚ) := by sorry
  have h₂₉ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ) := by sorry
  have h₃₀ : (f y₂ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ) := by sorry
  have h₃₁ : (x : ℚ) - 1 / (x : ℚ) = (x : ℚ) - 1 / (x : ℚ) := by sorry
  have h₃₂ : 1 / (x : ℚ) = 0 := by sorry
  have h₃₃ : False :=
    by
    have h₃₄ : (x : ℚ) ≠ 0 := by
      intro h₃₅
      have h₃₆ := x.2
      simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₃₆ ⊢ <;> aesop
    have h₃₅ : 1 / (x : ℚ) ≠ 0 := by positivity
    have h₃₆ : 1 / (x : ℚ) = 0 := h₃₂
    contradiction
  exact h₃₃
  hole