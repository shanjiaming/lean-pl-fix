import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the sum of the smallest and second-smallest positive integers $a$ satisfying the congruence $$27a\equiv 17 \pmod{40}~?$$ Show that it is 62.-/
theorem mathd_numbertheory_42 (S : Set ℕ) (u v : ℕ) (h₀ : ∀ a : ℕ, a ∈ S ↔ 0 < a ∧ 27 * a % 40 = 17)
    (h₁ : IsLeast S u) (h₂ : IsLeast (S \ {u}) v) : u + v = 62 := by
  -- First, we need to find all positive integers a satisfying 27a ≡ 17 mod 40
  -- This is equivalent to solving the linear congruence equation 27a ≡ 17 (mod 40)
  
  -- Step 1: Find the modular inverse of 27 modulo 40
  -- We need to find an integer x such that 27x ≡ 1 (mod 40)
  -- Using the Extended Euclidean Algorithm:
  -- gcd(27, 40) = 1 = 3*40 - 4*27 ⇒ -4 is an inverse, but we want positive
  -- So we take -4 mod 40 = 36
  -- Thus, the inverse of 27 mod 40 is 3 (since 27*3 = 81 ≡ 1 mod 40)
  
  -- Step 2: Multiply both sides of the congruence by the inverse to solve for a
  -- a ≡ 17 * 3 ≡ 51 ≡ 11 mod 40
  -- So the general solution is a = 11 + 40k for integer k ≥ 0
  
  -- Step 3: Find the smallest positive solutions
  -- When k=0: a=11 (smallest solution)
  -- When k=1: a=51 (second smallest solution)
  
  -- Now we verify these solutions in Lean
  
  -- First, prove that u must be 11
  have u_eq_11 : u = 11 := by
    -- Show that 11 is in the set S
    have h11 : 11 ∈ S := by
      rw [h₀]
      refine ⟨by norm_num, ?_⟩  -- 0 < 11 and need to show 27*11 ≡ 17 mod 40
      simp only [Nat.cast_ofNat]
      rw [show 27 * 11 = 297 by rfl]
      norm_num [show 297 % 40 = 17 by rfl]  -- 297 ÷ 40 = 7*40=280, remainder 17
    
    -- Show that 11 is the least element in S
    apply le_antisymm
    · apply h₁.1 h11  -- u is ≤ all elements of S, including 11
    · show 11 ≤ u
      -- Any element in S must be ≡ 11 mod 40 and positive
      -- The smallest such element is 11
      have hu : u ∈ S := h₁.2
      rw [h₀] at hu
      obtain ⟨hu_pos, hu_mod⟩ := hu
      -- Since u ≡ 11 mod 40, u = 11 + 40k for some k ≥ 0
      -- The smallest positive solution occurs when k=0
      have h_cong : u ≡ 11 [MOD 40] := by
        rw [Nat.ModEq, hu_mod]
        norm_num [show 27 * 11 % 40 = 17 by rfl]
      obtain ⟨k, hk⟩ := h_cong
      rcases k with _ | k
      · simp [hk]  -- k=0 case
      · have : u = 11 + 40 * (k + 1) := hk
        linarith [hu_pos]  -- forces u ≥ 51 > 11
  
  -- Now prove that v must be 51
  have v_eq_51 : v = 51 := by
    -- First show 51 ∈ S \ {11}
    have h51 : 51 ∈ S \ {11} := by
      refine ⟨?_, by simp [u_eq_11]⟩  -- 51 ∈ S and 51 ≠ 11
      rw [h₀]
      refine ⟨by norm_num, ?_⟩  -- 0 < 51 and need to show 27*51 ≡ 17 mod 40
      norm_num [show 27 * 51 = 1377 by rfl]
      rw [show 1377 % 40 = 17 by norm_num]  -- 1377 ÷ 40 = 34*40=1360, remainder 17
    
    -- Show that 51 is the least element in S \ {11}
    apply le_antisymm
    · apply h₂.1 h51  -- v is ≤ all elements of S \ {11}, including 51
    · show 51 ≤ v
      have hv : v ∈ S \ {11} := h₂.2
      rw [Set.mem_diff, Set.mem_singleton_iff, h₀] at hv
      obtain ⟨⟨hv_pos, hv_mod⟩, hv_ne⟩ := hv
      -- Since v ≡ 11 mod 40, v = 11 + 40k for some k ≥ 0
      have h_cong : v ≡ 11 [MOD 40] := by
        rw [Nat.ModEq, hv_mod]
        norm_num [show 27 * 11 % 40 = 17 by rfl]
      obtain ⟨k, hk⟩ := h_cong
      -- v ≠ 11 ⇒ k ≠ 0
      rcases k with _ | k
      · simp [hk] at hv_ne  -- contradicts hv_ne
      · have : v = 11 + 40 * (k + 1) := hk
        cases k
        · simp  -- k=0 ⇒ v=51
        · rename_i k
          linarith [hv_pos]  -- forces v ≥ 91 > 51
  
  -- Finally, compute the sum
  rw [u_eq_11, v_eq_51]
  norm_num