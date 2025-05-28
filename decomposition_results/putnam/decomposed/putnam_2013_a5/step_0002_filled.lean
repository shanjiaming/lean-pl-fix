theorem h_area2_nonneg (m : ℕ) (area2 : (Fin 2 → ℝ) → (Fin 2 → ℝ) → (Fin 2 → ℝ) → ℝ) (area3 : (Fin 3 → ℝ) → (Fin 3 → ℝ) → (Fin 3 → ℝ) → ℝ) (areadef2 areadef3 : (Fin m → Fin m → Fin m → ℝ) → Prop) (mge3 : m ≥ 3) (harea2 : ∀ (a b c : Fin 2 → ℝ), area2 a b c = (volume ((convexHull ℝ) {a, b, c})).toReal) (harea3 : ∀ (a b c : Fin 3 → ℝ), area3 a b c = (μH[2] ((convexHull ℝ) {a, b, c})).toReal) (hareadef2 :  ∀ (a : Fin m → Fin m → Fin m → ℝ),    areadef2 a ↔      ∀ (A : Fin m → Fin 2 → ℝ), (∑ i, ∑ j, ∑ k, if i < j ∧ j < k then a i j k * area2 (A i) (A j) (A k) else 0) ≥ 0) (hareadef3 :  ∀ (a : Fin m → Fin m → Fin m → ℝ),    areadef3 a ↔      ∀ (A : Fin m → Fin 3 → ℝ), (∑ i, ∑ j, ∑ k, if i < j ∧ j < k then a i j k * area3 (A i) (A j) (A k) else 0) ≥ 0) : ∀ (a b c : Fin 2 → ℝ), area2 a b c ≥ 0 :=
  by
  --  intro a b c
  --  rw [harea2]
  --  exact
  --    by
  --    have h₁ : 0 ≤ (volume (convexHull ℝ ({ a, b, c } : Set (Fin 2 → ℝ)))).toReal := by exact ENNReal.toReal_nonneg
  --    linarith
  hole