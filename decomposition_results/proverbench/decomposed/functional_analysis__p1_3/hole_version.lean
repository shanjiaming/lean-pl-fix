macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem partial_g_x (x y : ℝ) :
  deriv (fun x => g x y) x = (4 * x - 2 * y) * exp (-y) := by
  have h1 : g = fun x y => (x^2 + (y - x)^2) * exp (-y) := by
    hole_2
  
  have h2 : deriv (fun x => g x y) x = (4 * x - 2 * y) * exp (-y) := by
    have h3 : deriv (fun x => g x y) x = deriv (fun x => (x^2 + (y - x)^2) * exp (-y)) x := by
      hole_4
    rw [h3]
    
    have h4 : deriv (fun x => (x^2 + (y - x)^2) * exp (-y)) x = (4 * x - 2 * y) * exp (-y) := by
      
      have h5 : HasDerivAt (fun x => (x^2 + (y - x)^2) * exp (-y)) ((4 * x - 2 * y) * exp (-y)) x := by
        
        have h6 : HasDerivAt (fun x => x^2 + (y - x)^2) (4 * x - 2 * y) x := by
          
          have h7 : HasDerivAt (fun x => x^2) (2 * x) x := by
            hole_8
          have h8 : HasDerivAt (fun x => (y - x)^2) (2 * (y - x) * (-1 : ℝ)) x := by
            have h9 : HasDerivAt (fun x => y - x) (-1 : ℝ) x := by
              hole_10
            have h10 : HasDerivAt (fun x => (y - x)^2) (2 * (y - x) * (-1 : ℝ)) x := by
              have h11 : HasDerivAt (fun x => y - x) (-1 : ℝ) x := h9
              hole_11
            hole_9
          have h12 : HasDerivAt (fun x => x^2 + (y - x)^2) (2 * x + (2 * (y - x) * (-1 : ℝ))) x := by
            have h13 : HasDerivAt (fun x => x^2 + (y - x)^2) (2 * x + (2 * (y - x) * (-1 : ℝ))) x := h7.add h8
            hole_12
          hole_7
        have h14 : HasDerivAt (fun x => (x^2 + (y - x)^2) * exp (-y)) ((4 * x - 2 * y) * exp (-y)) x := by
          have h15 : HasDerivAt (fun x => x^2 + (y - x)^2) (4 * x - 2 * y) x := h6
          have h16 : HasDerivAt (fun x => (x^2 + (y - x)^2) * exp (-y)) ((4 * x - 2 * y) * exp (-y)) x := by
            hole_14
          hole_13
        hole_6
      have h17 : deriv (fun x => (x^2 + (y - x)^2) * exp (-y)) x = (4 * x - 2 * y) * exp (-y) := by
        hole_15
      hole_5
    hole_3
  hole_1