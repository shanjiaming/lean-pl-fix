theorem h4 (S : Type u_1) (inst✝ : CommSemigroup S) (a b c : S) (hS : ∀ (x y : S), ∃ z, x * z = y) (habc : a * c = b * c) (e : S) (he : ∀ (x : S), x * e = x) (z : S) (hz : c * z = e) (h2 : a * e = a) (h3 : b * e = b) : a * (c * z) = b * (c * z) := by
  calc
    a * (c * z) = (a * c) * z := by rw [mul_assoc]
    _ = (b * c) * z := by rw [habc]
    _ = b * (c * z) := by rw [mul_assoc]
  hole