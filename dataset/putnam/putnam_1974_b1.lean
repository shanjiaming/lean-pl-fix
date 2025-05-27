theorem putnam_1974_b1
    (d : (Fin 5 → EuclideanSpace ℝ (Fin 2)) → ℝ)
    (d_def : ∀ p, d p = ∑ ⟨i, j⟩ : Fin 5 × Fin 5, if i < j then dist (p i) (p j) else 0)
    (p : Fin 5 → EuclideanSpace ℝ (Fin 2))
    (hp : ∀ i, ‖p i‖ = 1) :
    d p = sSup {d q | (q) (hq : ∀ i, ‖q i‖ = 1)} ↔ ((fun p ↦ ∃ᵉ (B > 0) (o : Equiv.Perm (Fin 5)), ∀ i, dist (p (o i)) (p (o (i + 1))) = B) : (Fin 5 → EuclideanSpace ℝ (Fin 2)) → Prop ) p