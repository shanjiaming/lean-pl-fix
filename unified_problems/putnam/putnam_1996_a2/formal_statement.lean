theorem putnam_1996_a2
(O1 O2 : EuclideanSpace ℝ (Fin 2))
(C1 C2 : Set (EuclideanSpace ℝ (Fin 2)))
(hC1 : C1 = sphere O1 1)
(hC2 : C2 = sphere O2 3)
(hO1O2 : dist O1 O2 = 10)
: {M : EuclideanSpace ℝ (Fin 2) | ∃ X Y, X ∈ C1 ∧ Y ∈ C2 ∧ M = midpoint ℝ X Y} = ((fun O1 O2 : EuclideanSpace ℝ (Fin 2) => {p : EuclideanSpace ℝ (Fin 2) | dist p (midpoint ℝ O1 O2) ≥ 1 ∧ dist p (midpoint ℝ O1 O2) ≤ 2}) : (EuclideanSpace ℝ (Fin 2)) → (EuclideanSpace ℝ (Fin 2)) → Set (EuclideanSpace ℝ (Fin 2)) ) O1 O2 := by