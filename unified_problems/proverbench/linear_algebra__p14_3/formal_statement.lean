/-- If A and B are similar matrices, then their determinants are equal. -/
theorem det_similar (A B : Matrix n n K) (h : similar A B) : det A = det B :=