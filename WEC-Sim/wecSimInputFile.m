%% Simulation Data
simu = simulationClass();               % Initialize Simulation Class
simu.simMechanicsFile = 'FPA.slx';      % Specify Simulink Model File
simu.mode = 'normal';                   % Specify Simulation Mode ('normal','accelerator','rapid-accelerator')
simu.explorer='on';                     % Turn SimMechanics Explorer (on/off)
simu.rampTime = 10;                    % Wave Ramp Time [s]
simu.endTime= 100;                      % Simulation End Time [s]        
simu.solver = 'ode4';                   % simu.solver = 'ode4' for fixed step & simu.solver = 'ode45' for variable step 
simu.dt = 0.01;                         % Simulation Time-Step [s]
simu.domainSize = 5;
%% Wave Information
% % Regular Waves 
waves = waveClass('regular');           % Initialize Wave Class and Specify Type                                 
waves.H = 0.04;                             % Wave Height [m]
waves.T = 0.8;                           % Wave Period [s]
%% Body Data
% body1
body(1) = bodyClass('hydroData/DIFFRACT(0.00).h5');      % Initialize bodyClass for Base
body(1).geometryFile = 'geometry/body1.stl';             % Geometry File
body(1).mass = 'equilibrium'                             %'equilibrium'  % User-Defined mass [kg]
body(1).momOfInertia = [0.015 0.015 0.021];              % Moment of Inertia [kg-m^2]

%% PTO and Constraint Parameters
% Fixed
constraint(1)= constraintClass('Constraint1');  % Initialize ConstraintClass for Constraint1
constraint(1).loc = [0 0 0];                  % Constraint Location [m]

%Rotational PTO
% pto(1) = ptoClass('PTO1');                      % Initialize ptoClass for PTO1
% pto(1).k = 0;                                   % PTO Stiffness Coeff [Nm/rad]
% pto(1).c = 0;                               % PTO Damping Coeff [Nsm/rad]
% pto(1).loc = [0 0 0];                       % PTO Location [m]
                      

mooring(1) = mooringClass('mooring');        % Initialize mooringClass
mooring(1).moorDynLines = 3;                 % Specify number of lines
mooring(1).moorDynNodes(1:3) = 25;           % Specify number of nodes per line
mooring(1).initDisp.initLinDisp = [0 0 0];   % Initial Displacement
