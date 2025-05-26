theorem putnam_1962_a3 (A B C A' B' C' P Q R : EuclideanSpace ℝ (Fin 2)) (k : ℝ) (hk : k > 0) (hABC : ¬Collinear ℝ {A, B, C}) (hA' : A' ∈ segment ℝ B C ∧ Dist.dist C A' / Dist.dist A' B = k) (hB' : B' ∈ segment ℝ C A ∧ Dist.dist A B' / Dist.dist B' C = k) (hC' : C' ∈ segment ℝ A B ∧ Dist.dist B C' / Dist.dist C' A = k) (hP : P ∈ segment ℝ B B' ∧ P ∈ segment ℝ C C') (hQ : Q ∈ segment ℝ C C' ∧ Q ∈ segment ℝ A A') (hR : R ∈ segment ℝ A A' ∧ R ∈ segment ℝ B B') : sorry / sorry = (k - 1) ^ 2 / (k ^ 2 + k + 1) :=
  by
  have h₁ : False := by sorry
  have h₂ :
    (volume (convexHull ℝ { P, Q, R })).toReal / (volume (convexHull ℝ { A, B, C })).toReal =
      (k - 1) ^ 2 / (k ^ 2 + k + 1) := by sorry
  --  exact h₂
  hole