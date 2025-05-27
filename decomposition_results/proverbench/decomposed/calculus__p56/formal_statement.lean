theorem max_integral_value :
IsMaxOn (fun f => ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2)) {f | Continuous f} f →
(∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2)) = 1/16 :=