theorem h7 (n : ℕ) (npos : n ≥ 1) (mats01 : Set (Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ)) (hmats01 : mats01 = {A | ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1}) (h2 : 2 * n ≥ 2) (h5 : 2 * n > 0) (h6 :  ∀ (x : ℝ),    x = 0 ∨ x = 1 →      (fun A => ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1)        ((Matrix.of : (Fin (2 * n) → Fin (2 * n) → ℝ) → Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ) fun i j =>          if i = ⟨0, ⋯⟩ ∧ j = ⟨0, ⋯⟩ then x else 0)) : {A | ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1}.Infinite :=
  by
  --  refine' Set.infinite_of_injective_forall_mem (fun x y hxy => _) h6
  have h8 := congr_arg (fun A => A ⟨0, by omega⟩ ⟨0, by omega⟩) hxy
  simp [Matrix.of_apply, Fin.ext_iff] at h8 <;> aesop
  hole