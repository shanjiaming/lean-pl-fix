theorem h1 (S : Type u_1) (inst✝ : CommSemigroup S) (a b c : S) (hS : ∀ (x y : S), ∃ z, x * z = y) (habc : a * c = b * c) (e : S) (he : ∀ (x : S), x * e = x) : ∃ z, c * z = e :=
  by
  have h2 : ∃ (z : S), c * z = e := by sorry
  exact h2