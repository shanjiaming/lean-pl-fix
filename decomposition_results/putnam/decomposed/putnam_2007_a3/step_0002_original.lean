theorem h_perms_infinite (k : ℕ) (kpos : k > 0) (perms goodperms : Set (Fin (3 * k + 1) → ℤ)) (hgoodperms : goodperms = {f | f ∈ perms ∧ ¬∃ j, 3 ∣ ∑ i, if i ≤ j then f i else 0}) (hperms : perms = {f | ∀ y ∈ Icc 1 (3 * k + 1), ∃! x, f x = ↑y}) : perms.Infinite := by
  rw [hperms]
  have h₁ : ∀ (n : ℤ), (n : ℤ) ∈ Set.Icc 1 (3 * k + 1) → (n : ℤ) ≥ 1 ∧ (n : ℤ) ≤ 3 * k + 1 := by sorry
  have h₂ : ∃ (f : Fin (3 * k + 1) → ℤ), (∀ y ∈ Icc 1 (3 * k + 1), ∃! x : Fin (3 * k + 1), f x = y) := by sorry
  rcases h₂ with ⟨f, hf⟩
  have h₃ : f ∈ {f : Fin (3 * k + 1) → ℤ | ∀ y ∈ Icc 1 (3 * k + 1), ∃! x : Fin (3 * k + 1), f x = y} := by sorry
  refine' Set.infinite_of_injective_forall_mem (fun n m hnm => _) (fun n => _)
  · simp_all [Function.funext_iff] <;> (try omega) <;> (try contradiction) <;> (try linarith)
  · use fun i => if (i : ℕ) = 0 then f i + n else f i
    intro y hy
    have h₄ : y ∈ Set.Icc 1 (3 * k + 1) := hy
    have h₅ : (y : ℤ) ≥ 1 := by
      simp only [Set.mem_Icc] at h₄
      exact_mod_cast h₄.1
    have h₆ : (y : ℤ) ≤ 3 * k + 1 := by
      simp only [Set.mem_Icc] at h₄
      exact_mod_cast h₄.2
    have h₇ : y ≥ 1 := by exact_mod_cast h₅
    have h₈ : y ≤ 3 * k + 1 := by exact_mod_cast h₆
    have h₉ : y - 1 < 3 * k + 1 := by omega
    have h₁₀ : y - 1 ≥ 0 := by omega
    have h₁₁ : ∃! x : Fin (3 * k + 1), f x = y := hf y hy
    rcases h₁₁ with ⟨x, hx, hx'⟩
    refine' ⟨x, _⟩
    simp_all [Fin.ext_iff] <;> (try omega) <;> (try contradiction) <;> (try linarith)