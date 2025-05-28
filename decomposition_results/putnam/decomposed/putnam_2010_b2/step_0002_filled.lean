theorem h_main_exists_ABC (ABCintcoords ABCintdists ABCall : EuclideanSpace ℝ (Fin 2) → EuclideanSpace ℝ (Fin 2) → EuclideanSpace ℝ (Fin 2) → Prop) (hABCintcoords :  ∀ (A B C : EuclideanSpace ℝ (Fin 2)),    ABCintcoords A B C ↔ ∀ (i : Fin 2), A i = ↑(round (A i)) ∧ B i = ↑(round (B i)) ∧ C i = ↑(round (C i))) (hABCintdists :  ∀ (A B C : EuclideanSpace ℝ (Fin 2)),    ABCintdists A B C ↔ dist A B = ↑(round (dist A B)) ∧ dist A C = ↑(round (dist A C)) ∧ dist B C = ↑(round (dist B C))) (hABCall :  ∀ (A B C : EuclideanSpace ℝ (Fin 2)), ABCall A B C ↔ ¬Collinear ℝ {A, B, C} ∧ ABCintcoords A B C ∧ ABCintdists A B C) : ∃ A B C, ABCall A B C ∧ dist A B = 3 :=
  by
  --  use ![0, 0], ![3, 0], ![0, 4]
  have h₁ : ABCall ![0, 0] ![3, 0] ![0, 4] := by sorry
  have h₂ : dist (![0, 0] : EuclideanSpace ℝ (Fin 2)) ![3, 0] = 3 := by sorry
  --  exact by
  --    constructor
  --    · exact h₁
  --    · exact h₂ <;> norm_num
  hole