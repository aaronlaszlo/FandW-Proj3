clear all; close all; clc;

%Aaron Rosen - Fields & Waves II
%Project 3 - An Introduction to the Finite Difference Time Domain


%Rebuilding  FD1D_1.2c in MATLAB
KE = 200;
Ex = zeros(KE, 1);
Hy = zeros(KE, 1);

kc = KE/2;
t0 = 40;
spread = 12;
T = 0;
NSTEPS = 1;

ex_low_m1 = 0;
ex_low_m2 = 0;
ex_high_m1 = 0;
ex_high_m2 = 0;

while (NSTEPS > 0)
    n = 0;
    prompt = "NSTEPS--->";
    NSTEPS = input(prompt);
    disp(NSTEPS);
    
    for n = 1:NSTEPS
        T = T+1;

        %Calculate the Ex Field
        for k = 2:KE
            Ex(k) = Ex(k) + 0.5*(Hy(k-1) - Hy(k));
        end

        %Put a Gaussian Pulse in the Middle
        pulse = exp(-0.5*((t0-T)/spread)^2);
        Ex(kc) = Ex(kc) + pulse;
        disp(t0-T);
        disp(Ex(kc));

        %Define Boundary Conditions
        Ex(1) = ex_low_m2;
        ex_low_m2 = ex_low_m1;
        ex_low_m1 = Ex(2);
        Ex(KE-1) = ex_high_m2;
        ex_high_m2 = ex_high_m1;
        ex_high_m1 = Ex(KE-2);


        %Calculate the Hy Field
        for k = 1:KE-1
            Hy(k) = Hy(k) + 0.5*(Ex(k) - Ex(k+1));
        end

         figure(1);      
        subplot(2,1,1)
        plot(Ex, 'LineWidth', 2)
        ylim([-1 1])
        ylabel('Ex')
        
        subplot(2,1,2)
        plot(Hy, 'LineWidth', 2)
        ylim([-1 1])
        ylabel('Hy')
        
        for k=1:KE
            disp(Ex(k));
            disp(Hy(k));
        end
    end
end

