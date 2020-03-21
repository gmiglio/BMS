% Initialization file for demo ssc_lead_acid_battery.mdl. Demo based on
% Jackey, R. "A Simple, Effective Lead-Acid Battery Modeling Process for
% Electrical System Component Selection",  SAE World Congress & Exhibition,
% April 2007, ref. 2007-01-0778
%
% Copyright 2008-2009 The MathWorks, Inc.

%% Battery Model Parameters - 80Ah
NominalCap = 80; %(Ah)

%% Battery Block Initial Conditions
% Initial State of Charge (% of full charge)
% Initial Electrolyte Temperature (°C, typically same as ambient temp)
SOC_init = 0.82;
theta_init = 25;
Batt_Mass = 2.1;

%% Battery Block Thermal Parameters
Ctheta = 400; %(J/°C) Thermal Capacitance
Area = 0.2; % (m^2) Surface area of battery exposed to air
Rtheta = 20;  %(W/m^2/K) Convective heat transfer coefficient

%% Battery Block Capacity Parameters
% Charge/discharge cycles at ranges of current/temp
Kc = 0.9; %()
Costar = NominalCap*3600; %(As)
Kt_Temps = [25 40 60 75]; % Temperature breakpoints for Kt LUT
Kt = [0.8000,1.1000,1.2000,1.1200;]; %() LUT output values
delta = 0.73; %()
Istar = 15; %(A) Nominal Current (=cap/disch_t)
theta_f = -40; %(°C) Electrolyte Freezing Temp

%% Battery Block Parasitic Branch Parameters
% End of charge cycle at ranges of current/temp
Ep = 1.95; %(V) Parasitic emf
Gpo = 2.0e-011; %(s)

Vpo = 0.12; %(V)
Ap = 2.0; %()
Taup = 3; % (s)

%% Battery Block Main Branch Parameters
Emo = 2.18; % (V) [max o.c. volts per cell]
Ke = 0.0006; %(V/°C)
Ao = -0.40; % ()
Roo = 0.005; % (Ohm)
R10 = 0.0085; %(Ohm)
A21 = -10.0; %()
A22 = -8.75; %()
R20 = 0.110; %(Ohm)
Tau1 = 20; %(s)

%% Battery Block Number Of Cells Parameters
ns = 6; %() Number of cells in series in each parallel branch

%% Compute initial extracted charge
Qe_init = (1-SOC_init)*Kc*Costar*interp1([theta_f Kt_Temps],[0 Kt],theta_init,'spline');
Cmin = 1.0e-9;
