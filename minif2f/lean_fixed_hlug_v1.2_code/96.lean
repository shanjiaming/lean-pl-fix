import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- How many integers $n$ satisfy $0<n<60$ and $4n\equiv 2\pmod 6?$ Show that it is 20.-/
theorem mathd_numbertheory_211 :
  Finset.card (Finset.filter (fun n => 6 ∣ 4 * ↑n - (2 : ℤ)) (Finset.range 60)) = 20 := by
  -- First, we'll simplify the congruence condition 4n ≡ 2 mod 6
  -- The condition 6 ∣ (4n - 2) is equivalent to 4n ≡ 2 mod 6
  -- We can simplify this congruence by dividing both sides by gcd(4,6)=2
  -- This gives us 2n ≡ 1 mod 3
  -- Now we need to solve for n in this simpler congruence

  -- Let's define the predicate we're filtering for
  let pred : ℕ → Prop := fun n => 6 ∣ (4 * n - 2)
  
  -- The simplified predicate after the above reasoning
  let simplified_pred : ℕ → Prop := fun n => n % 3 == 2
  
  -- We'll prove that our original predicate is equivalent to the simplified one
  have equiv_pred : ∀ n, pred n ↔ simplified_pred n := by
    intro n
    -- Original condition: 6 divides (4n - 2)
    -- Which means 4n ≡ 2 mod 6
    -- Dividing by gcd(4,6)=2 gives 2n ≡ 1 mod 3
    -- Multiply both sides by 2 (inverse of 2 mod 3) to get n ≡ 2 mod 3
    constructor
    · intro h
      -- Forward direction: original implies simplified
      have h_mod : (4 * n - 2) % 6 = 0 := Int.mod_eq_zero_of_dvd h
      -- Convert to Nat since we're dealing with positive numbers
      have h_nat : (4 * n - 2) % 6 = 0 := by exact_mod_cast h_mod
      -- Simplify the modulus
      rw [← Nat.modEq_iff_dvd' (by norm_num : 0 ≤ 4 * n - 2)] at h_nat
      rw [Nat.ModEq] at h_nat
      have : 4 * n ≡ 2 [MOD 6] := h_nat
      -- Divide the congruence by 2 (gcd(4,6)=2 divides 2)
      have : 2 * n ≡ 1 [MOD 3] := by
        apply Nat.ModEq.of_mul_left 2
        apply Nat.modEq_of_modEq_mul 6 2
        exact this
      -- Multiply by the modular inverse of 2 mod 3 (which is 2)
      have : n ≡ 2 * 1 [MOD 3] := Nat.ModEq.mul_right' 2 this
      simp [simplified_pred, Nat.ModEq] at this ⊢
      rw [← this]
      norm_num
    · intro h
      -- Reverse direction: simplified implies original
      simp [simplified_pred] at h
      have : n % 3 = 2 := h
      -- Show that n ≡ 2 mod 3
      have : n ≡ 2 [MOD 3] := by rw [Nat.ModEq, this]
      -- Multiply by 2 to get 2n ≡ 4 ≡ 1 mod 3
      norm_num
      -- Multiply by 2 to get 4n ≡ 2 mod 6 (since 6 = 2*3)
      have : 4 * n ≡ 2 [MOD 6] := by
        apply Nat.modEq_mul_of_modEq_of_modEq 2 3
      rw [Nat.ModEq] at this
      simp [pred, Nat.dvd_iff_mod_eq_zero, this]
  
  -- Now we can rewrite our goal using the equivalent simplified predicate
  rw [Finset.card_eq_card_iff_eq_filter]
  -- The simplified filter counts numbers ≡ 2 mod 3 in (0,60)
  have : Finset.filter pred (Finset.range 60) = Finset.filter simplified_pred (Finset.range 60) := by
    apply Finset.filter_congr
    simp [equiv_pred]
  rw [this]
  
  -- Now we need to count how many numbers n in 1..59 satisfy n ≡ 2 mod 3
  -- The numbers are 2, 5, 8, ..., 59
  -- This is an arithmetic sequence with:
  -- First term a₁ = 2
  -- Last term aₙ = 59
  -- Common difference d = 3
  
  -- Calculate how many such numbers exist
  have : Finset.card (Finset.filter simplified_pred (Finset.range 60)) = 20 := by
    -- The range 0..59 is all numbers <60
    -- We want numbers where n ≡ 2 mod 3 and 0 < n < 60
    -- So we're counting n ∈ [1, 59] ≡ 2 mod 3
    
    -- The smallest number is 2 (1 ≡ 1 mod 3, 2 ≡ 2 mod 3)
    -- The largest number is 59 (since 59 ≡ 2 mod 3)
    
    -- The count is floor((59 - 2)/3) + 1 = floor(57/3) + 1 = 19 + 1 = 20
    -- Let's compute this formally
    
    -- First, create the set of numbers we're counting
    let s := Finset.Ico 1 60
    -- Filter for n ≡ 2 mod 3
    let s' := Finset.filter (fun n => n % 3 = 2) s
    
    -- The count should be the same as the size of s'
    have : Finset.card s' = Finset.card (Finset.filter simplified_pred (Finset.range 60)) := by
      rw [Finset.range_eq_Ico, Finset.Ico_filter_lt]
      simp [simplified_pred]
      congr
      ext n
      simp
    
    -- Now compute the cardinality of s'
    rw [← this]
    
    -- The numbers we want are exactly the numbers of form 3k + 2 in [1,59]
    -- The sequence is 2, 5, 8, ..., 59
    -- Number of terms is ((59 - 2)/3) + 1 = (57/3) + 1 = 19 + 1 = 20
    
    -- To compute this formally, we can use the fact that the count is
    -- floor((last - first)/step) + 1
    have : Finset.card s' = ((59 - 2) / 3) + 1 := by
      -- The count of numbers ≡ 2 mod 3 in [1,59] is the same as
      -- the count of numbers ≡ 0 mod 3 in [-1,57] (after subtracting 2)
      -- which is floor(57/3) - floor((-1)/3) = 19 - (-1) = 20
      -- But let's compute it directly
      
      -- The general formula for number of terms in arithmetic sequence:
      -- ((last - first) / step) + 1
      -- For our sequence: first = 2, last = 59, step = 3
      have : ((59 - 2) / 3) + 1 = 20 := by norm_num
      rw [this]
      
      -- To connect this to our filtered set, we can use that the filtered set
      -- is exactly the arithmetic progression
      have : s' = Finset.Ico 2 60 ∩ {n | n % 3 = 2} := by
        simp [s', s, Finset.Ico, Finset.filter]
        ext n
        simp
        constructor
        · intro ⟨h1, h2⟩
          exact ⟨h1.2, h2⟩
        · intro ⟨h1, h2⟩
          exact ⟨⟨by linarith, h1⟩, h2⟩
      
      -- The count of such numbers is indeed 20
      -- We can compute this by observing the sequence properties
      rw [this]
      simp [Finset.card_Ico_filter_mod_eq]
      norm_num
    
    -- Finish the computation
    rw [this]
    norm_num
  
  -- Apply our computation to complete the proof
  exact this