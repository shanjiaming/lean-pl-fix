theorem putnam_2023_a6 (IsValidGame : List ℕ → Prop)
  (IsValidGame_def : ∀ g, IsValidGame g ↔ g.Nodup ∧ (∀ i ∈ g, i ∈ Icc 1 g.length)) (parityOf : List ℕ → ZMod 2)
  (parityOf_def : ∀ g, parityOf g = ((range g.length).filter fun i ↦ g[i]! = i + 1).card)
  (ConformsToStrategy : List ℕ → (List ℕ → ℕ) → Prop)
  (ConformsToStrategy_def : ∀ g s, ConformsToStrategy g s ↔ ∀ (i) (h : i < g.length), Odd i → g[i] = s (g.take i))
  (IsWinningFor : ℕ → (List ℕ → ℕ) → Prop)
  (IsWinningFor_def :
    ∀ n s, IsWinningFor n s ↔ ∃ p, ∀ g, g.length = n → IsValidGame g → ConformsToStrategy g s → parityOf g = p) :
  {n : ℕ | 0 < n ∧ ∃ s, IsWinningFor n s} = (({n : ℕ | 0 < n}) : Set ℕ):=
  by
  have h_subset : {n : ℕ | 0 < n ∧ ∃ s, IsWinningFor n s} ⊆ {n : ℕ | 0 < n}:=
    by
    --  intro n hn
    --  simp only [Set.mem_setOf_eq, Set.mem_singleton_iff] at hn ⊢
    --  exact hn.1
    hole
  have h_superset : {n : ℕ | 0 < n} ⊆ {n : ℕ | 0 < n ∧ ∃ s, IsWinningFor n s}:=
    by
    --  intro n hn
    have hn' : 0 < n:= by -- simpa using hn
      simpa
    have h₁ : ∃ s, IsWinningFor n s:= by
      --  use fun _ => 0
      --  rw [IsWinningFor_def]
      --  by_cases hn₁ : n = 1
      --  · subst hn₁
      --    use 1
      --    intro g hg₁ hg₂ hg₃
        have h₂ : g = [1]:= by
          have h₃ := hg₂
          --  rw [IsValidGame_def] at h₃
          have h₄ : g.Nodup := h₃.1
          have h₅ : ∀ i ∈ g, i ∈ Icc 1 g.length := h₃.2
          have h₆ : g.length = 1:= by -- simpa using hg₁
            linarith
          have h₇ : g = [1]:=
            by
            have h₈ : g ≠ []:= by
              --  intro h₉
              --  simp_all
              hole
            have h₉ : g.length = 1:= by -- simpa using hg₁
              linarith
            have h₁₀ : g ≠ []:= by
              --  intro h₁₁
              --  simp_all
              simpa
            have h₁₁ : g.length = 1:= by -- simpa using hg₁
              linarith
            have h₁₂ : g = [1]:= by
              have h₁₃ := h₅
              have h₁₄ : g.Nodup := h₄
              have h₁₅ : ∀ i ∈ g, i ∈ Icc 1 g.length := h₅
              have h₁₆ : g.length = 1:= by -- simpa using hg₁
                linarith
              have h₁₇ : g ≠ []:= by
                --  intro h₁₈
                --  simp_all
                simpa
              have h₁₈ : ∃ (a : ℕ), g = [a]:= by
                --  cases g with
                --  | nil => simp_all
                --  | cons a as =>
                --    cases as with
                --    | nil => use a <;> simp_all [List.length_eq_one]
                --    | cons a' as' => simp_all [List.length_eq_one] <;> aesop
                hole
              --  obtain ⟨a, ha⟩ := h₁₈
              have h₁₉ : a = 1 := by
                have h₂₀ := h₅ a (by simp [ha])
                simp [ha, Icc_self, List.mem_singleton] at h₂₀ <;> aesop
              --  rw [ha, h₁₉] <;> simp_all
              hole
            --  exact h₁₂
            simpa
          --  exact h₇
          hole
      --    rw [h₂]
        have h₃ : parityOf [1] = 1 := by
          have h₄ := parityOf_def [1]
          simp [parityOf_def, List.get!, List.range_succ, List.range_zero, List.filter, List.cons, List.nil, List.length,
                  List.get] at h₄ ⊢ <;>
                norm_num [ZMod.val_add, ZMod.val_one, Nat.mod_eq_of_lt] at h₄ ⊢ <;>
              simp_all (config := { decide := true }) <;>
            aesop
      --    simpa using h₃
      --  · use 0
      --    intro g hg₁ hg₂ hg₃
        have h₂ : g.length = n := by simpa using hg₁
        have h₃ : IsValidGame g := hg₂
        have h₄ : ConformsToStrategy g (fun _ => 0) := by simpa using hg₃
        have h₅ : False := by
          have h₆ := h₄
          rw [ConformsToStrategy_def] at h₆
          have h₇ : ∀ (i) (h : i < g.length), Odd i → g[i] = (fun _ => 0 : List ℕ → ℕ) (g.take i) := by simpa using h₆
          have h₈ : n > 1 := by
            by_contra h
            have h₉ : n ≤ 1 := by linarith
            have h₁₀ : n = 1 := by omega
            contradiction
          have h₉ : 1 < g.length := by omega
          have h₁₀ : ∃ i, i < g.length ∧ Odd i := by
            use 1
            constructor
            · omega
            · simp [Nat.odd_iff_not_even, parity] <;> decide
          obtain ⟨i, hi₁, hi₂⟩ := h₁₀
          have h₁₁ : g[i] = (fun _ => 0 : List ℕ → ℕ) (g.take i) := h₇ i hi₁ hi₂
          have h₁₂ : (fun _ => 0 : List ℕ → ℕ) (g.take i) = 0 := by simp
          have h₁₃ : g[i] = 0 := by simpa [h₁₂] using h₁₁
          have h₁₄ : IsValidGame g := hg₂
          rw [IsValidGame_def] at h₁₄
          have h₁₅ : g.Nodup := h₁₄.1
          have h₁₆ : ∀ i ∈ g, i ∈ Icc 1 g.length := h₁₄.2
          have h₁₇ : g[i] ≥ 1 :=
            by
            have h₁₈ : g[i] ∈ g := by
              have h₁₉ : i < g.length := hi₁
              have h₂₀ : g[i] ∈ g := by
                have h₂₁ : i < g.length := hi₁
                have h₂₂ : g[i] ∈ g := by apply List.get_mem <;> simp_all
                exact h₂₂
              exact h₂₀
            have h₂₁ : g[i] ∈ Icc 1 g.length := h₁₆ (g[i]) h₁₈
            have h₂₂ : 1 ≤ g[i] ∧ g[i] ≤ g.length := by simpa [Icc, List.mem_range] using h₂₁
            linarith
          linarith
      --    exfalso
      --    exact h₅
      hole
    --  exact ⟨hn', h₁⟩
    hole
  have h_main : {n : ℕ | 0 < n ∧ ∃ s, IsWinningFor n s} = ({n : ℕ | 0 < n} : Set ℕ) := by
    apply Set.Subset.antisymm h_subset h_superset
  --  exact h_main
  simpa