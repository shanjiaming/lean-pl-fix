theorem h₈ (n : Type u) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (K : Type u_1) (inst✝ : Field K) (A B P : Matrix n n K) (hP_unit : IsUnit P.det) (hP h₁ : B = P⁻¹ * A * P) (h₂ : B.det = (P⁻¹ * A * P).det) (h₃ : (P⁻¹ * A * P).det = (P⁻¹ * (A * P)).det) (h₄ : (P⁻¹ * (A * P)).det = P⁻¹.det * (A * P).det) (h₅ : (A * P).det = A.det * P.det) (h₆ : P⁻¹.det = P.det⁻¹) (h₇ : B.det = P.det⁻¹ * (A.det * P.det)) : P.det⁻¹ * (A.det * P.det) = A.det :=
  by
  have h₉ : (det P)⁻¹ * det P = 1 := by sorry
  calc
    (det P)⁻¹ * (det A * det P) = (det P)⁻¹ * (det P * det A) := by ring_nf
    _ = ((det P)⁻¹ * det P) * det A := by ring_nf
    _ = 1 * det A := by rw [h₉]
    _ = det A := by simp