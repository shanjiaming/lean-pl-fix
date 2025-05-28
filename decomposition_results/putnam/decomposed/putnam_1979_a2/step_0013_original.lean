theorem h₄ (k : ℝ) (h₁ : ¬k ≥ 0) (h₂ : k < 0) (f : ℝ → ℝ) (hf_cont : Continuous f) (hf : ∀ (x : ℝ), f (f x) = k * x ^ 9) (h₃ : Function.Injective f) : StrictMono f ∨ StrictAnti f := by
  have h₅ : Continuous f := hf_cont
  have h₆ : Function.Injective f := h₃
  exact h₅.strictMono_or_strictAnti h₆