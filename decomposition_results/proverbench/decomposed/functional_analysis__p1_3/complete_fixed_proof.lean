theorem partial_g_x (x y : ℝ) :
  deriv (fun x => g x y) x = (4 * x - 2 * y) * exp (-y) := by
  have h1 : g = fun x y => (x^2 + (y - x)^2) * exp (-y) := by
    admit
  
  have h2 : deriv (fun x => g x y) x = (4 * x - 2 * y) * exp (-y) := by
    have h3 : deriv (fun x => g x y) x = deriv (fun x => (x^2 + (y - x)^2) * exp (-y)) x := by
      admit
    rw [h3]
    
    have h4 : deriv (fun x => (x^2 + (y - x)^2) * exp (-y)) x = (4 * x - 2 * y) * exp (-y) := by
      
      have h5 : HasDerivAt (fun x => (x^2 + (y - x)^2) * exp (-y)) ((4 * x - 2 * y) * exp (-y)) x := by
        
        have h6 : HasDerivAt (fun x => x^2 + (y - x)^2) (4 * x - 2 * y) x := by
          
          have h7 : HasDerivAt (fun x => x^2) (2 * x) x := by
            admit
          have h8 : HasDerivAt (fun x => (y - x)^2) (2 * (y - x) * (-1 : ℝ)) x := by
            have h9 : HasDerivAt (fun x => y - x) (-1 : ℝ) x := by
              admit
            have h10 : HasDerivAt (fun x => (y - x)^2) (2 * (y - x) * (-1 : ℝ)) x := by
              have h11 : HasDerivAt (fun x => y - x) (-1 : ℝ) x := h9
              admit
            admit
          have h12 : HasDerivAt (fun x => x^2 + (y - x)^2) (2 * x + (2 * (y - x) * (-1 : ℝ))) x := by
            have h13 : HasDerivAt (fun x => x^2 + (y - x)^2) (2 * x + (2 * (y - x) * (-1 : ℝ))) x := h7.add h8
            admit
          admit
        have h14 : HasDerivAt (fun x => (x^2 + (y - x)^2) * exp (-y)) ((4 * x - 2 * y) * exp (-y)) x := by
          have h15 : HasDerivAt (fun x => x^2 + (y - x)^2) (4 * x - 2 * y) x := h6
          have h16 : HasDerivAt (fun x => (x^2 + (y - x)^2) * exp (-y)) ((4 * x - 2 * y) * exp (-y)) x := by
            admit
          admit
        admit
      have h17 : deriv (fun x => (x^2 + (y - x)^2) * exp (-y)) x = (4 * x - 2 * y) * exp (-y) := by
        admit
      admit
    admit
  admit