-- 简单的测试例子，不需要外部库
theorem simple_theorem (a b c : Nat) : a * (b * c) = (a * b) * c := by
  -- 直接使用rw [mul_assoc] 应该可以证明
  rw [mul_assoc]

theorem decomposed_theorem (a b c : Nat) : a * (b + c) = a * b + a * c := by
  -- 直接使用rw [mul_add] 应该可以证明
  rw [mul_add] 