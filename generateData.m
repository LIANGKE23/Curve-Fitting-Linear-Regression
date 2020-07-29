%starter code for project 1: linear regression
%pattern recognition, CSE583/EE552
%Weina Ge, Aug 2008
%Christopher Funk, Jan 2018
%Bharadwaj Ravichandran, Jan 2020

%generate noisy observations from the "ground true" curve

npts = 10; %number of sample points -- change this number when you want to vary the sample size
x = linspace(1,4*pi,npts);
y = sin(.5*x);

%define the noise model
nmu = 0;
nsigma = 0.3;
noise = nmu+nsigma.*randn(1,npts); %generate npts number of samples from the N(nmu,nsigma^2)
t  = y + noise; %noisy observation

%save the data points
save data_10.mat x y t

npts = 50; %number of sample points -- change this number when you want to vary the sample size
x = linspace(1,4*pi,npts);
y = sin(.5*x);

%define the noise model
nmu = 0;
nsigma = 0.3;
noise = nmu+nsigma.*randn(1,npts); %generate npts number of samples from the N(nmu,nsigma^2)
t  = y + noise; %noisy observation

%save the data points
save data_50.mat x y t

npts = 75; %number of sample points -- change this number when you want to vary the sample size
x = linspace(1,4*pi,npts);
y = sin(.5*x);

%define the noise model
nmu = 0;
nsigma = 0.3;
noise = nmu+nsigma.*randn(1,npts); %generate npts number of samples from the N(nmu,nsigma^2)
t  = y + noise; %noisy observation

%save the data points
save data_75.mat x y t

npts = 100; %number of sample points -- change this number when you want to vary the sample size
x = linspace(1,4*pi,npts);
y = sin(.5*x);

%define the noise model
nmu = 0;
nsigma = 0.3;
noise = nmu+nsigma.*randn(1,npts); %generate npts number of samples from the N(nmu,nsigma^2)
t  = y + noise; %noisy observation

%save the data points
save data_150.mat x y t
npts = 150; %number of sample points -- change this number when you want to vary the sample size
x = linspace(1,4*pi,npts);
y = sin(.5*x);

%define the noise model
nmu = 0;
nsigma = 0.3;
noise = nmu+nsigma.*randn(1,npts); %generate npts number of samples from the N(nmu,nsigma^2)
t  = y + noise; %noisy observation

%save the data points
save data_150.mat x y t

npts = 200; %number of sample points -- change this number when you want to vary the sample size
x = linspace(1,4*pi,npts);
y = sin(.5*x);

%define the noise model
nmu = 0;
nsigma = 0.3;
noise = nmu+nsigma.*randn(1,npts); %generate npts number of samples from the N(nmu,nsigma^2)
t  = y + noise; %noisy observation

%save the data points
save data_200.mat x y t


