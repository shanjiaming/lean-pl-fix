theorem putnam_2001_b4 (S : Set ℚ) (hS : S = univ \ {-1, 0, 1}) (f : ↑S → ↑S) (hf : ∀ (x : ↑S), ↑(f x) = ↑x - 1 / ↑x) : ⋂ n ∈ Ici 1, f^[n] '' univ = ∅ ↔ True :=
  by
  have h₁ : ⋂ n ∈ Ici 1, (f^[n] '' (univ : Set S)) = ∅ := by sorry
  have h₂ : ⋂ n ∈ Ici 1, f^[n] '' univ = ∅ ↔ ((True) : Prop) :=
    by
    constructor
    · intro h
      trivial
    · intro h
      simpa [h₁] using h₁
  exact h₂