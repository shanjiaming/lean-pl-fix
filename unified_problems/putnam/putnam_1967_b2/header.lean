import Mathlib

open Nat Topology Filter

/--
Let $0 \leq p \leq 1$ and $0 \leq r \leq 1$ and consider the identities
\begin{enumerate}
\item[(a)] $(px+(1-p)y)^2=Ax^2+Bxy+Cy^2$,
\item[(b)] $(px+(1-p)y)(rx+(1-r)y)=\alpha x^2+\beta xy+\gamma y^2$.
\end{enumerate}
Show that (with respect to $p$ and $r$)
\begin{enumerate}
\item[(a)] $\max\{A,B,C\} \geq 4/9$,
\item[(b)] $\max\{\alpha,\beta,\gamma\} \geq 4/9$.
\end{enumerate}
-/