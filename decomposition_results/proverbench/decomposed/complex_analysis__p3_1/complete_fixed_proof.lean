theorem bounded_reciprocal_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) :
  Entire (fun z => 1 / f z) ∧ ∀ z, abs (1 / f z) ≤ 1 := by
  have hf_ne_zero : ∀ (z : ℂ), f z ≠ 0 := by
    intro z
    have h₁ : 1 ≤ abs (f z) := h z
    have h₂ : abs (f z) ≠ 0 := by admit
    admit
  
  have h₁ : Entire (fun z => 1 / f z) := by
    have h₂ : AnalyticOn ℂ (fun z : ℂ => 1 / f z) Set.univ := by
      
      have h₃ : ∀ z : ℂ, z ∈ Set.univ → f z ≠ 0 := by
        admit
      
      have h₄ : AnalyticOn ℂ f Set.univ := hf
      have h₅ : AnalyticOn ℂ (fun z : ℂ => 1 / f z) Set.univ := by
        admit
      admit
    admit
  
  have h₂ : ∀ z, abs (1 / f z) ≤ 1 := by
    intro z
    have h₃ : 1 ≤ abs (f z) := h z
    have h₄ : f z ≠ 0 := hf_ne_zero z
    have h₅ : abs (1 / f z) = 1 / abs (f z) := by
      admit
    rw [h₅]
    have h₆ : 1 / abs (f z) ≤ 1 := by
      have h₇ : 1 ≤ abs (f z) := h z
      have h₈ : 0 < abs (f z) := by admit
      have h₉ : 1 / abs (f z) ≤ 1 := by
        admit
      admit
    admit
  
  admit