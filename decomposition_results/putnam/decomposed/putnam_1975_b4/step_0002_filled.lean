theorem h_main (P : ℝ × ℝ → Prop) (hP :  P = fun x =>    match x with    | (x, y) => x ^ 2 + y ^ 2 = 1) : ¬∃ B ⊆ setOf P, IsClosed B ∧ ∀ (x y : ℝ), P (x, y) → Xor' ((x, y) ∈ B) ((-x, -y) ∈ B) :=
  by
  --  intro h
  --  rcases h with ⟨B, hB_sub, hB_closed, hB_xor⟩
  have h₁ : (1, 0) ∈ setOf P := by sorry
  have h₂ : ∃ (p : ℝ × ℝ), p ∈ B := by sorry
  --  rcases h₂ with ⟨⟨x, y⟩, hx⟩
  have h₃ : P (x, y) := by sorry
  have h₄ := hB_xor x y h₃
  have h₅ : (x, y) ∈ B := hx
  have h₆ : Xor' ((x, y) ∈ B) ((-x, -y) ∈ B) := h₄
  have h₇ : ((-x, -y) ∈ B) → False := by sorry
  --  by_cases h₈ : ((-x, -y) ∈ B)
  --  · exfalso
  --    exact h₇ h₈
  ·
    have h₉ : ¬((-x, -y) ∈ B) := h₈
    have h₁₀ : (x, y) ∈ B := h₅
    have h₁₁ := hB_xor (-x) (-y)
    have h₁₂ : P (-x, -y) := by sorry
    have h₁₃ := h₁₁ h₁₂
  --    simp [Xor', Prod.ext_iff] at h₆ h₁₃ ⊢ <;>
  --            simp_all [hP, Real.sqrt_eq_iff_sq_eq, sq_nonneg, add_nonneg, mul_self_nonneg] <;>
  --          ring_nf at * <;>
  --        norm_num at * <;>
  --      aesop
  hole