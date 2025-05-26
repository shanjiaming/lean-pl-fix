theorem h6 (S : Type u_1) (inst✝ : CommSemigroup S) (a b c : S) (hS : ∀ (x y : S), ∃ z, x * z = y) (habc : a * c = b * c) (e : S) (he : ∀ (x : S), x * e = x) (z : S) (hz : c * z = e) (h2 : a * e = a) (h3 : b * e = b) (h4 : a * (c * z) = b * (c * z)) (h5 : a * e = b * e) : a = b := by
  calc
    a = a * e := by rw [h2]
    _ = b * e := by rw [h5]
    _ = b := by rw [h3]
  hole