theorem injective_function_properties (f✝ f : ℕ → ℕ) (h_inj : ∀ (x y : ℕ), f x = f y → x = y) (h_def : f 1 = 2 ∧ ∀ n ≥ 2, f n = n + 2) (hf0 : f 0 = 3) : (∀ (m n : ℕ), f (f m + f n) = f (f m) + f n) ∧ f 1 = 2 ∧ f 2 = 4 :=
  by
  have h2 : f 2 = 4 := by sorry
  have h1 : f 1 = 2 := h_def.1
  have h_main : ∀ m n, f (f m + f n) = f (f m) + f n := by sorry
  refine' ⟨h_main, _⟩
  constructor <;> norm_num [h1, h2] <;> aesop
  hole