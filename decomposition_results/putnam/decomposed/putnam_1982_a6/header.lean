import Mathlib

open Set Function Filter Topology Polynomial Real

-- False
/--
Let $b$ be a bijection from the positive integers to the positive integers. Also, let $x_1, x_2, x_3, \dots$ be an infinite sequence of real numbers with the following properties:
\begin{enumerate}
\item
$|x_n|$ is a strictly decreasing function of $n$;
\item
$\lim_{n \rightarrow \infty} |b(n) - n| \cdot |x_n| = 0$;
\item
$\lim_{n \rightarrow \infty}\sum_{k = 1}^{n} x_k = 1$.
\end{enumerate}
Prove or disprove: these conditions imply that $$\lim_{n \rightarrow \infty} \sum_{k = 1}^{n} x_{b(k)} = 1.$$
-/