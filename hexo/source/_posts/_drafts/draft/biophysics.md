Researches study our neural system in different levels: from conponents
of a single cell, such as membrane, to the connection of two cells
(synapsis), and further to the complex network of the whole brain. This
summary trying to find a straight pathway of the modeling from
sub-cellcular level to simple neural network. Please refer @mitcourse
for more detail in.

**Keywords:** lorentz integral transformation; pionless EFT; bound-state
problem\

Membrane
========

Membrane has roughly two parts that are vital in the neural activity:
phospholipid bilayer and channels (FIG. [structMemb]). phospholipid is
permeterbale for water, oil etc., yet impermmitable for ions. This
attribution is similar to semi-permeable membrane. Ions carry charges,
if the charge densities of the two sides of phospholipid bilayer (intra
celluar space and extra-cellcular space) are different, there will be a
votage across cell membrane (FIG. [semiMemb]). In all, because of the
existance of phospholipid bilayer, the cell has a function similar to
conductance

$$c V = Q
  \label{capt}$$

where $c$ is the conductance per unit area, $Q$ is the charge density
differences and $V$ is the votage accross the cell. The votage of the
extra-cellcular space is set to be zero, therefore $V$ here is also the
votage of intra-cellcular space, which is roughly $-70 \text{mV}$ to
$ -50 \text{mV}$ as measured by the experiment.

There are two types of channel: ion channels and metabolic channel. The
effect of metabolic channels are more indirect and complex, which is not
the center concern of this summary. Ion channel behaviours as the gate
of the membrane. It allows only certain types of ions to pass though the
membrane, thus produce inward or outward cuurent flow. For example,
Na-gated channel is only permitterble to Na$^+$, when the channel is
open (FIG. [nachannel]). One good approximation of the channel is
resistence, govern by the Ohm’s law

$$I = G_i (V - V_i)
  \label{olm}$$

where $G_i$ is the conductance which can depends on the votage and time,
and $V_i$ is the equivibrilum votage (constant for a certain type of
channel) results from the balance of electric force and diffusion. Index
$i$ here means $ith$ type of ion channel. Positive $I$ means outward
current.

Single Cell
===========

Differentiate on both side of equation ([capt]) and use equation
(<span>[olm]</span>), we have an equation for single cell

$$c \frac{dV}{dt} = - G_L (V - V_L) - I_e
  \label{ifmodel}$$

where $I_e$ is the extra-induced current, such as the experimentist
inject ions to the cell (negtive $I_e$). Index $L$ is leakage channel,
which is a mathematically equvilent channel of partial function of some
types of channel (largely fall into K-selective channel). The rest of
effects of channels can be simplified as the following statement:

-   If $V > V_{th}$, $V = 50 \text{mV}$, then quickly fall to $V_{res}$.
    [ifstate]

This effect is often introduced by Na-selective channels. Typical value
of $V_{res}$ is $-65 mV$. There are some choices for $V_{th}$, but
values like $-30
mV$ is sufficient to fit a good result. When this statement is
triggered, we say the neuron fired, or it made a spike. This single-cell
model also be named Integrate and Firing Model. This model contains one
resistence (leakage channel), one conductance (membrane), one external
current source ($I_e$), and voltage source (FIG. [ifmodel]). There are
lots more sophiscated models, such as HH model, which replace the
statement with more realistic channels as additional terms in equation
([ifmodel]).

Equation [ifmodel] can be collected with a more susinct form

$$\tau \frac{dV}{dt} = -V + V_{\infty}
  \label{ifmodelS}$$

where $\tau = c / G_L$ and $V_{\infty} = (V_L - I_e) / G_L$. If $G_L$
here is a constant, solution of equation [ifmodelS] is

$$V = (V_L - V_{\infty}) e^{-t/\tau} + V_{\infty}$$

The firing pattern is shown in FIG. [fpattern]

Information is stored in the firing rate of neurons instead of the exact
value of votage. Firing rate is defined as the number of spiks in a unit
time. The time spacing between two spikes can be calculated from
equation ([ifmodelS]) by calculate the time that $V$ grows from
$V_{res}$ to $V_{th}$. The inverse of time spacing is firing rate, as
show in FIG. [fireate]. In all, we could conclude the relation with

$$v = F[I_e]
  \label{fireateeq}$$

where $v$ is the firing rate, and $F$ is some function has the shape in
FIG. [fireate]

Synapse
=======

Before moving to neural network, we need to understand how two neurons
connect each other by synapse. FIG. [syn] shows the biological structure
of the synapse. When the pre-neuron is fired, the depolyzation will open
the Ca-channel, induces an inward flow of Ca$^{2+}$. This Ca$^{2+}$ will
release the transmitters in the presynapse. Transmitter in the synapse
cleft then attarch to particular recepters in the post-synapse, open
ion-channel to allow Na$^+$ flow into the post-synapse. This final lead
to the depolyzation of the post-neuron.

The current flow into the post-neuron can be descripted by

$$I_{syn} = - G_{syn}(t) (V - V_{syn}),
  \label{isyn}$$

where $V_{syn}$ is about $0$ mV, which is the reversal potential of the
post-synapse. Conductance $G_{syn}(t)$ is shown in FIG. [gsyn] If
there’s no transmitters in the synapse cleft, ion channels in the
post-synapse are closed, $G_{syn}(t) = 0$ mV. A spike of the presynapse
will suddenly release a large amount of transmitters, therefore largely
increase $G_{syn}(t)$. Then the transmitters will graduatly either
diffuse away or be decomposed by glials, which lead to the slow decay of
the conductance. The conductance induced by single spike is often
approximated by the exponential function

$$K(t) = G_{max} e^{-t / \tau}.$$

The whole conductance under a train of spikes is

$$G(t) = \sum_iK(t) \delta_{t,t_i}
  \label{spikeraw}$$

where there is a spike at time $t_i$. Equation ([spikeraw]) can be
simplified with the spike train $S(t) = \sum_i\delta(t - t_i)$

$$G(t) = \int{d\tau}K(\tau)S(t - \tau)$$

Simple Neural Network
=====================

Consider a network with only two neurons attarched FIG. [twonet]. The
working status of each neuron is solely stated by its firing rate. So we
need to findout the firing-rate relation between neurons. For the single
neuron, the only source of external current is from its pre-neuron, i.e.
$v = F[I_{syn}]$ from equation ([fireateeq]). Yet $I_{syn}$ followed by
equation ([isyn]) is still too complex to be pratical. Hence we further
throw away the votage term, and treat $G_{syn}(t)$ as votage
independent,

$$I_{syn} = \int{d\tau}K(\tau)S(t - \tau)$$

we could extract a factor $w$ so that the rest of
$U(\tau) = K(\tau) / w$ can be normalized,

$$\int{d\tau}U(\tau) = 1$$

The convolution of a narrow (correnspond to short time of non-zero
$K(\tau)$) window $U(\tau)$ with spike train $S(\tau)$ is exactly the
firing rate of the presynapse $u$. Overall, we have

$$v = F[w u].$$

This equation reveals the simple relation of the network. Larger $w$
means the two neurons are more strongly connect, only a slow firing rate
of the pre-neuron is enough for triggering the post-neuron. This
biologically could mean there are more channels in the post-synapse.
Different presynapse will attarch to different sites of the postsynapse.
Furthermore, the post-neual layer can also attarch to each other as
shown in FIG. . The overall effect is the summation of all their
current.

$$\boldsymbol{v} = F[W\boldsymbol{u} + M \boldsymbol{v}],$$

where $W, M$ are matrices, arrays are written as bold letters. This
model is called rate model, which is the fundation of the lots of deep
learning architechture.

Conclusion
==========

Membrane of the neuron is a conbination of resistor and capacity. The
conductances are different under different membrane and more
importantly, different to different types of channels. This attribution
allows the neuron to fire, and soon go back to the rest potential. A
spike from the pre-neuron will triggered a bit depolyzation of the
post-neuron. Once there is enough depolyzation, the post-neuron will
also make spikes. Despite the complicated procedure for generating a
spike, the exact voltage is unimportant. The real information is stored
in the frequency of the spikes, which can be described using a single
number – firing rate. By carefully simplify the synapse conductance, one
could obtain a relation between the firing rate of neurons, thus have a
neuron network. This neuron network also lies in the basis current deep
network algorithms.

![results of problem2\_1](test.png)

<span>100</span> [MIT OpenCourseWare: Introduction to Neural
Computation](https://ocw.mit.edu/courses/brain-and-cognitive-sciences/9-40-introduction-to-neural-computation-spring-2018/)
