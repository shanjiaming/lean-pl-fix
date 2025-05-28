theorem h₂ (k : ℕ) (kpos : k > 0) (perms goodperms : Set (Fin (3 * k + 1) → ℤ)) (hgoodperms : goodperms = {f | f ∈ perms ∧ ¬∃ j, 3 ∣ ∑ i, if i ≤ j then f i else 0}) (hperms : perms = {f | ∀ y ∈ Icc 1 (3 * k + 1), ∃! x, f x = ↑y}) (h₁ : ∀ (n : ℤ), sorry → n ≥ 1 ∧ n ≤ 3 * ↑k + 1) : ∃ f, ∀ y ∈ Icc 1 (3 * k + 1), ∃! x, f x = ↑y :=
  by
  --  use fun i => (i : ℕ) + 1
  intro y hy
  have h₃ : y ∈ Set.Icc 1 (3 * k + 1) := hy
  have h₄ : (y : ℤ) ≥ 1 := by sorry
  have h₅ : (y : ℤ) ≤ 3 * k + 1 := by sorry
  have h₆ : y ≥ 1 := by sorry
  have h₇ : y ≤ 3 * k + 1 := by sorry
  have h₈ : y - 1 < 3 * k + 1 := by sorry
  have h₉ : y - 1 ≥ 0 := by sorry
  refine' ⟨⟨y - 1, _⟩, _, _⟩
  · omega
  · simp [Fin.ext_iff] <;> omega
  · intro x hx
    simp [Fin.ext_iff] at hx ⊢ <;> omega
  hole