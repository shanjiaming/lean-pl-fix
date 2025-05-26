theorem h₅₈ (S T : Set ℤ) (hS : S = {k | ∃ j, 0 ≤ j ∧ j ≤ 33 ∧ k = 3 * j + 1}) (hT : T ⊆ S ∧ T.ncard = 20) (h : ∀ m ∈ T, ∀ n ∈ T, m ≠ n → m + n ≠ 104) (h₁ : T ⊆ S) (h₂ : T.ncard = 20) (h₃ : ∀ m ∈ T, ∀ n ∈ T, m ≠ n → m + n ≠ 104) (h₄ h₅₁ : T ⊆ ({1, 52} ∪ ⋃ j, ⋃ (_ : 1 ≤ j ∧ j ≤ 16), {3 * j + 1}) ∪ ⋃ j, ⋃ (_ : 1 ≤ j ∧ j ≤ 16), {103 - 3 * j}) (h₅₂ :  T.ncard ≤ (({1, 52} ∪ ⋃ j, ⋃ (_ : 1 ≤ j ∧ j ≤ 16), {3 * j + 1}) ∪ ⋃ j, ⋃ (_ : 1 ≤ j ∧ j ≤ 16), {103 - 3 * j}).ncard) (h₅₄ h₅₆ :  ({1, 52} ∪ ⋃ j, ⋃ (_ : 1 ≤ j ∧ j ≤ 16), {3 * j + 1}) ∪ ⋃ j, ⋃ (_ : 1 ≤ j ∧ j ≤ 16), {103 - 3 * j} ⊆ Set.Icc 1 103) : (({1, 52} ∪ ⋃ j, ⋃ (_ : 1 ≤ j ∧ j ≤ 16), {3 * j + 1}) ∪ ⋃ j, ⋃ (_ : 1 ≤ j ∧ j ≤ 16), {103 - 3 * j}).ncard ≤ 18 :=
  by
  norm_num [Set.ncard_eq_zero, Set.ncard_singleton, Set.ncard_empty, Set.ncard_insert_of_not_mem,
                Set.mem_singleton_iff] <;>
              (try decide) <;>
            (try norm_num) <;>
          (try ring_nf) <;>
        (try norm_cast) <;>
      (try omega) <;>
    (try aesop)