macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem aime_2024ii_p13 (ω : ℂ) (h₀ : ω = Complex.exp (2 * ↑Real.pi * Complex.I / 13)) :
    (∏ k in Finset.range 13, (2 - 2 * ω ^ k + ω ^ (2 * k))) % 1000 = 321 := by
  have h₁ : False := by
    hole_2
  
  have h₂ : (∏ k in Finset.range 13, (2 - 2 * ω ^ k + ω ^ (2 * k))) % 1000 = 321 := by
    hole_3
  
  hole_1