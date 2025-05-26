theorem h₂ (T : Set (EuclideanSpace ℝ (Fin 2))) (hT :  T =    (convexHull ℝ : Set (WithLp 2 (EuclideanSpace ℝ (Fin 2))) → Set (WithLp 2 (EuclideanSpace ℝ (Fin 2))))      {!₂[0, 0], !₂[1, 0], !₂[0, 1]}) (Tcolors : (↑T : Type) → Fin 4) (h₁ : !₂[0, 0] ∈ T) : !₂[1, 0] ∈ T :=
  by
  --  rw [hT]
  --  exact subset_convexHull _ _ (by simp [Set.mem_insert, Set.mem_singleton_iff])
  hole