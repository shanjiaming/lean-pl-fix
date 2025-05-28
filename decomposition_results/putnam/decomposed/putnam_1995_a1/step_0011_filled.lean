theorem h₄ (S : Set ℝ) (hS : ∀ a ∈ S, ∀ b ∈ S, a * b ∈ S) (T U : Set ℝ) (hsub : T ⊆ S ∧ U ⊆ S) (hunion : T ∪ U = S) (hdisj : T ∩ U = ∅) (hT3 : ∀ a ∈ T, ∀ b ∈ T, ∀ c ∈ T, a * b * c ∈ T) (hU3 : ∀ a ∈ U, ∀ b ∈ U, ∀ c ∈ U, a * b * c ∈ U) (h₀ : ¬∀ a ∈ T, ∀ b ∈ T, a * b ∈ T) (u : ℝ) (hu : u ∈ U) (v : ℝ) (hv : v ∈ U) (h : u * v ∉ U) (h₂ : u * v ∈ T) (a : ℝ) (ha : a ∈ T) (b : ℝ) (hb : b ∈ T) (hab : a * b ∈ U) : u * v * a * b ∈ T := by
  have h₅ : (u * v) ∈ T := h₂
  have h₆ : (u * v) * a * b ∈ T := hT3 (u * v) h₅ a ha b hb
  --  exact h₆
  simpa