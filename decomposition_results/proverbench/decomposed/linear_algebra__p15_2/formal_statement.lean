theorem uniqueness_of_decomposition (hu : u ≠ 0) (a' b' : E)
    (h_decomp : v = a' + b') (h_parallel : isParallel a' u) (h_orthogonal : isOrthogonal b' u) :
let l := ⟪v, u⟫_ℝ / ‖u‖^2;
a' = l • u ∧ b' = v - l • u :=