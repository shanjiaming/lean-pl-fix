theorem h₂ (p q : ℤ) (h : ∃ r, cos (↑p * π / ↑q) = ↑r) (hq : q = 0) (h₁ : cos (↑p * π / ↑q) = 1) : ∃ r ∈ {0, 1, -1, 1 / 2, -1 / 2}, cos (↑p * π / ↑q) = ↑r :=
  by
  refine' ⟨1, _⟩
  constructor
  · norm_num [Set.mem_insert, Set.mem_singleton_iff]
  · simpa [h₁] using h₁
  hole