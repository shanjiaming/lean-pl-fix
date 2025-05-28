theorem h₁₁ (IsZigZag : {k : ℕ} → (Fin k → ℝ) → Prop) (IsZigZag_def :  ∀ (k : ℕ) [inst : NeZero k] (y : Fin k → ℝ),    IsZigZag y ↔      k = 1 ∨        (∀ (i : ℕ), i + 1 < k → y (↑i + 1) ≠ y ↑i) ∧          ∀ (i : ℕ), i + 2 < k → (y (↑i + 2) < y (↑i + 1) ↔ y ↑i < y (↑i + 1))) (n : ℕ) (hn : 2 ≤ n) (a : (Fin n → ↑(Icc 0 1)) → ℕ) (ha : ∀ (x : Fin n → ↑(Icc 0 1)), IsGreatest {k | ∃ i, IsZigZag (Subtype.val ∘ x ∘ ⇑i)} (a x)) (h₂ : n ≥ 2) (h₃ : ∀ (x : Fin n → ↑(Icc 0 1)), IsGreatest {k | ∃ i, IsZigZag (Subtype.val ∘ x ∘ ⇑i)} (a x)) (h₄ h₅ : n ≥ 2) (h : ¬False) (h₇ : n ≥ 2) (i : Fin n) : 1 ∈ Icc 0 1 :=
  by
  have h₁₂ :
    IsZigZag
      ((↑) ∘
        (fun i => ⟨1, by norm_num <;> (try norm_num) <;> (try linarith) <;> (try omega)⟩ : Fin n → Icc (0 : ℝ) 1) ∘
          (by refine' (Fin.castLE _) <;> omega)) := by sorry
  exact h₁₂