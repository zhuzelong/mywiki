:algorithm:

# Monte Carlo, MCMC and Gibbs Sampling

Refer to the [blog](http://cos.name/2013/01/lda-math-mcmc-and-gibbs-sampling/)


## Motivation

Q: Given a distribution, how to sample (generate points) following the distribution?

Most of the distribution sampling is based on uniform distribution.


## Use markov chain for sampling

如果我们能构造一个转移矩阵为P的马氏链，使得该马氏链的平稳分布恰好是p(x), 那么我们从任何一个初始状态x0出发沿着马氏链转移, 得到一个转移序列 x0,x1,x2,⋯xn,xn+1⋯, 如果马氏链在第n步已经收敛了，于是我们就得到了 π(x)的样本xn,xn+1⋯


引入“接受率”（转移的概率）使得马尔可夫平稳条件对于任意点都成立，并根据对称性确定两个接受率的公式取值。


## Gibbs sampling

MCMC在高维（二元、多元）空间的应用，本质上是依次在各个维度（轴）上使用一元MCMC。
