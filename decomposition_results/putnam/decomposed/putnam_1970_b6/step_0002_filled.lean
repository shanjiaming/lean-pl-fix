theorem h_injective (L : ZMod 4 → EuclideanSpace ℝ (Fin 2)) (S : Set (EuclideanSpace ℝ (Fin 2))) (S_def : S = {x | ∃ i, L i = x}) (hSquad : S.ncard = 4 ∧ ∀ s ⊆ S, s.ncard = 3 → ¬Collinear ℝ s) (hlens : dist (L 0) (L 1) > 0 ∧ dist (L 1) (L 2) > 0 ∧ dist (L 2) (L 3) > 0 ∧ dist (L 3) (L 0) > 0) (horder : ∀ (i : ZMod 4), segment ℝ (L i) (L (i + 1)) ∩ interior ((convexHull ℝ) S) = ∅) (hcircum : ∃ O r, O ∈ (convexHull ℝ) S ∧ r > 0 ∧ ∀ (i : ZMod 4), ∃! I, Collinear ℝ {I, L i, L (i + 1)} ∧ dist O I = r) (harea :  (MeasureTheory.volume ((convexHull ℝ) S)).toReal =    √(dist (L 0) (L 1) * dist (L 1) (L 2) * dist (L 2) (L 3) * dist (L 3) (L 0))) : Function.Injective L := by
  have h₁ : S.ncard = 4 := hSquad.1
  have h₂ : S = {L i | i : ZMod 4} := S_def
  have h₃ : Function.Injective L := by sorry
  --  exact h₃ <;> aesop
  simpa