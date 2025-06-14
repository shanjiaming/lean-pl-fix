theorem putnam_1980_b5
    (T : Set ℝ)
    (hT : T = Icc 0 1)
    (P : ℝ → (ℝ → ℝ) → Prop)
    (IsConvex : (ℝ → ℝ) → Prop)
    (S : ℝ → Set (ℝ → ℝ))
    (P_def : ∀ t f, P t f ↔ f 1 - 2*f (2/3) + f (1/3) ≥ t*(f (2/3) - 2*f (1/3) + f 0))
    (IsConvex_def : ∀ f, IsConvex f ↔ ∀ u ∈ T, ∀ v ∈ T, ∀ s ∈ T, f (s*u + (1 - s)*v) ≤ s*(f u) + (1 - s)*(f v))
    (hS : S = fun t : ℝ => {f : ℝ → ℝ | (∀ x ∈ T, f x ≥ 0) ∧ StrictMonoOn f T ∧ IsConvex f ∧ ContinuousOn f T ∧ P t f})
    (t : ℝ) (ht : t ≥ 0) :
    ((fun t : ℝ => 1 ≥ t) : ℝ → Prop ) t ↔ (∀ f ∈ S t, ∀ g ∈ S t, f * g ∈ S t) := by
  have h_main : (t ≤ 1) ↔ (∀ f ∈ S t, ∀ g ∈ S t, f * g ∈ S t) := by
    constructor
    · 
      intro h
      have h₁ : t ≤ 1 := h
      intro f hf g hg
      have h₂ : S t = {f : ℝ → ℝ | (∀ x ∈ T, f x ≥ 0) ∧ StrictMonoOn f T ∧ IsConvex f ∧ ContinuousOn f T ∧ P t f} := by
        admit
      rw [h₂] at hf hg ⊢
      have h₃ : (∀ x ∈ T, f x ≥ 0) ∧ StrictMonoOn f T ∧ IsConvex f ∧ ContinuousOn f T ∧ P t f := by admit
      have h₄ : (∀ x ∈ T, g x ≥ 0) ∧ StrictMonoOn g T ∧ IsConvex g ∧ ContinuousOn g T ∧ P t g := by admit
      have h₅ : (∀ x ∈ T, (f * g) x ≥ 0) := by
        intro x hx
        have h₅₁ : f x ≥ 0 := h₃.1 x hx
        have h₅₂ : g x ≥ 0 := h₄.1 x hx
        have h₅₃ : (f * g) x = f x * g x := by admit
        admit
      have h₆ : StrictMonoOn (f * g) T := by
        have h₆₁ : StrictMonoOn f T := h₃.2.1
        have h₆₂ : StrictMonoOn g T := h₄.2.1
        have h₆₃ : ∀ x ∈ T, f x ≥ 0 := h₃.1
        have h₆₄ : ∀ x ∈ T, g x ≥ 0 := h₄.1
        intro x hx y hy hxy
        have h₆₅ : x ∈ T := hx
        have h₆₆ : y ∈ T := hy
        have h₆₇ : x < y := hxy
        have h₆₈ : f x < f y := h₆₁ h₆₅ h₆₆ h₆₇
        have h₆₉ : g x < g y := h₆₂ h₆₅ h₆₆ h₆₇
        have h₇₀ : (f * g) x = f x * g x := by admit
        have h₇₁ : (f * g) y = f y * g y := by admit
        rw [h₇₀, h₇₁]
        have h₇₂ : f x ≥ 0 := h₆₃ x h₆₅
        have h₇₃ : f y ≥ 0 := h₆₃ y h₆₆
        have h₇₄ : g x ≥ 0 := h₆₄ x h₆₅
        have h₇₅ : g y ≥ 0 := h₆₄ y h₆₆
        have h₇₆ : f x < f y := h₆₈
        have h₇₇ : g x < g y := h₆₉
        admit
      have h₇ : IsConvex (f * g) := by
        have h₇₁ : IsConvex f := h₃.2.2.1
        have h₇₂ : IsConvex g := h₄.2.2.1
        have h₇₃ : ∀ u ∈ T, ∀ v ∈ T, ∀ s ∈ T, f (s * u + (1 - s) * v) ≤ s * f u + (1 - s) * f v := by
          intro u hu v hv s hs
          have h₇₄ : f (s * u + (1 - s) * v) ≤ s * f u + (1 - s) * f v := by
            have h₇₅ : IsConvex f := h₃.2.2.1
            admit
          admit
        have h₇₄ : ∀ u ∈ T, ∀ v ∈ T, ∀ s ∈ T, g (s * u + (1 - s) * v) ≤ s * g u + (1 - s) * g v := by
          intro u hu v hv s hs
          have h₇₅ : g (s * u + (1 - s) * v) ≤ s * g u + (1 - s) * g v := by
            have h₇₆ : IsConvex g := h₄.2.2.1
            admit
          admit
        have h₇₅ : IsConvex (f * g) := by
          rw [IsConvex_def]
          intro u hu v hv s hs
          have h₇₆ : f (s * u + (1 - s) * v) ≤ s * f u + (1 - s) * f v := h₇₃ u hu v hv s hs
          have h₇₇ : g (s * u + (1 - s) * v) ≤ s * g u + (1 - s) * g v := h₇₄ u hu v hv s hs
          have h₇₈ : (f * g) (s * u + (1 - s) * v) = f (s * u + (1 - s) * v) * g (s * u + (1 - s) * v) := by admit
          have h₇₉ : (s : ℝ) * (f * g) u + (1 - s) * (f * g) v = s * (f u * g u) + (1 - s) * (f v * g v) := by
            admit
          rw [h₇₈, h₇₉]
          have h₈₀ : f u ≥ 0 := h₃.1 u hu
          have h₈₁ : f v ≥ 0 := h₃.1 v hv
          have h₈₂ : g u ≥ 0 := h₄.1 u hu
          have h₈₃ : g v ≥ 0 := h₄.1 v hv
          have h₈₄ : f (s * u + (1 - s) * v) ≥ 0 := h₃.1 (s * u + (1 - s) * v) (by
            have h₈₅ : s * u + (1 - s) * v ∈ T := by
              admit
            exact h₈₅)
          have h₈₅ : g (s * u + (1 - s) * v) ≥ 0 := h₄.1 (s * u + (1 - s) * v) (by
            have h₈₆ : s * u + (1 - s) * v ∈ T := by
              rw [hT]
              constructor <;>
              (try norm_num) <;>
              (try nlinarith [hu.1, hu.2, hv.1, hv.2, hs.1, hs.2]) <;>
              (try cases' le_total u v with h h <;> cases' le_total s 0 with h' h' <;>
                cases' le_total s 1 with h'' h'' <;>
                simp_all [hT, Icc, le_of_lt] <;>
                nlinarith)
            exact h₈₆)
          nlinarith [mul_nonneg h₈₀ h₈₂, mul_nonneg h₈₁ h₈₃, mul_nonneg (sub_nonneg.mpr hs.1) (sub_nonneg.mpr hs.2),
            mul_nonneg (sub_nonneg.mpr hs.1) h₈₀, mul_nonneg (sub_nonneg.mpr hs.1) h₈₁,
            mul_nonneg (sub_nonneg.mpr hs.2) h₈₂, mul_nonneg (sub_nonneg.mpr hs.2) h₈₃,
            mul_nonneg (sub_nonneg.mpr hs.1) h₈₄, mul_nonneg (sub_nonneg.mpr hs.2) h₈₅]
        exact h₇₅
      have h₈ : ContinuousOn (f * g) T := by
        have h₈₁ : ContinuousOn f T := h₃.2.2.2.1
        have h₈₂ : ContinuousOn g T := h₄.2.2.2.1
        have h₈₃ : ContinuousOn (f * g) T := by
          apply ContinuousOn.mul h₈₁ h₈₂
        exact h₈₃
      have h₉ : P t (f * g) := by
        have h₉₁ : P t f := h₃.2.2.2.2
        have h₉₂ : P t g := h₄.2.2.2.2
        have h₉₃ : f 1 - 2 * f (2 / 3 : ℝ) + f (1 / 3 : ℝ) ≥ t * (f (2 / 3 : ℝ) - 2 * f (1 / 3 : ℝ) + f 0) := by
          rw [P_def] at h₉₁
          exact h₉₁
        have h₉₄ : g 1 - 2 * g (2 / 3 : ℝ) + g (1 / 3 : ℝ) ≥ t * (g (2 / 3 : ℝ) - 2 * g (1 / 3 : ℝ) + g 0) := by
          rw [P_def] at h₉₂
          exact h₉₂
        have h₉₅ : (f * g) 1 - 2 * (f * g) (2 / 3 : ℝ) + (f * g) (1 / 3 : ℝ) ≥ t * ((f * g) (2 / 3 : ℝ) - 2 * (f * g) (1 / 3 : ℝ) + (f * g) 0) := by
          have h₉₅₁ : (f * g) 1 = f 1 * g 1 := by simp [Pi.mul_apply]
          have h₉₅₂ : (f * g) (2 / 3 : ℝ) = f (2 / 3 : ℝ) * g (2 / 3 : ℝ) := by simp [Pi.mul_apply]
          have h₉₅₃ : (f * g) (1 / 3 : ℝ) = f (1 / 3 : ℝ) * g (1 / 3 : ℝ) := by simp [Pi.mul_apply]
          have h₉₅₄ : (f * g) 0 = f 0 * g 0 := by simp [Pi.mul_apply]
          rw [h₉₅₁, h₉₅₂, h₉₅₃, h₉₅₄]
          have h₉₅₅ : f 1 - 2 * f (2 / 3 : ℝ) + f (1 / 3 : ℝ) ≥ t * (f (2 / 3 : ℝ) - 2 * f (1 / 3 : ℝ) + f 0) := h₉₃
          have h₉₅₆ : g 1 - 2 * g (2 / 3 : ℝ) + g (1 / 3 : ℝ) ≥ t * (g (2 / 3 : ℝ) - 2 * g (1 / 3 : ℝ) + g 0) := h₉₄
          have h₉₅₇ : f 1 ≥ 0 := by
            have h₉₅₇₁ : (1 : ℝ) ∈ T := by
              rw [hT]
              norm_num
            have h₉₅₇₂ : f 1 ≥ 0 := h₃.1 1 h₉₅₇₁
            exact h₉₅₇₂
          have h₉₅₈ : f (2 / 3 : ℝ) ≥ 0 := by
            have h₉₅₈₁ : (2 / 3 : ℝ) ∈ T := by
              rw [hT]
              norm_num
            have h₉₅₈₂ : f (2 / 3 : ℝ) ≥ 0 := h₃.1 (2 / 3 : ℝ) h₉₅₈₁
            exact h₉₅₈₂
          have h₉₅₉ : f (1 / 3 : ℝ) ≥ 0 := by
            have h₉₅₉₁ : (1 / 3 : ℝ) ∈ T := by
              rw [hT]
              norm_num
            have h₉₅₉₂ : f (1 / 3 : ℝ) ≥ 0 := h₃.1 (1 / 3 : ℝ) h₉₅₉₁
            exact h₉₅₉₂
          have h₉₆₀ : f 0 ≥ 0 := by
            have h₉₆₀₁ : (0 : ℝ) ∈ T := by
              rw [hT]
              norm_num
            have h₉₆₀₂ : f 0 ≥ 0 := h₃.1 0 h₉₆₀₁
            exact h₉₆₀₂
          have h₉₆₁ : g 1 ≥ 0 := by
            have h₉₆₁₁ : (1 : ℝ) ∈ T := by
              rw [hT]
              norm_num
            have h₉₆₁₂ : g 1 ≥ 0 := h₄.1 1 h₉₆₁₁
            exact h₉₆₁₂
          have h₉₆₂ : g (2 / 3 : ℝ) ≥ 0 := by
            have h₉₆₂₁ : (2 / 3 : ℝ) ∈ T := by
              rw [hT]
              norm_num
            have h₉₆₂₂ : g (2 / 3 : ℝ) ≥ 0 := h₄.1 (2 / 3 : ℝ) h₉₆₂₁
            exact h₉₆₂₂
          have h₉₆₃ : g (1 / 3 : ℝ) ≥ 0 := by
            have h₉₆₃₁ : (1 / 3 : ℝ) ∈ T := by
              rw [hT]
              norm_num
            have h₉₆₃₂ : g (1 / 3 : ℝ) ≥ 0 := h₄.1 (1 / 3 : ℝ) h₉₆₃₁
            exact h₉₆₃₂
          have h₉₆₄ : g 0 ≥ 0 := by
            have h₉₆₄₁ : (0 : ℝ) ∈ T := by
              rw [hT]
              norm_num
            have h₉₆₄₂ : g 0 ≥ 0 := h₄.1 0 h₉₆₄₁
            exact h₉₆₄₂
          have h₉₆₅ : t ≥ 0 := ht
          have h₉₆₆ : t ≤ 1 := h₁
          nlinarith [mul_nonneg h₉₅₇ h₉₆₁, mul_nonneg h₉₅₈ h₉₆₂, mul_nonneg h₉₅₉ h₉₆₃,
            mul_nonneg h₉₆₀ h₉₆₄, mul_nonneg (sub_nonneg.mpr h₉₆₆) (mul_nonneg h₉₅₈ h₉₆₂),
            mul_nonneg (sub_nonneg.mpr h₉₆₆) (mul_nonneg h₉₅₉ h₉₆₃),
            mul_nonneg (sub_nonneg.mpr h₉₆₆) (mul_nonneg h₉₆₀ h₉₆₄),
            mul_nonneg (sub_nonneg.mpr h₉₆₆) (mul_nonneg h₉₅₇ h₉₆₁)]
        have h₉₆ : P t (f * g) := by
          rw [P_def]
          exact h₉₅
        exact h₉₆
      exact ⟨h₅, h₆, h₇, h₈, h₉⟩
    · 
      intro h
      by_contra h₁
      have h₂ : t > 1 := by linarith
      have h₃ : S t = {f : ℝ → ℝ | (∀ x ∈ T, f x ≥ 0) ∧ StrictMonoOn f T ∧ IsConvex f ∧ ContinuousOn f T ∧ P t f} := by
        rw [hS]
        <;> simp [hT]
        <;> aesop
      have h₄ : (∀ f ∈ S t, ∀ g ∈ S t, f * g ∈ S t) := h
      have h₅ : (fun x : ℝ => x) ∈ S t := by
        rw [h₃]
        constructor
        · 
          intro x hx
          have h₅₁ : x ∈ T := hx
          have h₅₂ : x ∈ Set.Icc 0 1 := by simpa [hT] using h₅₁
          have h₅₃ : 0 ≤ x := h₅₂.1
          have h₅₄ : x ≤ 1 := h₅₂.2
          simp [hT] at h₅₁ ⊢
          <;> linarith
        · constructor
          · 
            intro x hx y hy hxy
            have h₅₅ : x ∈ T := hx
            have h₅₆ : y ∈ T := hy
            have h₅₇ : x < y := hxy
            have h₅₈ : x ∈ Set.Icc 0 1 := by simpa [hT] using h₅₅
            have h₅₉ : y ∈ Set.Icc 0 1 := by simpa [hT] using h₅₆
            have h₆₀ : 0 ≤ x := h₅₈.1
            have h₆₁ : x ≤ 1 := h₅₈.2
            have h₆₂ : 0 ≤ y := h₅₉.1
            have h₆₃ : y ≤ 1 := h₅₉.2
            simp [hT] at h₅₅ h₅₆ ⊢
            <;> linarith
          · constructor
            · 
              have h₅₅ : IsConvex (fun x : ℝ => x : ℝ → ℝ) := by
                rw [IsConvex_def]
                intro u hu v hv s hs
                simp_all [hT, Set.mem_Icc, Pi.mul_apply]
                <;> nlinarith
              exact h₅₅
            · constructor
              · 
                have h₅₅ : ContinuousOn (fun x : ℝ => x : ℝ → ℝ) T := by
                  apply continuousOn_id
                exact h₅₅
              · 
                have h₅₅ : P t (fun x : ℝ => x : ℝ → ℝ) := by
                  rw [P_def]
                  norm_num
                  <;>
                  (try norm_num) <;>
                  (try linarith) <;>
                  (try nlinarith)
                exact h₅₅
      have h₆ : (fun x : ℝ => x) * (fun x : ℝ => x) ∈ S t := h₄ (fun x : ℝ => x) h₅ (fun x : ℝ => x) h₅
      have h₇ : (fun x : ℝ => x) * (fun x : ℝ => x) = (fun x : ℝ => x * x : ℝ → ℝ) := by
        funext x
        <;> simp [Pi.mul_apply]
        <;> ring
      rw [h₇] at h₆
      have h₈ : (fun x : ℝ => x * x : ℝ → ℝ) ∈ S t := h₆
      have h₉ : (fun x : ℝ => x * x : ℝ → ℝ) ∈ {f : ℝ → ℝ | (∀ x ∈ T, f x ≥ 0) ∧ StrictMonoOn f T ∧ IsConvex f ∧ ContinuousOn f T ∧ P t f} := by
        simpa [h₃] using h₈
      have h₁₀ : P t (fun x : ℝ => x * x : ℝ → ℝ) := h₉.2.2.2.2
      have h₁₁ : (fun x : ℝ => x * x : ℝ → ℝ) 1 - 2 * (fun x : ℝ => x * x : ℝ → ℝ) (2 / 3 : ℝ) + (fun x : ℝ => x * x : ℝ → ℝ) (1 / 3 : ℝ) ≥ t * ((fun x : ℝ => x * x : ℝ → ℝ) (2 / 3 : ℝ) - 2 * (fun x : ℝ => x * x : ℝ → ℝ) (1 / 3 : ℝ) + (fun x : ℝ => x * x : ℝ → ℝ) 0) := by
        rw [P_def] at h₁₀
        exact h₁₀
      norm_num at h₁₁
      <;>
      (try norm_num at h₁₁) <;>
      (try linarith) <;>
      (try nlinarith)
  have h_final : ((fun t : ℝ => 1 ≥ t) : ℝ → Prop ) t ↔ t ≤ 1 := by
    constructor <;> intro h <;> simp_all [ge_iff_le]
    <;>
    (try norm_num at h ⊢) <;>
    (try linarith) <;>
    (try nlinarith)
  have h_result : ((fun t : ℝ => 1 ≥ t) : ℝ → Prop ) t ↔ (∀ f ∈ S t, ∀ g ∈ S t, f * g ∈ S t) := by
    rw [h_final]
    exact h_main
  exact h_result