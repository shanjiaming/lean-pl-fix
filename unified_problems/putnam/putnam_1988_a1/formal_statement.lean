theorem putnam_1988_a1
    (R : Set (Fin 2 → ℝ))
    (hR : R = {p | |p 0| - |p 1| ≤ 1 ∧ |p 1| ≤ 1}) :
    (volume R).toReal = ((6) : ℝ ) :=
  by