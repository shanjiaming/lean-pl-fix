theorem extrema_on_interval  : ¬((∃ x ∈ Set.Icc (-3) 3, (∀ y ∈ Set.Icc (-3) 3, f y ≤ f x) ∧ f x = 41 / 4 ∧ x = 3) ∧
      ∃ z ∈ Set.Icc (-3) 3, (∀ y ∈ Set.Icc (-3) 3, f z ≤ f y) ∧ f z = -13 / 3 ∧ z = -2) :=
  by
  --  intro h
  have h₁ : f (-3) ≤ f (3) :=
    by
    obtain ⟨⟨x, hx₁, hx₂, hx₃, hx₄⟩, ⟨z, hz₁, hz₂, hz₃, hz₄⟩⟩ := h
    have h₅ : f (-3) ≤ f x := hx₂ (-3) (by norm_num)
    have h₆ : x = 3 := hx₄
    have h₇ : f x = 41 / 4 := hx₃
    have h₈ : f (-3) ≤ f (3) := by
      calc
        f (-3) ≤ f x := h₅
        _ = 41 / 4 := h₇
        _ = f (3) := by
          have h₉ : f (3) = 41 / 4 := by norm_num [f]
          rw [h₉]
    exact h₈
  have h₂ : f (-3) > f (3) := by sorry
  have h₃ : False := by sorry
  have h₁ : f (-3) ≤ f (3) := by sorry
have extrema_on_interval :
  ¬((∃ x : ℝ, x ∈ Set.Icc (-3) 3 ∧ (∀ y ∈ Set.Icc (-3) 3, f y ≤ f x) ∧ f x = 41 / 4 ∧ x = 3) ∧
      (∃ z : ℝ, z ∈ Set.Icc (-3) 3 ∧ (∀ y ∈ Set.Icc (-3) 3, f z ≤ f y) ∧ f z = -13 / 3 ∧ z = -2)) :=
  by
  intro h
  have h₁ : f (-3) ≤ f (3) :=
    by
    obtain ⟨⟨x, hx₁, hx₂, hx₃, hx₄⟩, ⟨z, hz₁, hz₂, hz₃, hz₄⟩⟩ := h
    have h₅ : f (-3) ≤ f x := hx₂ (-3) (by norm_num)
    have h₆ : x = 3 := hx₄
    have h₇ : f x = 41 / 4 := hx₃
    have h₈ : f (-3) ≤ f (3) := by
      calc
        f (-3) ≤ f x := h₅
        _ = 41 / 4 := h₇
        _ = f (3) := by
          have h₉ : f (3) = 41 / 4 := by norm_num [f]
          rw [h₉]
    exact h₈
  have h₂ : f (-3) > f (3) := by
    have h₃ : f (-3) = (17 : ℝ) / 4 := by norm_num [f]
    have h₄ : f (3) = (41 : ℝ) / 4 := by norm_num [f]
    rw [h₃, h₄] <;> norm_num <;> (try norm_num) <;> (try linarith) <;> (try ring_nf at * <;> norm_num at * <;> linarith)
  have h₃ : False := by linarith
  exact h₃
  hole