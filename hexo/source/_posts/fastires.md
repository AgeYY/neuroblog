---
title: Noninvasive electromagnetic source imaging of spatiotemporally distributed epileptogenic brain sources 
date: 2020-10-20 10:30:42
categories: Ref Reading
tags:
- EEG/MEG
- Epilepsy
- Electrophysiological Source Imaging 
toc: true
thumbnail: /neuroblog/2020/10/20/fastires/fastires.jpg
---

A summary of [Abbas Sohrabpour, et al](https://www.nature.com/articles/s41467-020-15781-0). More detail please refer to the original paper or my [powerpoint](fastires.pdf).

<!-- more -->

Summary
====
Understanding the dynamics of our brain network is not only important for cognitive science, but also for clinical applications. A good spatiotemperal imaging method should occupy at least three characteristics: high spatial resolution, high temporal resolution and wide spatial convergence. Traditional methods unfortrunately cannot satisfy the three all. fMRI has good spatial resolution and extent, yet poor temporal resolution. Invasive method (e.g, iEEG) have the first two properties but can measure only a small region, and may cause infection. EEG/MEG on the other hand has the latter two properties. How to improve the spatial resolution falls one of the central issues in computational neuroscience.

EEG electrode is actually measuring the summation of potential from all neurons. The activation of a small population of neurons is often characterized as a dipole. With this simplification, the detected signal (scalp potential) can be calculated by the Maxwell equation [[Neuronal Basics of EEG / MEG]](http://epileptologie-bonn.de/cms/upload/homepage/lehnertz/FBitzer_Neuronal_basics_EEGMEG.pdf). Distributed model discretizes the brain into a lot of voxels, each voxel contains one dipole. Hence we derived the discretized form of the EEG-dipole relation.
\begin{equation}
\phi = A s + n
\end{equation} where $\phi$ is the EEG signal, $s$ is a vector contains the parameters of all dipoles, and $A$ is a constant matrix. For example, the activation of a particular region of the brain is equivalent to some elements of $s$ are larger than those nearby dipoles. $n$ is the noise.

Forward problem, i.e. knowing $s$ to calculate $\phi$, is easy. Yet its inverse problem, from $\phi$ to $s$ is ill-posed. Naively we would like to minimize the L2 norm
\begin{equation}
s^{est} = argmin_s |\phi - As|_2.
\label{l2norm}
\end{equation} Yet there are many more parameters than electrodes. Thus we need to add a penalty to the number of parameters. Finally equation (\ref{l2norm}) can be reformulated as [[Sohrabpour, A., et al., (2016)]](https://doi.org/10.1016/j.neuroimage.2016.05.064)
\begin{equation}
s^{est} = argmin_s |V s|_1 + \alpha |s|_1
\end{equation} subject to
\begin{equation}
(\phi - As) \Sigma^{-1} (\phi - As) < \beta
\end{equation} where $V$ is the gradient operator which introduce a strong penalty on the number and strength of the edges of the activation region. $\alpha$ is a hyperparameter but can be evaluated through L-curve [[Sohrabpour, A., et al., (2016)]](https://doi.org/10.1016/j.neuroimage.2016.05.064). Minimizing the first term is trying to make the activation of neurons aggregate into limited regions. $\Sigma$ is the correlation of the noise. And $\beta$ controls the tolerence of noise level. If the distribution of the noise is known, $\beta$ can be estimated properly. Overall, this optimization problem can be solved numerically.

Now we could let time involved. By using ICA, the scalp potential can be decomposed into spatial and temporal conponents. This temporal basis should consist with the underlying sources, i.e.
\begin{equation}
\boldsymbol{s}(t) = \Sigma_i \boldsymbol{s_i} \otimes \boldsymbol{a}_i(t)
\end{equation} where we project source $s$ into subregions of the brain, $s_i$, and only look on the overall evolution of the region with time, instead of looking into every voxels. Similar with the above procedure, we could again construct a correspond optimization problem to solve $\boldsymbol{s}(t)$ from $\boldsymbol{\phi}(t)$ numerically.

Disscusion
===

FAST-IRES is an effective method for revealing the spatiotemporal information of the brain network. It has the following main features:

1. Only few parameters need to be adjusted manually. This can largely decrease the human bias.
2. Easy to distinguish the source region from the background. The gradient operator add strong penalty on the edge of the active region. Thus only limited number of active regions are allowed.
3. Noninvasive. This is quite important in practice. Since invasive methods (e.g. iEEG) is expensive and could possibly cause infection.
