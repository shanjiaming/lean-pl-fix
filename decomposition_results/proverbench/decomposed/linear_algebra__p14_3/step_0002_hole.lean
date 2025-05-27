theorem h_main (n : Type u) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (K : Type u_1) (inst✝ : Field K) (A B : Matrix n n K) (h : similar A B) : A.det = B.det := by
  obtain ⟨P, hP_unit, hP⟩ := h
  have h₁ : B = P⁻¹ * A * P := hP
  have h₂ : det B = det (P⁻¹ * A * P) := by sorry
  have h₃ : det (P⁻¹ * A * P) = det (P⁻¹ * (A * P)) := by sorry
  have h₄ : det (P⁻¹ * (A * P)) = det P⁻¹ * det (A * P) := by sorry
  have h₅ : det (A * P) = det A * det P := by sorry
  have h₆ : det P⁻¹ = (det P)⁻¹ := by sorry
  have h₇ : det B = (det P)⁻¹ * (det A * det P) := by sorry
  have h₈ : (det P)⁻¹ * (det A * det P) = det A := by sorry
  have h₉ : det B = det A := by sorry
  exact h₉.symm
  hole