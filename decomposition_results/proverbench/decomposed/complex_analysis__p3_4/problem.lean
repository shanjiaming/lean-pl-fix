theorem constant_entire_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) :
  ∃ c : ℂ, ∀ z, f z = c := by
  have h₁ : ∃ (c : ℂ), ∀ (z : ℂ), f z = 1 / c := by
    -- Apply the axiom `constant_reciprocal_function` to get a constant `c` such that `f(z) = 1 / c` for all `z`.
    exact constant_reciprocal_function f hf h
  
  have h₂ : ∃ (c : ℂ), ∀ (z : ℂ), f z = c := by
    -- Obtain the constant `c` from `h₁` such that `f(z) = 1 / c` for all `z`.
    obtain ⟨c, hc⟩ := h₁
    -- Use `1 / c` as the constant value for `f(z)`.
    refine' ⟨1 / c, _⟩
    -- Introduce a variable `z` to prove `f(z) = 1 / c` for all `z`.
    intro z
    -- Rewrite `f(z)` using the hypothesis `hc` to get `1 / c = 1 / c`.
    rw [hc z]
    -- Simplify the goal using `simp_all` and `aesop` to check for any remaining goals.
    <;> simp_all
    <;> aesop
  
  -- Use `h₂` to conclude the proof.
  exact h₂