import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Evaluate $\left\lceil\sqrt{27}\right\rceil - \left\lfloor\sqrt{26}\right\rfloor$. Show that it is 1.-/
theorem mathd_algebra_151 : Int.ceil (Real.sqrt 27) - Int.floor (Real.sqrt 26) = 1 := by
  -- First, we compute approximate values of sqrt(26) and sqrt(27) to understand their range
  -- We know that 5^2 = 25 and 6^2 = 36, so both sqrt(26) and sqrt(27) are between 5 and 6

  -- Let's first establish that 5 < sqrt(26) < 6
  have h26_gt_5 : (5 : ℝ) < Real.sqrt 26 := by
    rw [lt_sqrt (by norm_num) (by norm_num)]
    norm_num
  have h26_lt_6 : Real.sqrt 26 < 6 := by
    rw [sqrt_lt (by norm_num) (by norm_num)]
    norm_num

  -- Similarly, establish that 5 < sqrt(27) < 6
  have h27_gt_5 : (5 : ℝ) < Real.sqrt 27 := by
    rw [lt_sqrt (by norm_num) (by norm_num)]
    norm_num
  have h27_lt_6 : Real.sqrt 27 < 6 := by
    rw [sqrt_lt (by norm_num) (by norm_num)]
    norm_num

  -- Now we can compute the floor and ceiling values
  -- Since 5 < sqrt(26) < 6, its floor must be 5
  have floor_sqrt26 : Int.floor (Real.sqrt 26) = 5 := by
    apply Int.floor_eq_iff.mpr
    constructor
    · exact h26_gt_5
    · exact h26_lt_6

  -- Similarly, since 5 < sqrt(27) < 6, we need to determine if it's less than or greater than 5.2
  -- Because 5.2^2 = 27.04 > 27, we know sqrt(27) < 5.2
  -- But we need more precision to determine the ceiling
  -- Compute 5.196^2 ≈ 27 (since 3*3*3 = 27 and sqrt(3) ≈ 1.732, so 3*sqrt(3) ≈ 5.196)
  -- More precisely, let's show sqrt(27) > 5.196

  have h27_gt_5196 : (5196/1000 : ℝ) < Real.sqrt 27 := by
    rw [lt_sqrt (by norm_num) (by norm_num)]
    norm_num
    norm_cast
    rw [div_pow, Rat.cast_pow, Rat.cast_ofNat]
    norm_num

  -- Since 5.196 < sqrt(27) < 5.2 < 6, the ceiling must be 6
  have ceil_sqrt27 : Int.ceil (Real.sqrt 27) = 6 := by
    apply Int.ceil_eq_iff.mpr
    constructor
    · exact h27_lt_6
    · have : (6 : ℝ) - 1 = 5 := by norm_num
      rw [this]
      exact h27_gt_5196.trans (by norm_num)

  -- Now we can compute the original expression
  rw [ceil_sqrt27, floor_sqrt26]
  -- 6 - 5 = 1
  norm_num