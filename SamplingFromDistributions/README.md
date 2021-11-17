# SamplingFromDistributions
Matlab examples for generating random numbers that are distributed according to a given probability distribution. Taken from "Probability Models for Data Analysis"

**SamplingFromDistributions.mlx:** MATLAB LiveScript that samples from generic probability distributions using randsample and built in distributions using their associated random number generators. This livescript also implements a simple Linear Congruential Generator in order to generate uniformly distributed random integers in a given range. This is done in order to build some insight into how sampling from distributions actually works. The randomly generated integers can be thought of as indices that can be used for sampling from an array of data that was built so that its different entries occur with relative frequencies that follow a distribution of your choice.

**SamplingFromDistributions.m:** MATLAB Script that performs the same functionality as SamplingFromDistributions.mlx.
