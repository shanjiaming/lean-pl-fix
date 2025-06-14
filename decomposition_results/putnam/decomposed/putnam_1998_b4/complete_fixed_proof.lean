theorem putnam_1998_b4
  (quantity : ℕ → ℕ → ℤ)
  (hquantity : quantity = fun n m => ∑ i in Finset.range (m * n), (-1 : ℤ)^(i/m + i/n))
  (n m : ℕ)
  (hnm : n > 0 ∧ m > 0) :
  quantity n m = 0 ↔ ⟨n, m⟩ ∈ (({nm | let ⟨n,m⟩ := nm; multiplicity 2 n ≠ multiplicity 2 m}) : Set (ℕ × ℕ) ) := by
  have h_main : quantity n m = 0 ↔ multiplicity 2 n ≠ multiplicity 2 m := by
    rw [hquantity]
    have h₁ : n > 0 := hnm.1
    have h₂ : m > 0 := hnm.2
    have h₃ : (∑ i in Finset.range (m * n), (-1 : ℤ) ^ (i / m + i / n)) = 0 ↔ multiplicity 2 n ≠ multiplicity 2 m := by
      
      
      admit
    admit
  
  have h_final : quantity n m = 0 ↔ ⟨n, m⟩ ∈ (({nm | let ⟨n,m⟩ := nm; multiplicity 2 n ≠ multiplicity 2 m}) : Set (ℕ × ℕ) ) := by
    admit
  
  admit