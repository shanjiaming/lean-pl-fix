theorem putnam_2006_b1
  (curve : Set (ℝ × ℝ))
  (hcurve : curve = {(x, y) | x ^ 3 + 3 * x * y + y ^ 3 = 1})
  (equilateral : Set (ℝ × ℝ) → Prop)
  (hequilateral : ∀ S, equilateral S ↔ S.encard = 3 ∧
    ∃ d : ℝ, ∀ P ∈ S, ∀ Q ∈ S, P ≠ Q →
    Real.sqrt ((P.1 - Q.1)^2 + (P.2 - Q.2)^2) = d) :
  (∃! S : Set (ℝ × ℝ), S ⊆ curve ∧ equilateral S) ∧
  (∃ S : Set (ℝ × ℝ), S ⊆ curve ∧ equilateral S ∧ (MeasureTheory.volume (convexHull ℝ S)).toReal = ((3 * Real.sqrt 3 / 2) : ℝ )) := by