theorem putnam_2021_a3
  (N : ℕ)
  (Nsphere : Set (EuclideanSpace ℝ (Fin 3)))
  (hNsphere : Nsphere = {p | (p 0) ^ 2 + (p 1) ^ 2 + (p 2) ^ 2 = (N : ℝ)})
  (intcoords : (EuclideanSpace ℝ (Fin 3)) → Prop)
  (intcoords_def : ∀ p, intcoords p ↔ ∀ i : Fin 3, p i = round (p i)) :
  (0 < N ∧ ∃ A B C D : EuclideanSpace ℝ (Fin 3),
    A ∈ Nsphere ∧ B ∈ Nsphere ∧ C ∈ Nsphere ∧ D ∈ Nsphere ∧
    intcoords A ∧ intcoords B ∧ intcoords C ∧ intcoords D ∧
    (∃ s > 0, dist A B = s ∧ dist A C = s ∧ dist A D = s ∧ dist B C = s ∧ dist B D = s ∧ dist C D = s))
  ↔ N ∈ (({3 * m ^ 2 | m > 0}) : Set ℕ ) := by