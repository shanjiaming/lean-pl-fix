theorem putnam_1977_b6
{G : Type*}
[Group G]
(H : Subgroup G)
(h : ℕ)
(h_def : h = Nat.card H)
(a : G)
(ha : ∀ x : H, (x*a)^3 = 1)
(P : Set G)
(hP : P = {g : G | ∃ xs : List H, (xs.length ≥ 1) ∧ g = (List.map (fun h : H => h*a) xs).prod})
: (Finite P) ∧ (P.ncard ≤ 3*h^2) := by
  have h₁ : ∀ x : H, (x : G) * a * ((x : G) * a) * ((x : G) * a) = 1 := by admit
  have h₂ : Finite P := by admit
  have h₃ : P.ncard ≤ 3 * h ^ 2 := by admit
  norm_cast
