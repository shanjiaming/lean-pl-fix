theorem h₂ (m : ℕ) (area2 : (Fin 2 → ℝ) → (Fin 2 → ℝ) → (Fin 2 → ℝ) → ℝ) (area3 : (Fin 3 → ℝ) → (Fin 3 → ℝ) → (Fin 3 → ℝ) → ℝ) (areadef2 areadef3 : (Fin m → Fin m → Fin m → ℝ) → Prop) (mge3 : m ≥ 3) (harea2 : ∀ (a b c : Fin 2 → ℝ), area2 a b c = sorry) (harea3 : ∀ (a b c : Fin 3 → ℝ), area3 a b c = sorry) (hareadef2 :  ∀ (a : Fin m → Fin m → Fin m → ℝ),    areadef2 a ↔      ∀ (A : Fin m → Fin 2 → ℝ), (∑ i, ∑ j, ∑ k, if i < j ∧ j < k then a i j k * area2 (A i) (A j) (A k) else 0) ≥ 0) (hareadef3 :  ∀ (a : Fin m → Fin m → Fin m → ℝ),    areadef3 a ↔      ∀ (A : Fin m → Fin 3 → ℝ), (∑ i, ∑ j, ∑ k, if i < j ∧ j < k then a i j k * area3 (A i) (A j) (A k) else 0) ≥ 0) (h_area2_nonneg : ∀ (a b c : Fin 2 → ℝ), area2 a b c ≥ 0) (h_area3_nonneg : ∀ (a b c : Fin 3 → ℝ), area3 a b c ≥ 0) (a : Fin m → Fin m → Fin m → ℝ) (h_a : areadef2 a) (A : Fin m → Fin 3 → ℝ) : ∀ (i j k : Fin m), (if i < j ∧ j < k then a i j k * area3 (A i) (A j) (A k) else 0) ≥ 0 :=
  by
  --  intro i j k
  --  split_ifs with h
  ·
    have h₃ : area3 (A i) (A j) (A k) ≥ 0 := h_area3_nonneg (A i) (A j) (A k)
    have h₄ : a i j k ≥ 0 := by sorry
    have h₅ : a i j k * area3 (A i) (A j) (A k) ≥ 0 := by sorry
  --    linarith
  --  · simp_all
  hole