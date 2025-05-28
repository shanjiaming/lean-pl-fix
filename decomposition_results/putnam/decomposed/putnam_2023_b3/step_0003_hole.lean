theorem h₆ (IsZigZag : {k : ℕ} → (Fin k → ℝ) → Prop) (IsZigZag_def :  ∀ (k : ℕ) [inst : NeZero k] (y : Fin k → ℝ),    IsZigZag y ↔      k = 1 ∨        (∀ (i : ℕ), i + 1 < k → y (↑i + 1) ≠ y ↑i) ∧          ∀ (i : ℕ), i + 2 < k → (y (↑i + 2) < y (↑i + 1) ↔ y ↑i < y (↑i + 1))) (n : ℕ) (hn : 2 ≤ n) (a : (Fin n → ↑(Icc 0 1)) → ℕ) (ha : ∀ (x : Fin n → ↑(Icc 0 1)), IsGreatest {k | ∃ i, IsZigZag (Subtype.val ∘ x ∘ ⇑i)} (a x)) (h₂ : n ≥ 2) (h₃ : ∀ (x : Fin n → ↑(Icc 0 1)), IsGreatest {k | ∃ i, IsZigZag (Subtype.val ∘ x ∘ ⇑i)} (a x)) (h₄ h₅ : n ≥ 2) : False := by
  --  by_contra h
  have h₇ : n ≥ 2 := hn
  have h₈ : ∃ (x : Fin n → Icc (0 : ℝ) 1), a x > (2 * n + 2 : ℝ) / 3 := by sorry
  --  obtain ⟨x, hx⟩ := h₈
  have h₉ : a x > (2 * n + 2 : ℝ) / 3 := hx
  have h₁₀ : False := by sorry
  exact h₁₀
  hole