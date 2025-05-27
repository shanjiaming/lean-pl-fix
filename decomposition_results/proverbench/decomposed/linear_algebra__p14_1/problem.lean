theorem det_product_eq (X Y : Matrix n n K) : det (X * Y) = det X * det Y := by
  have h : det (X * Y) = det X * det Y := by
    rw [Matrix.det_mul]
    <;>
    simp [mul_comm, mul_assoc, mul_left_comm]
    <;>
    ring
    <;>
    simp_all [Matrix.det_mul]
    <;>
    ring
    <;>
    simp_all [Matrix.det_mul]
    <;>
    ring
  
  exact h