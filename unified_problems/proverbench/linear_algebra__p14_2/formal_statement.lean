/-- The determinant of an inverse matrix is the inverse of the determinant. -/
theorem det_inverse (P : Matrix n n K) [Invertible P] : det (P⁻¹) = (det P)⁻¹ :=