theorem h_main (n : ℕ) : ∀ (n : ℕ), n ! = ∏ i ∈ Finset.Icc 1 n, List.foldl Nat.lcm 1 (List.map succ (List.range ⌊n / i⌋₊)) :=
  by
  --  intro n
  have h₁ :
    ∏ i in Finset.Icc 1 n, ((List.range ⌊n / i⌋₊).map succ).foldl Nat.lcm 1 =
      ∏ i in Finset.Icc 1 n, (List.foldl Nat.lcm 1 (List.range ⌊n / i⌋₊ |>.map Nat.succ)) := by sorry
  --  rw [h₁]
  have h₂ : ∏ i in Finset.Icc 1 n, (List.foldl Nat.lcm 1 (List.range ⌊n / i⌋₊ |>.map Nat.succ)) = n ! := by sorry
  --  rw [h₂]
  hole