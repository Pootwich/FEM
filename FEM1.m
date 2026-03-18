clear all;
close all;
clc;

%% Preprocessing %%

format long

A = 0.01;
E = 10^6;

% PD: Problem Dimension
% NPE: Number of Nodes Per Element

% NoN: Number of Nodes
% NoE: Number of Elements

% NL: Node List [NoN x PD] (Coordinates)
% EL: Element List [NoE x NPE]

% ENL: Extended Node List [NoN x (6xPD)]

% DOFs: Degrees of Freedom
% DOCs: Degrees of Constraint

NL = [0 0; 1 0; 0.5 1];
EL = [1 2; 2 3; 3 1];
[ENL, DOFs, DOCs] = assign_BCs(NL);

K = assemble_stiffness(ENL,EL,NL,E,A);

Fp = assemble_forces(ENL,NL);

Up = assemble_displacements(ENL,NL);

Kpu = K(1:DOFs,1:DOFs);
Kpp = K(1:DOFs,DOFs+1:DOFs+DOCs);
Kuu = K(DOFs+1:DOFs+DOCs,1:DOFs);
Kup = K(DOFs+1:DOFs+DOCs,DOFs+1:DOFs+DOCs);

F = Fp - Kpp * Up;

Uu = inv(Kpu) * F; % inv = inverse of the Kpu matrix

Fu = Kuu * Uu + Kup * Up; % Unknown forces

ENL = update_nodes(ENL,Uu,NL,Fu);

Node_flag = "on"; %off
Element_flag = "on"; %off

mag = 1; %magnification factor

post_process(NL, EL, ENL, E, Node_flag, Element_flag, mag)