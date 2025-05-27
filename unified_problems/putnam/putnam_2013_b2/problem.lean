theorem putnam_2013_b2
     (CN : ℕ → Set (ℝ → ℝ))
     (hCN : ∀ N : ℕ, CN N =
       {f : ℝ → ℝ |
         (∀ x : ℝ, f x ≥ 0) ∧
         ∃ a : List ℝ, a.length = N + 1 ∧ (∀ n : Fin (N + 1), 3 ∣ (n : ℕ) → a[n]! = 0) ∧
         ∀ x : ℝ, f x = 1 + ∑ n in Finset.Icc 1 N, a[(n : ℕ)]! * Real.cos (2*Real.pi*n*x)}) :
     IsGreatest {f 0 | f ∈ ⋃ N ∈ Ici 1, CN N} ((3) : ℝ ) := by