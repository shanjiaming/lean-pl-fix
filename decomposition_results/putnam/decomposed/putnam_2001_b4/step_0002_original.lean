theorem h₁ (S : Set ℚ) (hS : S = univ \ {-1, 0, 1}) (f : ↑S → ↑S) (hf : ∀ (x : ↑S), ↑(f x) = ↑x - 1 / ↑x) : ⋂ n ∈ Ici 1, f^[n] '' univ = ∅ :=
  by
  have h₂ : ∀ (x : S), ∃ (n : ℕ), n ∈ Ici 1 ∧ x ∉ f^[n] '' (univ : Set S) := by sorry
  have h₃ : ⋂ n ∈ Ici 1, (f^[n] '' (univ : Set S)) = ∅ :=
    by
    apply Set.eq_empty_of_forall_not_mem
    intro x hx
    have h₄ : ∀ (n : ℕ), n ∈ Ici 1 → x ∈ f^[n] '' (univ : Set S) := by simpa using hx
    have h₅ := h₂ x
    obtain ⟨n, hn, hn'⟩ := h₅
    have h₆ := h₄ n hn
    exact hn' h₆
  exact h₃