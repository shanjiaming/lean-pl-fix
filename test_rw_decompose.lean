import Mathlib
import Aesop

set_option maxHeartbeats 0  -- Disable heartbeat limit to prevent timeout during proof checking

open BigOperators Real Nat Topology Rat  -- Open common mathematical namespaces

theorem mathd_algebra_182 (y : ℂ) : 7 * (3 * y + 2) = 21 * y + 14 := by
  -- 第一种方式：使用多项式一起重写
  rw [mul_add, mul_assoc]
  norm_num

theorem mathd_algebra_182_decomposed (y : ℂ) : 7 * (3 * y + 2) = 21 * y + 14 := by
  -- 第二种方式：分解为单独的rw步骤
  rw [mul_add]
  rw [← mul_assoc]  -- 注意这里使用了左箭头，表示反向应用
  norm_num

#check @mul_assoc  -- 检查mul_assoc定理的类型 