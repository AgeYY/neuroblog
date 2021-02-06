---
title: Dynamics for Working Memory and Time Encoding
date:
categories: Ref Reading
tags:
- RNN
- Dynamical System
- Working Memory
toc: true
thumbnail: /neuroblog/2021/02/06/dynWM/dynWM.png
---

How information is encoded in working memory? See power point [here](dynWM.pdf). 

<!-- more -->

Summary
===

To maximize the future rewards of the changing world, we must be able to discover the temporal structure of the stimulus and react accordingly at the right time. So what is the underlying mechanism of encoding information in working memory? To address this problem, [[Christopher Cueva, et al., 2020]](https://doi.org/10.1073/pnas.1915984117) summarized three hypotheses: information is stored in attractors, low dimensional trajectory, and high dimensional chaotic trajectory, and tested them experimentally. They showed time can be decoded with high precision in task where timing information is relevant. The neural trajectory is always in low dimension. This implies that low dimensional representation is a promising mechanism for working memory.

Comment
===
I am pretty interested in the data analysis method of this paper.

Within the attractor hyperthesis, the neural activity of two time points in the delay period should be quite similar. In the paper, they measure the similarity by classification. Firstly, in a single trial, the neural activity in each time point (with time-averaged small interval) is actually a dot in the high dimensional space. So the similarity of two time points can be measured directly by their distance. However, the experimental data contains noise, therefore they considered all trials as many dots in the high dimensional space. Type 1 dots are the representation of time interval 1, type 2 dots are the representation of time interval 2. A classifier can be used to classify these two categories. The classification accuracy then is the measure of the similarity: high accuracy means low similarity.

Another method is the measuring of dimensionality. They split the data to train and test sets. Training data is projected into low dimensional space by PCA. The dimensionality is defined as the numbers of principal components when the error between the projected training data and test data are minimized. The philosophy of this method is that both training data and test are constructed from same kernel vectors plus independent noise. The first few principal components capture the kernel vector. By gradually increasing the number of PCs, the projected training data become similar to the test data. However, too many PCs will also capture the noise, which will also lead to error. So when the error is minimized, only the dimensionality of the true kernel will be captured, this is the dimensionality of the task.

I would like to compare this method with another simple one proposed by [[Peiran Gao, et al., 2017]](https://ganguli-gang.stanford.edu/pdf/17.theory.measurement.pdf). Dimensions is defined as the number of PCs which can explain a threshold of variance (such 70%). The advantage of this method is its simplicity. However, this method is based on human intuition on the threshold. It can either fail to capture the kernel vectors (too low threshold), or also include the dimension of noise (too high threshold).

Finally, the paper's result is also related to my recent result. I built an RNN to learn simple tasks. Its neural activity is plotted in low dimensional space by PCA, which showed a quite smooth trajectory. However, this does not mean that the working memory has no attractors. In the decision-making task, if I extend the delay time, finally the trajectory will converge to two attractors, despite the RNN is only trained in a short time. While in the encoding spatial information task, the long term behavior of RNN will diverge. It is indeed an interesting topic to explore how the neural circuit encoding discrete information and continuous information. 
