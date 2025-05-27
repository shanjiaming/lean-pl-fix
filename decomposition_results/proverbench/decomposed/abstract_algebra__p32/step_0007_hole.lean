theorem h_eg_comm (R : Type ?u.1622) (inst✝¹ : Ring R) (inst✝ : CharZero R) (e g f : R) (he : IsIdempotentElem e) (hg : IsIdempotentElem g) (hf : IsIdempotentElem f) (hsum : e + g + f = 0) (hf_eq : f = -e - g) : g * e = e * g := by
  have h1 : f = -e - g := hf_eq
  have h2 : e + g + f = 0 := hsum
  have h3 : f * f = f := by sorry
  have h4 : g * g = g := by sorry
  have h5 : e * e = e := by sorry
  have h6 : g * e = e * g := by sorry
  exact h6
  hole