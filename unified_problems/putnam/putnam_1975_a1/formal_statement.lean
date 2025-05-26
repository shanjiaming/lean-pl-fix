theorem putnam_1975_a1
(nab nxy : (ℤ × ℤ × ℤ) → Prop)
(hnab : nab = fun (n, a, b) => n = (a^2 + (a : ℚ))/2 + (b^2 + (b : ℚ))/2)
(hnxy : nxy = fun (n, x, y) => 4*n + 1 = x^2 + y^2)
: (∀ n a b : ℤ, nab (n, a, b) → nxy (n, ((fun (a, b) => a + b + 1, fun (a, b) => a - b) : ((ℤ × ℤ) → ℤ) × ((ℤ × ℤ) → ℤ) ).1 (a, b), ((fun (a, b) => a + b + 1, fun (a, b) => a - b) : ((ℤ × ℤ) → ℤ) × ((ℤ × ℤ) → ℤ) ).2 (a, b))) ∧
∀ n : ℤ, (∃ x y : ℤ, nxy (n, x, y)) → ∃ a b : ℤ, nab (n, a, b) := by