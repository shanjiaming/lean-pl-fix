theorem nested_proof (a b c : ℕ) : a + b + c = c + b + a := by
  have h1 : a + b = b + a := by
    have h2 : a + b = b + a := by rw [Nat.add_comm]
    exact h2
  have h3 : a + b + c = (a + b) + c := by rw [Nat.add_assoc]
  have h4 : c + b + a = c + (b + a) := by rw [Nat.add_assoc]
  have h5 : (a + b) + c = (b + a) + c := by rw [h1]
  have h6 : (b + a) + c = c + (b + a) := by rw [Nat.add_comm]
  rw [h3, h5, h6, h4] 