theorem putnam_2017_a1
    (IsQualifying : Set ℤ → Prop)
    (IsQualifying_def : ∀ S, IsQualifying S ↔
      (∀ n ∈ S, 0 < n) ∧
      2 ∈ S ∧
      (∀ n > 0, n ^ 2 ∈ S → n ∈ S) ∧
      (∀ n ∈ S, (n + 5) ^ 2 ∈ S))
    (S : Set ℤ)
    (hS : IsLeast IsQualifying S) :
    Sᶜ ∩ {n | 0 < n} = (({x : ℤ | x > 0 ∧ (x = 1 ∨ 5 ∣ x)}) : Set ℤ ) :=
  by