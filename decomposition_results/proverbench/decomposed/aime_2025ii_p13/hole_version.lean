macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem aime_2025ii_p13 : (↑(x_seq 2024).den + (x_seq 2024).num) % 1000 = 248 := by
  have h₀ : (↑(x_seq 2024).den + (x_seq 2024).num) % 1000 = 248 := by
    hole_2
  hole_1