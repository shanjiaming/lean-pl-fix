theorem putnam_2018_b1
(P Pvdiff : Finset (Mathlib.Vector ℤ 2))
(v : Mathlib.Vector ℤ 2)
(hP : P = {v' : Mathlib.Vector ℤ 2 | 0 ≤ v'[0] ∧ v'[0] ≤ 2 ∧ 0 ≤ v'[1] ∧ v'[1] ≤ 100})
(hPvdiff : Pvdiff = P \ ({v} : Finset (Mathlib.Vector ℤ 2)))
: (v ∈ P ∧ (∃ Q R : Finset (Mathlib.Vector ℤ 2),
    (Q ∪ R = Pvdiff) ∧ (Q ∩ R = ∅) ∧ (Q.card = R.card) ∧
    (∑ q in Q, q[0] = ∑ r in R, r[0]) ∧ (∑ q in Q, q[1] = ∑ r in R, r[1])))
  ↔ v ∈ (({v : Mathlib.Vector ℤ 2 | ∃ b : ℤ, 0 ≤ b ∧ b ≤ 100 ∧ Even b ∧ v.toList = [1, b]}) : Set (Mathlib.Vector ℤ 2) ) := by