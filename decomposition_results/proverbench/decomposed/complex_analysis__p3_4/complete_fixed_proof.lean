theorem constant_entire_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) : ∃ c : ℂ, ∀ z, f z = c:=
  by
  have h₁ : ∃ (c : ℂ), ∀ (z : ℂ), f z = 1 / c:= by -- exact constant_reciprocal_function f hf h
    hole
  have h₂ : ∃ (c : ℂ), ∀ (z : ℂ), f z = c:= by
    --  obtain ⟨c, hc⟩ := h₁
    --  refine' ⟨1 / c, _⟩
    --  intro z
    --  rw [hc z] <;> simp_all <;> aesop
    hole
  --  exact h₂
  simpa