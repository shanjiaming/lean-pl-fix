theorem putnam_2003_b3 (n : ℕ) : n ! = ∏ i ∈ Finset.Icc 1 n, List.foldl Nat.lcm 1 (List.map succ (List.range ⌊n / i⌋₊)) :=
  by
  have h_main : ∀ (n : ℕ), n ! = ∏ i in Finset.Icc 1 n, ((List.range ⌊n / i⌋₊).map succ).foldl Nat.lcm 1 := by sorry
  exact h_main n