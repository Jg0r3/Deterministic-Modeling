% ======================================================================= %
% FUNCTION PLOTPAIRS: This function plots the  mcmc chain
% parameter values for various parameter pairs
% ======================================================================= %

  if ((npar<5)&&(npar>1))                 % Scatterplots of estimate pairs
    figure(30);                              % new figure
    numpairs = nchoosek(npar,2);            % Number of pairs of estimates
    dimx = npar-1;                          % x-dimension of plot window
    dimy = ceil(numpairs/dimx);             % y-dimension of plot window
     plotnum=0;                          % Plot number index in figure 2
    for j=1:(npar-1)                        % Loops through x-axis parameter 
      for k=(j+1):npar                      % Loops through y-axis parameter
        plotnum = plotnum+1;                % Increments plot number
        subplot(dimx,dimy,plotnum);         % Defines which subplot to use
        plot(chain(:,j), ...            % Plots mcmc estimates for
          chain(:,k),'b.',par0(j),par0(k),'r*','LineWidth',3);             %   param. j vs. those for k
        xlabel(parnames(j),'fontsize',10);  % Puts an x-axis label on plot
        ylabel(parnames(k),'fontsize',10);  % Puts a y-axis label on plot
        drawnow                           % Draw plot now
      end                                   % End of for loop for k
    end                                     % End of for loop for j
  end                                       % End of if statement
  