theorem putnam_1968_b2
{G : Type*}
[Group G]
(hG : Finite G)
(A : Set G)
(hA : A.ncard > (Nat.card G : ℚ)/2)
: ∀ g : G, ∃ x ∈ A, ∃ y ∈ A, g = x * y := by