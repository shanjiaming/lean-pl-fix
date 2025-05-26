theorem h3 (S : Type u_1) (inst✝ : Mul S) (hself : ∀ (x : S), x * x = x) (h2✝ : ∀ (x y z : S), x * y * z = y * z * x) (x y : S) (h1 : x * y * (y * x) = y * (y * x) * x) (h2 : y * (y * x) * x = y * x) : x * y * (y * x) = y * x := by
  calc
    (x * y) * (y * x) = (y * (y * x)) * x := by rw [h1]
    _ = (y * x) := by rw [h2]