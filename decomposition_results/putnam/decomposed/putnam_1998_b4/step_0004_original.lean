theorem h_final (quantity : ℕ → ℕ → ℤ) (hquantity : quantity = fun n m => ∑ i ∈ Finset.range (m * n), (-1) ^ (i / m + i / n)) (n m : ℕ) (hnm : n > 0 ∧ m > 0) (h_main : quantity n m = 0 ↔ multiplicity 2 n ≠ multiplicity 2 m) : quantity n m = 0 ↔ (n, m) ∈ {(n, m) | multiplicity 2 n ≠ multiplicity 2 m} := nm;
          multiplicity 2 n ≠ multiplicity 2 m}) :
        Set (ℕ × ℕ)) :=
  by rw [h_main] <;> simp [Set.mem_setOf_eq] <;> aesop