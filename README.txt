This repo contains methods for correcting interval censoring and right truncation (ICTRC) when estimating time delay distributions. 

The baseline ICTRC method is as proposed in Ward et al., 2022. Transmission dynamics of monkeypox in the United Kingdom: contact tracing study. BMJ, 379.

This method relies on a midpoint approximation to an integral over the censoring window for the primary event. 
This approximation leads to a numerically efficient model, but may be inaccurate for censoring windows longer than one day.
In this repo, we develop alternative models that do not require this assumption, but at significant computational cost.
The purpose of this is to evaluate what the influence of the assumption has on our inference. 
