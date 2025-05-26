theorem h5 (S : Type u_1) (inst✝ : CommSemigroup S) (a b c : S) (hS : ∀ (x y : S), ∃ z, x * z = y) (habc : a * c = b * c) (e : S) (he : ∀ (x : S), x * e = x) (z : S) (hz : c * z = e) (h2 : a * e = a) (h3 : b * e = b) (h4 : a * (c * z) = b * (c * z)) : a * e = b * e := by
  calc
    a * e = a * (c * z) := by
      calc
        a * e = a * (c * z) := by rw [hz]
        _ = a * (c * z) := by rfl
    _ = b * (c * z) := by rw [h4]
    _ = b * e := by
      calc
        b * (c * z) = b * (c * z) := by rfl
        _ = b * e := by rw [hz]