theorem h1 (S : Type u_1) (inst✝ : Mul S) (hS : ∀ (a b : S), a * b * a = b) : ∀ (a b : S), b * (a * b) = a := by
  intro a b
  have h2 : (a * b) * a = b := hS a b
  have h3 : ((a * b) * a) * (a * b) = b * (a * b) := by sorry
  have h4 : ((a * b) * a) * (a * b) = a := by sorry
  have h5 : b * (a * b) = a := by sorry
  exact h5