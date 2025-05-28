theorem h₂ (ABCintcoords ABCintdists ABCall : EuclideanSpace ℝ (Fin 2) → EuclideanSpace ℝ (Fin 2) → EuclideanSpace ℝ (Fin 2) → Prop) (hABCintcoords :  ∀ (A B C : EuclideanSpace ℝ (Fin 2)),    ABCintcoords A B C ↔ ∀ (i : Fin 2), A i = ↑(round (A i)) ∧ B i = ↑(round (B i)) ∧ C i = ↑(round (C i))) (hABCintdists :  ∀ (A B C : EuclideanSpace ℝ (Fin 2)),    ABCintdists A B C ↔ dist A B = ↑(round (dist A B)) ∧ dist A C = ↑(round (dist A C)) ∧ dist B C = ↑(round (dist B C))) (hABCall :  ∀ (A B C : EuclideanSpace ℝ (Fin 2)), ABCall A B C ↔ ¬Collinear ℝ {A, B, C} ∧ ABCintcoords A B C ∧ ABCintdists A B C) (h₁ : ABCall ![0, 0] ![3, 0] ![0, 4]) : dist ![0, 0] ![3, 0] = 3 := by
  norm_num [Real.dist_eq, abs_of_nonneg, pow_two, pow_one, EuclideanSpace.norm_eq, Finset.sum_range_succ, round_eq,
              Int.floor_eq_iff, Int.ceil_eq_iff] <;>
            (try norm_num) <;>
          (try ring_nf) <;>
        (try field_simp) <;>
      (try norm_num) <;>
    (try linarith)