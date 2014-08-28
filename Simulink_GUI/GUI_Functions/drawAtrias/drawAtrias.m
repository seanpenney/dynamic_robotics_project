
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initAtriasFunction(x)
	
% Store the axes handle
this.axes = gca;

% Define properties (torso radius and leg segment radius)
R = 0.12; r = 0.04;

% Define graphical ATRIAS
this.torso = RoundedSquare(0.3 + 2*R, 2*R, R, 'g', 50, this.axes);
this.lLegA1 = RoundedSquare(0.45 + 2*r, 2*r, r, 'w', 50, this.axes);
this.lLegA2 = RoundedSquare(0.5 + 2*r, 2*r, r, 'w', 50, this.axes);
this.lLegB1 = RoundedSquare(0.5 + 2*r, 2*r, r, 'w', 50, this.axes);
this.lLegB2 = RoundedSquare(0.5 + 2*r, 2*r, r, 'w', 50, this.axes);
this.rLegA1 = RoundedSquare(0.45 + 2*r, 2*r, r, 'w', 50, this.axes);
this.rLegA2 = RoundedSquare(0.5 + 2*r, 2*r, r, 'w', 50, this.axes);
this.rLegB1 = RoundedSquare(0.5 + 2*r, 2*r, r, 'w', 50, this.axes);
this.rLegB2 = RoundedSquare(0.5 + 2*r, 2*r, r, 'w', 50, this.axes);
this.lActA = RoundedSquare(0.25 + 2*r, 2*r, r, 'w', 50, this.axes);
this.lActB = RoundedSquare(0.25 + 2*r, 2*r, r, 'w', 50, this.axes);
this.rActA = RoundedSquare(0.25 + 2*r, 2*r, r, 'w', 50, this.axes);
this.rActB = RoundedSquare(0.25 + 2*r, 2*r, r, 'w', 50, this.axes);

% Axes properties
axis(this.axes, 'equal');
axis(this.axes, 'off');
xlim(this.axes, [-1 1]); ylim(this.axes, [-1.25 0.75]);

% Find the handles of all graphical object in axes
children = findall(this.axes);
ind = ismember(get(children, 'Type'), {'surface' 'line' 'patch'});

% Turn on line smoothing
set(children(ind), 'LineSmoothing', 'on');

%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%drawAtriasFunction(x)

% Robot state (all coordinates are relative to world horizontal)
qt = pi/2;
qLlA = - pi/2 + acos(0.9);
qLlB = - pi/2 - acos(0.9);
qLmA = - pi/2 + acos(0.9);
qLmB = - pi/2 - acos(0.9);
qRlA = - pi/2 + acos(0.9);
qRlB = - pi/2 - acos(0.9);
qRmA = - pi/2 + acos(0.9);
qRmB = - pi/2 - acos(0.9);

% Torso position pinned
xt = 0; zt = 0;

% Update torso
this.torso.reset;
this.torso.translate(-this.torso.radius, -this.torso.height/2, 0);
this.torso.rotate(0, 0, qt);
this.torso.translate(xt, zt, 0.065);
this.torso.update;

% Update left leg A1 segment
this.lLegA1.reset;
this.lLegA1.translate(-this.lLegA1.radius, -this.lLegA1.height/2, 0);
this.lLegA1.rotate(0, 0, qLlA);
this.lLegA1.translate(xt, zt, 0.01);
this.lLegA1.update;

% Update left leg A2 segment
this.lLegA2.reset;
this.lLegA2.translate(-this.lLegA2.radius, -this.lLegA2.height/2, 0);
this.lLegA2.rotate(0, 0, qLlA);
this.lLegA2.translate(xt + 0.5*cos(qLlB), zt + 0.5*sin(qLlB), 0.02);
this.lLegA2.update;

% Update left leg B1 segment
this.lLegB1.reset;
this.lLegB1.translate(-this.lLegB1.radius, -this.lLegB1.height/2, 0);
this.lLegB1.rotate(0, 0, qLlB);
this.lLegB1.translate(xt , zt, 0.03);
this.lLegB1.update;

% Update left leg B2 segment
this.lLegB2.reset;
this.lLegB2.translate(-this.lLegB2.radius, -this.lLegB2.height/2, 0);
this.lLegB2.rotate(0, 0, qLlB);
this.lLegB2.translate(xt + 0.45*cos(qLlA), zt + 0.45*sin(qLlA), 0.04);
this.lLegB2.update;

% Update left actuator A segment
this.lActA.reset;
this.lActA.translate(-this.lActA.radius, -this.lActA.height/2, 0);
this.lActA.rotate(0, 0, qLmA);
this.lActA.translate(xt, zt, 0.05);
this.lActA.update;

% Update left actuator B segment
this.lActB.reset;
this.lActB.translate(-this.lActB.radius, -this.lActB.height/2, 0);
this.lActB.rotate(0, 0, qLmB);
this.lActB.translate(xt, zt, 0.06);
this.lActB.update;

% Update right leg A1 segment
this.rLegA1.reset;
this.rLegA1.translate(-this.rLegA1.radius, -this.rLegA1.height/2, 0);
this.rLegA1.rotate(0, 0, qRlA);
this.rLegA1.translate(xt, zt, 0.07);
this.rLegA1.update;

% Update right leg A2 segment
this.rLegA2.reset;
this.rLegA2.translate(-this.rLegA2.radius, -this.rLegA2.height/2, 0);
this.rLegA2.rotate(0, 0, qRlA);
this.rLegA2.translate(xt + 0.5*cos(qRlB), zt + 0.5*sin(qRlB), 0.08);
this.rLegA2.update;

% Update right leg B1 segment
this.rLegB1.reset;
this.rLegB1.translate(-this.rLegB1.radius, -this.rLegB1.height/2, 0);
this.rLegB1.rotate(0, 0, qRlB);
this.rLegB1.translate(xt, zt, 0.09);
this.rLegB1.update;

% Update right leg B2 segment
this.rLegB2.reset;
this.rLegB2.translate(-this.rLegB2.radius, -this.rLegB2.height/2, 0);
this.rLegB2.rotate(0, 0, qRlB);
this.rLegB2.translate(xt + 0.45*cos(qRlA), zt + 0.45*sin(qRlA), 0.1);
this.rLegB2.update;

% Update right actuator A segment
this.rActA.reset;
this.rActA.translate(-this.rActA.radius, -this.rActA.height/2, 0);
this.rActA.rotate(0, 0, qRmA);
this.rActA.translate(xt, zt, 0.11);
this.rActA.update;

% Update right actuator B segment
this.rActB.reset;
this.rActB.translate(-this.rActB.radius, -this.rActB.height/2, 0);
this.rActB.rotate(0, 0, qRmB);
this.rActB.translate(xt, zt, 0.12);
this.rActB.update;