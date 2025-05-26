theorem h₃ (n✝ n : ℕ) (h₁ :  ∏ i ∈ Finset.Icc 1 n, List.foldl Nat.lcm 1 (List.map succ (List.range ⌊n / i⌋₊)) =    ∏ i ∈ Finset.Icc 1 n, List.foldl Nat.lcm 1 (List.map succ (List.range ⌊n / i⌋₊))) : ∀ (k : ℕ),
    List.foldl Nat.lcm 1 (List.map succ (List.range k)) =
      Nat.lcm 1 (List.foldl Nat.lcm 1 (List.map succ (List.range k))) :=
  by
  intro k
  simp [List.foldl] <;> induction k <;>
          simp_all [List.range_succ, List.map_append, List.foldl_append, Nat.lcm_assoc] <;>
        ring_nf at * <;>
      simp_all [Nat.lcm_comm, Nat.lcm_assoc, Nat.lcm_one_left] <;>
    omega
  hole