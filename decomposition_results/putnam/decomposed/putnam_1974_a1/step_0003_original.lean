theorem h₂ (conspiratorial : Set ℤ → Prop) (hconspiratorial :  ∀ (S : Set ℤ),    conspiratorial S ↔      ∀ a ∈ S,        ∀ b ∈ S, ∀ c ∈ S, (a > 0 ∧ b > 0 ∧ c > 0) ∧ (a ≠ b ∧ b ≠ c ∧ a ≠ c → a.gcd b > 1 ∨ b.gcd c > 1 ∨ a.gcd c > 1)) : ∃ S ⊆ Icc 1 16, conspiratorial S ∧ S.encard = 11 :=
  by
  use ({ 2, 3, 4, 6, 8, 9, 10, 12, 14, 15, 16 } : Set ℤ)
  constructor
  · intro x hx
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff, Set.mem_setOf_eq] at hx ⊢
    rcases hx with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl) <;> norm_num [Set.mem_Icc] <;>
          (try decide) <;>
        (try norm_num) <;>
      (try linarith)
  · constructor
    · rw [hconspiratorial]
      intro a ha b hb c hc
      constructor
      · norm_num [Set.mem_insert_iff, Set.mem_singleton_iff] at ha hb hc ⊢
        rcases ha with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl) <;>
                    rcases hb with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl) <;>
                  rcases hc with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl) <;>
                norm_num <;>
              (try decide) <;>
            (try norm_num) <;>
          (try aesop)
      · intro h
        norm_num [Set.mem_insert_iff, Set.mem_singleton_iff] at ha hb hc ⊢
        rcases ha with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl) <;>
                      rcases hb with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl) <;>
                    rcases hc with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl) <;>
                  norm_num at h ⊢ <;>
                (try decide) <;>
              (try norm_num) <;>
            (try aesop) <;>
          (try ring_nf at h ⊢ <;> norm_num at h ⊢ <;> aesop)
    · norm_num [Set.encard_insert_of_not_mem, Set.mem_singleton_iff] <;> decide