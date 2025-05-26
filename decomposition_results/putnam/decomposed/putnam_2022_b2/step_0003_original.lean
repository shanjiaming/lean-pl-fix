theorem h₆ (n : ℕ) (P : Finset (Fin 3 → ℝ) → Prop) (P_def :  ∀ (S : Finset (Fin 3 → ℝ)),    P S ↔      (↑S : Set (Fin 3 → ℝ)) =        {u |          ∃ v w,            u =              ((crossProduct : (Fin 3 → ℝ) → (Fin 3 → ℝ) →ₗ[ℝ] Fin 3 → ℝ) (↑v : Fin 3 → ℝ) : (Fin 3 → ℝ) → Fin 3 → ℝ)                (↑w : Fin 3 → ℝ)}) (h : 0 < n ∧ ∃ S, S.card = n ∧ P S) (h₂ : 0 < n) (S : Finset (Fin 3 → ℝ)) (hS_card : S.card = n) (hS h₄ : P S) (h₅ :  P S ↔    (↑S : Set (Fin 3 → ℝ)) =      {u |        ∃ v w,          u =            ((crossProduct : (Fin 3 → ℝ) → (Fin 3 → ℝ) →ₗ[ℝ] Fin 3 → ℝ) (↑v : Fin 3 → ℝ) : (Fin 3 → ℝ) → Fin 3 → ℝ)              (↑w : Fin 3 → ℝ)}) : (↑S : Set (Fin 3 → ℝ)) =
    {u |
      ∃ v w,
        u =
          ((crossProduct : (Fin 3 → ℝ) → (Fin 3 → ℝ) →ₗ[ℝ] Fin 3 → ℝ) (↑v : Fin 3 → ℝ) : (Fin 3 → ℝ) → Fin 3 → ℝ)
            (↑w : Fin 3 → ℝ)} :=
  by
  rw [h₅] at h₄
  exact h₄