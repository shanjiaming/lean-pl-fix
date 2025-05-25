theorem h₆ (S : Set ℝ) (hS : ∀ a ∈ S, ∀ b ∈ S, a * b ∈ S) (T U : Set ℝ) (hsub : T ⊆ S ∧ U ⊆ S) (hunion : T ∪ U = S) (hdisj : T ∩ U = ∅) (hT3 : ∀ a ∈ T, ∀ b ∈ T, ∀ c ∈ T, a * b * c ∈ T) (hU3 : ∀ a ∈ U, ∀ b ∈ U, ∀ c ∈ U, a * b * c ∈ U) (h₀ : ¬∀ a ∈ T, ∀ b ∈ T, a * b ∈ T) (u : ℝ) (hu : u ∈ U) (v : ℝ) (hv : v ∈ U) (h : u * v ∉ U) (h₂ : u * v ∈ T) (h₄ : ∀ a ∈ T, ∀ b ∈ T, a * b ∉ U) (a : ℝ) (ha : a ∈ T) (b : ℝ) (hb : b ∈ T) : a * b ∈ T ∪ U :=
  by
  have h₇ : a * b ∈ S := by sorry
  --  rw [hunion] at *
  --  exact h₇
  hole