clear all; close all; clc;

%Aaron Rosen - Fields & Waves II
%Project 3 - An Introduction to the Finite Difference Time Domain


%Rebuilding  FD1D_1.2.c in MATLAB
KE = 200;
Ex = zeros(KE, 1);
Hy = zeros(KE, 1);

kc = KE/2;
k1 = kc - 20;
k2 = kc +20;
t0 = 40;
spread = 12;
T = 0;
NSTEPS = 1;

while (NSTEPS > 0)
    
    prompt = "NSTEPS ---> ";
    NSTEPS = input(prompt);
    disp(NSTEPS);
    
    for n = 1:NSTEPS
        T = T+1;
        %Calculate the Ex Field
        for k=2:KE
            Ex(k) = Ex(k) + 0.5*(Hy(k-1) - Hy(k));
        end

        %Guassian Pulse
        pulse = exp(-0.5*((t0-T)/spread).^2);
        Ex(k1) = Ex(k1) + pulse;
        Ex(k2) = Ex(k2) + pulse;
        disp(t0-T);
        disp(Ex(k1));
        disp(Ex(k2));

        %Calculate the Hy Field
        for k=1:KE-1
            Hy(k) = Hy(k) + 0.5*(Ex(k)-Ex(k+1));
        end

       figure(1)

       subplot(2,1,1)
       plot(Ex, 'LineWidth', 2)
       ylim([-2 2])
       ylabel('Ex')

       subplot(2,1,2)
       plot(Hy, 'LineWidth', 2)
       ylim([-2 2])
       ylabel('Hy')

       for k = 1:KE
           disp(Ex(k));
           disp(Hy(k));
       end
           % writematrix(Ex, Ex);
            

            %writematrix(Hy,  Hy);
            
       end
end 


        

