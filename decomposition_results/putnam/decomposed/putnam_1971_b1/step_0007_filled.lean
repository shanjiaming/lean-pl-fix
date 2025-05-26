theorem h5 (S : Type u_1) (inst✝ : Mul S) (hself : ∀ (x : S), x * x = x) (h2✝ : ∀ (x y z : S), x * y * z = y * z * x) (x y : S) (h1 : x * y * (y * x) = y * (y * x) * x) (h2 : y * (y * x) * x = y * x) (h3 : x * y * (y * x) = y * x) (h4 : x * y * (y * x) = x * y) : x * y = y * x := by
  calc
    x * y = (x * y) * (y * x) := by rw [h4]
    _ = y * x := by rw [h3]
  hole