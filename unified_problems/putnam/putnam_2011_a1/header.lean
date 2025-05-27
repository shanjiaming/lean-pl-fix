import Mathlib

-- 10053
/--
Define a \emph{growing spiral} in the plane to be a sequence of points with integer coordinates $P_0=(0,0),P_1,\dots,P_n$ such that $n \geq 2$ and:
\begin{itemize}
\item the directed line segments $P_0P_1,P_1P_2,\dots,P_{n-1}P_n$ are in the successive coordinate directions east (for $P_0P_1$), north, west, south, east, etc.;
\item the lengths of these line segments are positive and strictly increasing.
\end{itemize}
How many of the points $(x,y)$ with integer coordinates $0 \leq x \leq 2011,0 \leq y \leq 2011$ \emph{cannot} be the last point, $P_n$ of any growing spiral?
-/