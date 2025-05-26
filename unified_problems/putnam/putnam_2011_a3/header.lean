import Mathlib

open Topology Filter

-- Note: There may be multiple possible correct answers.
-- (-1, 2 / Real.pi)
/--
Find a real number $c$ and a positive number $L$ for which $\lim_{r \to \infty} \frac{r^c \int_0^{\pi/2} x^r\sin x\,dx}{\int_0^{\pi/2} x^r\cos x\,dx}=L$.
-/