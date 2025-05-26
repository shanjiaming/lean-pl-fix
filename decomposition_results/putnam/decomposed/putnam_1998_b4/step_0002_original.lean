theorem h_main (quantity : ℕ → ℕ → ℤ) (hquantity : quantity = fun n m => ∑ i ∈ Finset.range (m * n), (-1) ^ (i / m + i / n)) (n m : ℕ) (hnm : n > 0 ∧ m > 0) : quantity n m = 0 ↔ multiplicity 2 n ≠ multiplicity 2 m :=
  by
  rw [hquantity]
  have h₁ : n > 0 := hnm.1
  have h₂ : m > 0 := hnm.2
  have h₃ : (∑ i in Finset.range (m * n), (-1 : ℤ) ^ (i / m + i / n)) = 0 ↔ multiplicity 2 n ≠ multiplicity 2 m := by sorry
  simpa using h₃