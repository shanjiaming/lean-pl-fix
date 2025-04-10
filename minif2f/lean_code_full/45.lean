import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the tens digit in the sum $11^1 + 11^2 + 11^3 + \ldots + 11^9$? Show that it is 5.-/
theorem mathd_numbertheory_24 : (∑ k in Finset.Icc 1 9, 11 ^ k) % 100 = 59 := by
  -- First, expand the sum to make it explicit
  have sum_expand : (∑ k in Finset.Icc 1 9, 11 ^ k) = 11^1 + 11^2 + 11^3 + 11^4 + 11^5 + 11^6 + 11^7 + 11^8 + 11^9 := by
    rw [Finset.sum_eq_add_sum_ite (s := Finset.Icc 1 9)]
    simp only [Finset.mem_Icc, ite_true, Nat.cast_id]
  
  -- We'll compute the sum modulo 100 by computing each term modulo 100
  -- First, compute each 11^k mod 100 for k from 1 to 9
  have pow1 : 11^1 % 100 = 11 := by norm_num
  have pow2 : 11^2 % 100 = 21 := by norm_num
  have pow3 : 11^3 % 100 = 31 := by rw [pow_succ, pow2]; norm_num
  have pow4 : 11^4 % 100 = 41 := by rw [pow_succ, pow3]; norm_num
  have pow5 : 11^5 % 100 = 51 := by rw [pow_succ, pow4]; norm_num
  have pow6 : 11^6 % 100 = 61 := by rw [pow_succ, pow5]; norm_num
  have pow7 : 11^7 % 100 = 71 := by rw [pow_succ, pow6]; norm_num
  have pow8 : 11^8 % 100 = 81 := by rw [pow_succ, pow7]; norm_num
  have pow9 : 11^9 % 100 = 91 := by rw [pow_succ, pow8]; norm_num

  -- Now sum all these values modulo 100
  -- First compute the raw sum: 11 + 21 + 31 + 41 + 51 + 61 + 71 + 81 + 91
  have sum_raw := calc
    11 + 21 = 32 := by norm_num
    _ + 31 = 63 := by norm_num
    _ + 41 = 104 := by norm_num
    _ + 51 = 155 := by norm_num
    _ + 61 = 216 := by norm_num
    _ + 71 = 287 := by norm_num
    _ + 81 = 368 := by norm_num
    _ + 91 = 459 := by norm_num

  -- Now take modulo 100 of the total sum
  have sum_mod : 459 % 100 = 59 := by norm_num

  -- Combine all the facts to prove the theorem
  rw [sum_expand]
  rw [Nat.add_mod, Nat.add_mod, Nat.add_mod, Nat.add_mod, Nat.add_mod, 
      Nat.add_mod, Nat.add_mod, Nat.add_mod]
  rw [pow1, pow2, pow3, pow4, pow5, pow6, pow7, pow8, pow9]
  rw [sum_raw]
  exact sum_mod