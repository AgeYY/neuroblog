---
title: Theory of Grid Cell
date: 2020-09-28 12:10:38
categories: Ref Reading
toc: true
thumbnail: /neuroblog/2020/09/28/gridcell/gridpattern.jpg
---

An brief overview on my talk, _Theory of Grid cell_. Please refer to my [powerpoint](gridcell.pdf) for figures and more detail.

<!-- more -->

Overview of the Talk
==========

Navigation is one of the fundamental cognitive ability exist in a wide range of animals. Yet its mechanism remains unclear. There are several types of cells are related to this ability. For example, Place cell has a receptive field to only one particular location ([video](https://www.youtube.com/watch?v=km4203tZXnY)). Grid cell has fasnating hexagonal receptive field ([Nancy's talk](https://www.youtube.com/watch?v=CQPswbIuCkk), more biological properties please refer the original paper [[Torkel Hafting et al., 2005]](https://www.nature.com/articles/nature03721)). The biological meaning of the place cell is obvious, yet how the hexagonal pattern assist the agent to navigate remains unclear. Mechanistic Model succeeded in reproducing the hexagonal pattern though manually constructing the wiring of the grid cell networks.[[Y Burak & I Fiete, 2009]](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000291)[[M Fuhs et al, 2006]](https://www.jneurosci.org/content/26/16/4266) Yet it didn't convincely exlain why should the cells has such architechture. 

Nomative model, on the other hand, have much clearer picture by connecting the grid cell with the place cell or/and head cell etc. 1-layer model used the place cell information as input, few numbers as output, and Hebb rule as learning algorithm, plus a non-negative constrain, to do an unsupervised learning. The weight between input and output layer superisingly has the hexagonal pattern. [[Yedidyah Dordek et al.]](https://elifesciences.org/articles/10094). This network can be interpreted as an encoder, which encodes the place cell information to few numbers. Therefore grid cell will naturally occur if you want to conpress the place cell information.

The second nomative model is based on the RNN[[C Cueva & X wei, 2018]](https://arxiv.org/abs/1803.07770). The velocity (speed and direction) of the agent is the input, the output is the place cell information. RNN is used as the hidden layer to convert velocity into location. After traning with sufficient data, the hidden unit apears to have hexagonal receptive field. Furthermore, other type of cells, such as border cell and band cell are also observed. Therefore, grid cell in here is for decoding velocity into location.

The above models can be unified with one theory [[Ben Sorscher et al., 2019]](https://papers.nips.cc/paper/9191-a-unified-theory-for-the-origin-of-grid-cells-through-the-lens-of-pattern-formation). The common sub-problem in the two nomative model is how can you related the grid cell to produce the place cell information. Therefore the following loss function is constructed
\begin{equation}
L = \| P - \hat{P} \|,
\label{loss}
\end{equation} where $P$ is the place cell information, $\hat{P}$ is the predicted place cell information based on the grid cell. With some simplification, the author analytically showed the grid pattern will occur while minimizing this loss function, so the two nomative models are unified. While the dynamic equation in the mechanistic model is only the gradient descent equation of the Lagrangian of eqaution (\ref{loss}). 

Disscusion
===
[[Ben Sorscher et al., 2019]](https://papers.nips.cc/paper/9191-a-unified-theory-for-the-origin-of-grid-cells-through-the-lens-of-pattern-formation) gave very good conclusion on the grid cell problem. Here I only mention my one thought.

The above theory not only partially solved the grid cell problem, but also showed a very clear logic of how can we understanding our brain. The first step is to construct a proper artificial network which can reproduce at least some properties of the sensory cortex. This should be done by creativly setting the architechture, learning rule and objective function. This re-representation could offer clear explaination of the original biological cortex (for example, see visual cortex in my another [post](https://ageyy.github.io/neuroblog/2020/09/16/hcnn/)). Then, a theory should be applied in explaining the artificial neural network, which can offer more insight on how our brain works.

