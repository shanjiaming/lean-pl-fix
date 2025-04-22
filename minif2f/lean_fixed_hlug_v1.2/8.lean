import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the average of the two smallest positive integer solutions to the congruence $$14u \equiv 46 \pmod{100}~?$$ Show that it is 64.-/
theorem mathd_numbertheory_13 (u v : ℕ) (S : Set ℕ)
  (h₀ : ∀ n : ℕ, n ∈ S ↔ 0 < n ∧ 14 * n % 100 = 46) (h₁ : IsLeast S u)
  (h₂ : IsLeast (S \ {u}) v) : (u + v : ℚ) / 2 = 64 := by
  -- First, we need to find all positive integer solutions to 14n ≡ 46 mod 100
  -- This congruence is equivalent to 14n - 100k = 46 for some integer k
  -- Or simplified to: 7n - 50k = 23 (dividing both sides by 2)

  -- The general solution to 7n ≡ 23 mod 50 can be found using the modular inverse
  -- We first find a particular solution to 7n ≡ 23 mod 50

  -- Compute the modular inverse of 7 modulo 50
  -- Since gcd(7, 50) = 1, the inverse exists
  have h_inv : 7 * 43 ≡ 1 [MOD 50] := by norm_num
  -- Therefore, n ≡ 23 * 43 mod 50 is a particular solution

  -- Compute 23 * 43 mod 50:
  have h_part : 23 * 43 ≡ 39 [MOD 50] := by norm_num
  -- So the general solution is n ≡ 39 mod 50

  -- Now we can express all positive solutions as n = 39 + 50t for t ∈ ℕ₀
  -- Let's find the smallest two positive solutions:

  -- First solution (t = 0): n = 39
  have u_eq : u = 39 := by
    -- Show 39 is in S
    have h39 : 39 ∈ S := by
      rw [h₀]
      refine ⟨by norm_num, ?_⟩
      -- Check 14 * 39 mod 100 = 46
      calc 14 * 39 % 100
        _ = 546 % 100 := by rw [mul_comm]
        _ = 46 := by norm_num
    -- Show it's the least element
    apply le_antisymm
    · apply h₁.1.2 h39
    · -- Any smaller positive natural would have to be <39
      -- Check that numbers 1..38 don't satisfy the condition
      suffices ∀ n < 39, 0 < n → 14 * n % 100 ≠ 46 by
        intro n hn
        rw [h₀] at hn
        exact not_lt.1 (mt (this n) (not_and.1 (not_iff_not.2 hn).1))
      intro n n_lt pos_n
      -- We could check all 38 cases, but here we'll just show the pattern fails
      -- The pattern repeats every 50 numbers, so we only need to check n < 50
      -- and we know the smallest solution is 39
      have : n ≤ 38 := by linarith
      -- For n < 39, 14n mod 100 cycles through values that never hit 46
      -- This is a bit tedious to prove, so we'll use a tactic to check all cases
      interval_cases n
      all_goals { simp [mul_comm, (show 14 * n = n * 14 by rw [mul_comm]) }
      all_goals { norm_num }

  -- Second smallest solution (t = 1): n = 39 + 50 = 89
  have v_eq : v = 89 := by
    -- Show 89 is in S \ {u}
    have h89 : 89 ∈ S \ {u} := by
      rw [mem_diff_singleton, h₀, u_eq]
      refine ⟨⟨by norm_num, ?_⟩, by simp⟩
      -- Check 14 * 89 mod 100 = 46
      calc 14 * 89 % 100
        _ = 1246 % 100 := by rw [mul_comm]
        _ = 46 := by norm_num
    -- Show it's the least element in S \ {39}
    apply le_antisymm
    · apply h₂.1.2 h89
    · -- Any other solution must be ≥89 since the next would be 39 + 100 = 139
      intro n hn
      rw [mem_diff_singleton, h₀, u_eq] at hn
      obtain ⟨⟨pos_n, hn_mod⟩, hn_ne⟩ := hn
      -- We know n ≡ 39 mod 50, so n = 39 + 50k for some k > 0
      -- Since n ≠ 39, k ≥ 1
      -- The next possible value is k=1 giving n=89
      have h_mod : n % 50 = 39 := by
        rw [Nat.mod_eq_of_lt]
        · have : 14 * n % 100 = 46 := hn_mod
          rw [← Nat.mod_eq_of_lt (n_lt := ?_)] at this
          · have : 7 * n % 50 = 23 := by
              rw [← Nat.ModEq] at this ⊢
              have : 100 = 2 * 50 := by norm_num
              rw [this] at this
              exact Nat.ModEq.of_mul_right 2 this
            rw [← Nat.modEq_iff_dvd' (by norm_num : 39 < 50)]
            apply Nat.ModEq.symm
            rw [Nat.modEq_iff_dvd']
            -- 7n ≡ 23 mod 50 → n ≡ 23 * 43 mod 50 ≡ 39 mod 50
            rw [← this]
            norm_num
          · linarith
        · have : n ≠ 39 := by simpa using hn_ne
          -- Since n is a solution >39, it must be ≥89
          -- because solutions come in the form 39 + 50k
          have : n ≥ 39 + 50 := by
            apply Int.le_of_add_le_add_right
            rw [← zero_add 39]
            apply Int.add_le_add
            · exact Int.ofNat_zero_le _
            · have : 50 ≤ 50 * (n / 50) := by
                apply Nat.mul_le_mul_left
                apply Nat.div_pos (by linarith) (by norm_num)
              rw [← Int.ofNat_le] at this
              exact this
          linarith

  -- Now compute the average of u and v
  rw [u_eq, v_eq]
  -- (39 + 89) / 2 = 128 / 2 = 64
  norm_num