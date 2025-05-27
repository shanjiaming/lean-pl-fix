theorem putnam_2007_a3
(k : ℕ)
(kpos : k > 0)
(perms : Set (Fin (3 * k + 1) → ℤ))
(goodperms : Set (Fin (3 * k + 1) → ℤ))
(hgoodperms : goodperms = {f ∈ perms | ¬∃ j : Fin (3 * k + 1), 3 ∣ ∑ i : Fin (3 * k + 1), ite (i ≤ j) (f i) 0})
(hperms : perms = {f : Fin (3 * k + 1) → ℤ | ∀ y ∈ Icc 1 (3 * k + 1), ∃! x : Fin (3 * k + 1), f x = y})
: (goodperms.ncard = perms.ncard * (((fun k ↦ (k)! * (k + 1)! / ((3 * k + 1) * (2 * k)!)) : ℕ → ℚ ) k)) := by