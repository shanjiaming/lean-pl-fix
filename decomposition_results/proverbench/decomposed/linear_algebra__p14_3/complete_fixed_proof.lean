theorem det_similar (A B : Matrix n n K) (h : similar A B) : det A = det B:=
  by
  have h_main : det A = det B:= by
    obtain ⟨P, hP_unit, hP⟩ := h
    have h₁ : B = P⁻¹ * A * P := hP
    have h₂ : det B = det (P⁻¹ * A * P):= by rw [h₁]
      hole
    have h₃ : det (P⁻¹ * A * P) = det (P⁻¹ * (A * P)):= by rw [← Matrix.mul_assoc] <;> simp [Matrix.mul_assoc]
      hole
    have h₄ : det (P⁻¹ * (A * P)) = det P⁻¹ * det (A * P):= by apply det_product_eq
      hole
    have h₅ : det (A * P) = det A * det P:= by apply det_product_eq
      hole
    have h₆ : det P⁻¹ = (det P)⁻¹:= by apply det_inverse
      hole
    have h₇ : det B = (det P)⁻¹ * (det A * det P):= by
      calc
        det B = det (P⁻¹ * A * P) := h₂
        _ = det (P⁻¹ * (A * P)) := h₃
        _ = det P⁻¹ * det (A * P) := h₄
        _ = det P⁻¹ * (det A * det P) := by rw [h₅]
        _ = (det P)⁻¹ * (det A * det P) := by rw [h₆]
      hole
    have h₈ : (det P)⁻¹ * (det A * det P) = det A:=
      by
      have h₉ : (det P)⁻¹ * det P = 1:= by
        apply inv_mul_cancel
        exact IsUnit.ne_zero hP_unit
        hole
      calc
        (det P)⁻¹ * (det A * det P) = (det P)⁻¹ * (det P * det A) := by ring_nf
        _ = ((det P)⁻¹ * det P) * det A := by ring_nf
        _ = 1 * det A := by rw [h₉]
        _ = det A := by simp
      hole
    have h₉ : det B = det A:= by
      calc
        det B = (det P)⁻¹ * (det A * det P) := h₇
        _ = det A := h₈
      hole
    exact h₉.symm
    hole
  exact h_main
  hole