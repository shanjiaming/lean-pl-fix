import Mathlib

open EuclideanGeometry Topology Filter Complex

-- 1 / 2
/--
Find $$\lim_{n \to \infty} \int_{0}^{1} \int_{0}^{1} \cdots \int_{0}^{1} \cos^2\left(\frac{\pi}{2n}(x_1 + x_2 + \cdots + x_n)\right) dx_1 dx_2 \cdots dx_n.$$
-/