clear all; close all; clc;

%Aaron Rosen - Fields & Waves II
%Project 3 - An Introduction to the Finite Difference Time Domain


%Rebuilding  FD1D_1.1.c in MATLAB
KE = 200;
Ex = zeros(KE, 1);
Hy = zeros(KE, 1);
kc = KE/2; %Center of problem space
t0 = 40; %Center of the incident pulse
spread = 12; %Width of the incident pulse
NSTEPS = 1; %Number of Steps
T = 0;


while (NSTEPS > 0)
       %Enter the Steps
       
       prompt = "NSTEPS----> ";
       NSTEPS = input(prompt);
       disp(NSTEPS);
       n = 0;
       

       for n = 1:NSTEPS
       T = T+1;
       %Calculating the Ex Field
            for k = 2:KE
                Ex(k) = Ex(k) + 0.5*(Hy(k-1) - Hy(k));
            end
       %Gaussian Pulse in the middle
            pulse = exp(-0.5*((t0-T)./spread).^2);
            Ex(kc) =pulse;
            disp(t0-T);
            disp(Ex(kc));
       %Calculate the Hy field
            for k = 1:KE-1
                Hy(k) = Hy(k) + 0.5*(Ex(k) - Ex(k+1));
            end


            figure(1)
            subplot(2,1,1)
            plot(Ex, 'LineWidth', 2)
            ylim([-1 1])
            ylabel('Ex')

            subplot(2,1,2)
            plot(Hy, 'LineWidth', 2)
            ylim([-1 1])
            ylabel('Hy')

            for k = 1:KE
                disp(Ex(k));
                disp(Hy(k));
            end



      %
       end
end


