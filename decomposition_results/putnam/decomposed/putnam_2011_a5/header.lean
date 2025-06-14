import Mathlib

open Topology Filter Matrix

/--
Let $F:\mathbb{R}^2 \to \mathbb{R}$ and $g:\mathbb{R} \to \mathbb{R}$ be twice continuously differentiable functions with the following properties:
\begin{itemize}
\item $F(u,u)=0$ for every $u \in \mathbb{R}$;
\item for every $x \in \mathbb{R}$, $g(x)>0$ and $x^2g(x) \leq 1$;
\item for every $(u,v) \in \mathbb{R}^2$, the vector $\nabla F(u,v)$ is either $\mathbf{0}$ or parallel to the vector $\langle g(u),-g(v) \rangle$.
\end{itemize}
Prove that there exists a constant $C$ such that for every $n \geq 2$ and any $x_1,\dots,x_{n+1} \in \mathbb{R}$, we have $\min_{i \neq j} |F(x_i,x_j)| \leq \frac{C}{n}$.
-/