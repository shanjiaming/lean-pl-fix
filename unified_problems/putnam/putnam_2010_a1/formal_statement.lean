theorem putnam_2010_a1
    (n : ℕ)
    (kboxes : ℕ → Prop)
    (npos : n > 0)
    (hkboxes : ∀ k : ℕ, kboxes k =
      (∃ boxes : Finset.Icc 1 n → Fin k, ∀ i j : Fin k,
        ∑ x in Finset.univ.filter (boxes · = i), (x : ℕ) =
        ∑ x in Finset.univ.filter (boxes · = j), (x : ℕ))) :
    IsGreatest kboxes (((fun n : ℕ => Nat.ceil ((n : ℝ) / 2)) : ℕ → ℕ ) n) :=
  by