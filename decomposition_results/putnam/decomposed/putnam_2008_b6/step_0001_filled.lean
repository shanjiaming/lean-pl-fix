theorem putnam_2008_b6 (n k : ℕ) (hnk : n > 0 ∧ k > 0) : Odd {s | sorry}.ncard ↔ n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1] :=
  by
  have h_main :
    Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) ↔ (n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by sorry
  --  exact h_main
  hole