theorem putnam_1984_a2  : ∑' (k : (↑(Set.Ici 1) : Type)),
      6 ^ (↑k : ℕ) / ((3 ^ ((↑k : ℕ) + 1) - 2 ^ ((↑k : ℕ) + 1)) * (3 ^ (↑k : ℕ) - 2 ^ (↑k : ℕ))) =
    2 :=
  by
  have h_main :
    ∀ n : ℕ,
      (∑ k in Finset.Icc 1 n, (6 : ℚ) ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k))) =
        2 - (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) := by sorry
  have h_tendsto : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) := by sorry
  have h_sum_eq_two :
    ∑' k : Set.Ici 1, (6 ^ (k : ℕ) / ((3 ^ ((k : ℕ) + 1) - 2 ^ ((k : ℕ) + 1)) * (3 ^ (k : ℕ) - 2 ^ (k : ℕ)))) =
      ((2) : ℚ) := by sorry
  --  exact h_sum_eq_two
  hole