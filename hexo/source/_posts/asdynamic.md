---
title: Autistic Spectrum Disorder From Dynamical Perspective
date:
categories: Ideas
tags:
- RNN
- Dynamical System
- Autistic Spectrum Disorder
toc: true
thumbnail: /neuroblog/2021/01/09/asdynamic/asdynamic.jpg
---

Finding the causes of autistic spectrum disorder (ASD) from the perspective of dynamical system. Thumbnail adapted from [[Shenoy et al. 2013]](https://doi.org/10.1146/annurev-neuro-062111-150509)

<!-- more -->

Abstract
===

Continous changing brain activity can be viewed as a trajectory in the high dimensional state space, with each dimension as a neuron. Mental illness is hyperthesis of the mulfunction of the individual's state space. However, this view seems have not been applyed to the study of autism. Here, we proposed a bit detailed plan which is promising in finding the causes of autism from the dynamical point of view.

Background
====
The brain is believed as an interconnected network with billions of neurons as nodes.
This giant network is possible to be described by a set of equations. Despite we don’t
exactly know the close form of the equation, it has already provided us a new picture – a
dynamic picture of viewing the neuron activities. In this picture, each state of the brain
network is a point in N-dimensional state space (N is the number of neurons). A
dynamical changing of the neuron activity is equivalent to a trajectory in state space.

This dynamical view helps us understand the brain. A common experimental paradigm
used to study the motor cortex is the instructed-delay reaching task. From the dynamical
perspective, the preparatory period brings the neural state to an initial state, so that
neurons can quickly shift to the movement attractor after the ‘Go’ cue [1]. In decision
making, the researcher found the neural states in the state space form a line attractor: a
linear arrangement of stable points with endpoints corresponding to converged decisions
[2]. Chaisangmongkon et al. [3] trained RNN to perform match-to-category (DMC) tasks.
They found that there are stable states connected by robust trajectory tunnels.
Misclassification thus can be interpreted as noise pushing the state outside the correct
channel.

Recently researchers also making efforts to extend this dynamical view to the wholebrain scale, especially in the study of mental illness. The central hypothesis is that
dramatic alternation of the attractor dynamics will cause mental illness. For instance,
failure to integrate information is associated with alteration in line attractor [4].
Obsession is caused by overly steep attractor basins. Too low chaoticity will lead to
reduced cognitive flexibility. Indeed, based on the profound symptom, the Autism brain
should have some unusual features in the state space.

Research Plan
====
Here, we aim to uncover the possible abnormal features in the dynamics of Autism by
three stages. In the first stage, we plan to infer the underlying dynamics of the autism
brain from their fMRI data. The data will be acquired from Autism Brain Imaging Data
Exchange (ABIDE), which contains 1, 000 scanning subjects, with around 500 ASD and
500 normal people. However, inferring the complete dynamics from such low temporal
resolution data (TR = 2 seconds) could be a challenge. Therefore we would like to first
try the traditional methods, such as Hidden Marte Calo Model, or Ising Model. These
models although contain little information of the state space, they can find out simple
features, such as the deepness of the attractor, transitional probability between the
attractor, etc. Indeed, it has been shown in [5] that ASD has abnormal states transition.

In stage 2, we would like to infer more detail with Deep learning, specifically, RNN. Due
to the complexity of the brain data, some modification of the RNN is necessary.
Fortunately, there are several modified architectures available recently from [6]. These
models have been proven robust even when learning the underlying dynamics from the
chaotic system, such as the Lorentz system. In the ideal world, each individual’s fMRI
data can be fed into one particular RNN, so that as the final outcome of this stage, we
have 1, 000 different RNNs as “fake brain”. These machines then are passed to stage 3
for further analysis.

There are lots of existing methods for analyzing RNN from both traditional
Neuroscience, and the recent active Machine Learning community. Traditional ones
would be finding the attractor, and study the linearized approximation behavior near the
attractor. Mature packages (FixPointFinder [7]) have been developed for this kind of
study. We would like to go further, employ novel metrics such as Riemann curvature to
measure the motion of the states in state space.

Overall, the research is supposed to develop step-wise by:
1. Using traditional models, such as HMM and Ising Model to study the simple
dynamical features of the Autism group
2. Training the RNN to learn the underlying dynamics of the individual brain from
fMRI data
3. Analyzing the behavior of an individual's RNN, obtain some novel dynamic
features. These features will be used to compare the ASD group and normal
group, and even tell the individual difference within the ASD group.

Some Comments
===
This is actually an writing assignment. Honestly, after I finished the writing, I realized this plan is unlikely to work. The biggest challenge is still how RNN inffers the underlying dynamics from such sparse, low temporal-resolution data. Anyway, we could use EEG instead. Another problem is that, the brain dynamics could be far complex, which is unlikely to be learned by RNN. In the worst case, people doing this plan could struggle to design RNN architectures to do the mission of impossible.

Ref
===
[1] Shenoy, K. V., Sahani, M., & Churchland, M. M. (2013). Cortical control of arm movements: A
dynamical systems perspective. Annual Review of Neuroscience, 36, 337–359.

[2] Mante, V., Sussillo, D., Shenoy, K. V., & Newsome, W. T. (2013). Context-dependent
computation by recurrent dynamics in prefrontal cortex. Nature, 503(7474), 78–84.

[3] Chaisangmongkon, W., Swaminathan, S. K., Freedman, D. J., & Wang, X. J. (2017). Computing
by Robust Transience: How the Fronto-Parietal Network Performs Sequential, Category-Based
Decisions. Neuron, 93(6), 1504-1517.e4.

[4] Durstewitz, D., Huys, Q. J. M., & Koppe, G. (2020). Psychiatric Illnesses as Disorders of
Network Dynamics. Biological Psychiatry: Cognitive Neuroscience and Neuroimaging, Figure 1,
1–12.

[5] Watanabe, T., & Rees, G. (2017). Brain network dynamics in high-functioning individuals with
autism. Nature Communications, 8.

[6] Koppe, G., Toutounji, H., Kirsch, P., Lis, S., & Durstewitz, D. (2019). Identifying nonlinear
dynamical systems via generative recurrent neural networks with applications to fMRI. In PLoS
Computational Biology (Vol. 15, Issue 8).

[7] Golub and Sussillo (2018), "FixedPointFinder: A Tensorflow toolbox for identifying and
characterizing fixed points in recurrent neural networks," Journal of Open Source Software,
3(31), 1003.
