theorem h₃ (S : Set ℝ) (hS : ∀ a ∈ S, ∀ b ∈ S, a * b ∈ S) (T U : Set ℝ) (hsub : T ⊆ S ∧ U ⊆ S) (hunion : T ∪ U = S) (hdisj : T ∩ U = ∅) (hT3 : ∀ a ∈ T, ∀ b ∈ T, ∀ c ∈ T, a * b * c ∈ T) (hU3 : ∀ a ∈ U, ∀ b ∈ U, ∀ c ∈ U, a * b * c ∈ U) (h₀ : ¬∀ a ∈ T, ∀ b ∈ T, a * b ∈ T) (u : ℝ) (hu : u ∈ U) (v : ℝ) (hv : v ∈ U) (h : u * v ∉ U) : u * v ∈ S := by
  have h₄ : u ∈ S := hsub.2 hu
  have h₅ : v ∈ S := hsub.2 hv
  exact hS u h₄ v h₅