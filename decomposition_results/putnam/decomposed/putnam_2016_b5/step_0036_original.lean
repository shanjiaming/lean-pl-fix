theorem h₅ (f : ↑(Ioi 1) → ↑(Ioi 1)) (hf : ∀ (x y : ↑(Ioi 1)), ↑x ^ 2 ≤ ↑y ∧ ↑y ≤ ↑x ^ 3 → ↑(f x) ^ 2 ≤ ↑(f y) ∧ ↑(f y) ≤ ↑(f x) ^ 3) (x : ↑(Ioi 1)) (h₂ h₃ : ↑x ^ 2 ≤ ↑x ∧ ↑x ≤ ↑x ^ 3 → ↑(f x) ^ 2 ≤ ↑(f x) ∧ ↑(f x) ≤ ↑(f x) ^ 3) (h₄ : 1 < ↑x) : ↑x ^ 2 ≤ ↑x → False := by
  intro h
  nlinarith