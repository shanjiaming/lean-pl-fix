theorem putnam_1968_b5
(p : ℕ)
(hp : Prime p)
: {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}.ncard = ((fun p => p^2 + p) : ℕ → ℕ ) p := by