%start code for project #1: linear regression
%pattern recognition, CSE583/EE552
%Weina Ge, Aug 2008
%Christopher Funk, Jan 2018
%Bharadwaj Ravichandran, Jan 2020

%Your Details: (The below details should be included in every matlab script
%file that you create)
%{
    Name: Ke LIANG
    PSU Email ID:kul660@psu.edu
    Description: Code to plot points and curves 
                
%}

addpath export_fig/
npts_word = inputdlg('Number of points(10;50;75;100;150;200):');
npts = str2num(cell2mat(npts_word))
%load the data points
if npts == 10
    load data_10.mat
elseif npts == 50
    load data_50.mat
elseif npts == 75
    load data_75.mat
elseif npts == 100
    load data_100.mat
elseif npts == 150
    load data_150.mat
elseif npts == 200
    load data_200.mat
end

%plot the groud truth curve
figure(1)
clf
hold on;


xx = linspace(1,4*pi,200);
yy = sin(.5*xx);
err = ones(size(xx))*0.3;
% plot the x and y color the area around the line by err (here the std)
h = shadedErrorBar(xx,yy,err,{'b-','color','b','LineWidth',2},0);
%plot the noisy observations
plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
hold off; 
% Make it look good
grid on;
set(gca,'FontWeight','bold','LineWidth',2)
xlabel('x')
ylabel('t')

% Save the image into a decent resolution
export_fig sampleplot -png -transparent -r150

%% Start your curve fitting program here
[m,n] = size(x);
[mm,nn] = size(xx);
Type_word = inputdlg('Types of approach(1 for SUM-OF-SQAURES ERROR; 2 for Bayesian):');
Type = str2num(cell2mat(Type_word))
if Type == 1
    Regular_word = inputdlg('1 for without regularization term; 2 for with regularization term:');
    Regular = str2num(cell2mat(Regular_word))
elseif Type == 2
    Estimator_word  = inputdlg('1 for ML (maximal likelihood) estimator; 2 for MAP (maximum a posteriori) estimator:');
    Estimator = str2num(cell2mat(Estimator_word))
end
M_word = inputdlg('value of M (0;1;3;6;9):');
M = str2num(cell2mat(M_word))
if M == 0
    %%SUM-OF-SQUARES ERROR WITHOUT REGULARIZATION TERM (M = 0)
    T = t';
    X = ones(1,n)';
    Wstar = (X' * X) \ X' * T;
    XX = ones(1,nn)'
    Ystar = XX * Wstar;
    if Type == 2
        if Estimator == 1
            BetaML = npts/((X * Wstar - T)' * (X * Wstar - T))
            Error_ML = ones(mm,nn) * sqrt(1/BetaML)
        elseif Estimator == 2
            Beta_MAP_word = inputdlg('value of Beta:');
            Beta_MAP = str2num(cell2mat(Beta_MAP_word))
            Alpha_MAP_word = inputdlg('value of Alpha:');
            Alpha_MAP = str2num(cell2mat(Alpha_MAP_word))  
            Lam_MAP = Alpha_MAP/Beta_MAP;
            Wstar = (X' * X + Lam_MAP* eye(1,1)) \ X' * T;
        end
    end
    hold on
    if Type == 2
        if Estimator == 1
            figure(1)
            clf
            hold on;
            h = shadedErrorBar(xx,yy,Error_ML,{'r-','color','r','LineWidth',2},0);
            plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
            grid on;
            set(gca,'FontWeight','bold','LineWidth',2)
            xlabel('x')
            ylabel('t')
        end
    end
    plot(xx, Ystar,'g-','LineWidth',2)
    if Type == 1
        if Regular == 2
            Lam_word = inputdlg('related value of Lameda (-18;-15;-13;0):');
            Lam_value = str2num(cell2mat(Lam_word))
            Lam = Lam_value
            Wstar = (X' * X + exp(Lam) * eye(1,1)) \ X' * T;
            Ystar = XX * Wstar;
            hold on
            plot(xx, Ystar,'r-','LineWidth',2)
        end
    end
elseif M == 1
    %%SUM-OF-SQUARES ERROR WITHOUT REGULARIZATION TERM (M = 1)
    T = t';
    X = [ones(1,n);x]';
    XX = [ones(1,nn);xx]';
    Wstar = (X' * X) \ X' * T;
    if Type == 2
        if Estimator == 1
            BetaML = npts/((X * Wstar - T)' * (X * Wstar - T))
            Error_ML = ones(mm,nn) * sqrt(1/BetaML)
        elseif Estimator == 2
            Beta_MAP_word = inputdlg('value of Beta:');
            Beta_MAP = str2num(cell2mat(Beta_MAP_word))
            Alpha_MAP_word = inputdlg('value of Alpha:');
            Alpha_MAP = str2num(cell2mat(Alpha_MAP_word))  
            Lam_MAP = Alpha_MAP/Beta_MAP;
            Wstar = (X' * X + Lam_MAP * eye(2,2)) \ X' * T;
        end
    end
    Ystar = XX * Wstar;
    hold on
    if Type == 2
        if Estimator == 1
            figure(1)
            clf
            hold on;
            h = shadedErrorBar(xx,yy,Error_ML,{'r-','color','r','LineWidth',2},0);
            plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
            grid on;
            set(gca,'FontWeight','bold','LineWidth',2)
            xlabel('x')
            ylabel('t')
        end
    end
    plot(xx, Ystar,'g-','LineWidth',2)
    if Type == 1
        if Regular == 2
            Lam_word = inputdlg('related value of Lameda (-18;-15;-13;0):');
            Lam_value = str2num(cell2mat(Lam_word))
            Lam = Lam_value
            Wstar = (X' * X + exp(Lam) * eye(2,2)) \ X' * T;
            Ystar = XX * Wstar;
            hold on
            plot(xx, Ystar,'r-','LineWidth',2)
        end
    end
elseif M == 3
    %%SUM-OF-SQUARES ERROR WITHOUT REGULARIZATION TERM (M = 3)
    T = t';
    X = [ones(1,n);x;x.^2;x.^3]';
    XX = [ones(1,nn);xx;xx.^2;xx.^3]';
    Wstar = (X' * X) \ X' * T;
    if Type == 2
        if Estimator == 1
            BetaML = npts/((X * Wstar - T)' * (X * Wstar - T))
            Error_ML = ones(mm,nn) * sqrt(1/BetaML)
        elseif Estimator == 2
            Beta_MAP_word = inputdlg('value of Beta:');
            Beta_MAP = str2num(cell2mat(Beta_MAP_word))
            Alpha_MAP_word = inputdlg('value of Alpha:');
            Alpha_MAP = str2num(cell2mat(Alpha_MAP_word))  
            Lam_MAP = Alpha_MAP/Beta_MAP;
            Wstar = (X' * X + Lam_MAP * eye(4,4)) \ X' * T;
        end
    end
    Ystar = XX * Wstar;
    hold on
    if Type == 2
        if Estimator == 1
            figure(1)
            clf
            hold on;
            h = shadedErrorBar(xx,yy,Error_ML,{'r-','color','r','LineWidth',2},0);
            plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
            grid on;
            set(gca,'FontWeight','bold','LineWidth',2)
            xlabel('x')
            ylabel('t')
        end
    end
    plot(xx, Ystar,'g-','LineWidth',2)
    if Type == 1
        if Regular == 2
            Lam_word = inputdlg('related value of Lameda (-18;-15;-13;0):');
            Lam_value = str2num(cell2mat(Lam_word))
            Lam = Lam_value
            Wstar = (X' * X + exp(Lam) * eye(4,4)) \ X' * T;
            Ystar = XX * Wstar;
            hold on
            plot(xx, Ystar,'r-','LineWidth',2)
        end
    end
elseif M == 6
    %%SUM-OF-SQUARES ERROR WITHOUT REGULARIZATION TERM (M = 6)
    T = t';
    X = [ones(1,n);x;x.^2;x.^3;x.^4;x.^5;x.^6]';
    XX = [ones(1,nn);xx;xx.^2;xx.^3;xx.^4;xx.^5;xx.^6]';
    Wstar = (X' * X) \ X' * T;
    if Type == 2
        if Estimator == 1
            BetaML = npts/((X * Wstar - T)' * (X * Wstar - T))
            Error_ML = ones(mm,nn) * sqrt(1/BetaML)
        elseif Estimator == 2
            Beta_MAP_word = inputdlg('value of Beta:');
            Beta_MAP = str2num(cell2mat(Beta_MAP_word))
            Alpha_MAP_word = inputdlg('value of Alpha:');
            Alpha_MAP = str2num(cell2mat(Alpha_MAP_word))  
            Lam_MAP = Alpha_MAP/Beta_MAP;
            Wstar = (X' * X + Lam_MAP * eye(7,7)) \ X' * T;
        end
    end
    Ystar = XX * Wstar;
    hold on
    if Type == 2
        if Estimator == 1
            figure(1)
            clf
            hold on;
            h = shadedErrorBar(xx,yy,Error_ML,{'r-','color','r','LineWidth',2},0);
            plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
            grid on;
            set(gca,'FontWeight','bold','LineWidth',2)
            xlabel('x')
            ylabel('t')
        end
    end
    plot(xx, Ystar,'g-','LineWidth',2)
    if Type == 1
        if Regular == 2
            Lam_word = inputdlg('related value of Lameda (-18;-15;-13;0):');
            Lam_value = str2num(cell2mat(Lam_word))
            Lam = Lam_value
            Wstar = (X' * X + exp(Lam) * eye(7,7)) \ X' * T;
            Ystar = XX * Wstar;
            hold on
            plot(xx, Ystar,'r-','LineWidth',2)
        end
    end
elseif M == 9
    %%SUM-OF-SQUARES ERROR WITHOUT REGULARIZATION TERM (M = 9)
    T = t';
    X = [ones(1,n);x;x.^2;x.^3;x.^4;x.^5;x.^6;x.^7;x.^8;x.^9]';
    XX = [ones(1,nn);xx;xx.^2;xx.^3;xx.^4;xx.^5;xx.^6;xx.^7;xx.^8;xx.^9]';
    Wstar = (X' * X) \ X' * T;
    if Type == 2
        if Estimator == 1
            BetaML = npts/((X * Wstar - T)' * (X * Wstar - T))
            Error_ML = ones(mm,nn) * sqrt(1/BetaML)
        elseif Estimator == 2
            Beta_MAP_word = inputdlg('value of Beta:');
            Beta_MAP = str2num(cell2mat(Beta_MAP_word))
            Alpha_MAP_word = inputdlg('value of Alpha:');
            Alpha_MAP = str2num(cell2mat(Alpha_MAP_word))  
            Lam_MAP = Alpha_MAP/Beta_MAP;
            Wstar = (X' * X + Lam_MAP * eye(10,10)) \ X' * T;
        end
    end
    Ystar = XX * Wstar;
    hold on
    if Type == 2
        if Estimator == 1
            figure(1)
            clf
            hold on;
            h = shadedErrorBar(xx,yy,Error_ML,{'r-','color','r','LineWidth',2},0);
            plot(x,t,'ro','MarkerSize',8,'LineWidth',1.5);
            grid on;
            set(gca,'FontWeight','bold','LineWidth',2)
            xlabel('x')
            ylabel('t')
        end
    end
    plot(xx, Ystar,'g-','LineWidth',2)
    if Type == 1
        if Regular == 2
            Lam_word = inputdlg('related value of Lameda (-18;-15;-13;0):');
            Lam_value = str2num(cell2mat(Lam_word))
            Lam = Lam_value
            Wstar = (X' * X + exp(Lam) * eye(10,10)) \ X' * T;
            Ystar = XX * Wstar;
            hold on
            plot(xx, Ystar,'r-','LineWidth',2)
        end
    end
end    