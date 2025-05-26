theorem putnam_1962_a2
    (P : Set ℝ → (ℝ → ℝ) → Prop)
    (P_def : ∀ s f, P s f ↔ 0 ≤ f ∧ ∀ x ∈ s, ⨍ t in Ico 0 x, f t = √(f 0 * f x)) :
    (∀ f,
      (P (Ioi 0) f → ∃ g ∈ (({f : ℝ → ℝ | ∃ a c : ℝ, a ≥ 0 ∧ f = fun x ↦ a / (1 - c * x) ^ 2}) : Set (ℝ → ℝ) ), EqOn f g (Ici 0)) ∧
      (∀ e > 0, P (Ioo 0 e) f → ∃ g ∈ (({f : ℝ → ℝ | ∃ a c : ℝ, a ≥ 0 ∧ f = fun x ↦ a / (1 - c * x) ^ 2}) : Set (ℝ → ℝ) ), EqOn f g (Ico 0 e))) ∧
    ∀ f ∈ (({f : ℝ → ℝ | ∃ a c : ℝ, a ≥ 0 ∧ f = fun x ↦ a / (1 - c * x) ^ 2}) : Set (ℝ → ℝ) ), P (Ioi 0) f ∨ (∃ e > 0, P (Ioo 0 e) f) :=
  by