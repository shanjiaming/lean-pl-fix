theorem putnam_2012_a1
(d : Fin 12 → ℝ)
(hd : ∀ i, d i ∈ Set.Ioo 1 12)
: ∃ i j k, i ≠ j ∧ i ≠ k ∧ j ≠ k ∧ d k ≥ d i ∧ d k ≥ d j ∧ (d i) ^ 2 + (d j) ^ 2 > (d k) ^ 2 := by