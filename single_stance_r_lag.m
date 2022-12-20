%%% compute forces, GRFs and moments for single support phase of right leg
function vars = single_stance_r_lag(q,qdot,qddot,varsSS1)
%%%
global L r m MI misc g
%%%
L2 = L(1);
L3 = L(2);
L4 = L(3);
L5 = L(4);
r2 = r(1);
r3 = r(2);
r4 = r(3);
r5 = r(4);
m1 = m(1);
m2 = m(2);
m3 = m(3);
m4 = m(4);
m5 = m(5);
m6 = m(6);
m7 = m(7);
MI1 = MI(1);
MI2 = MI(2);
MI3 = MI(3);
MI4 = MI(4);
MI5 = MI(5);
MI6 = MI(6);
MI7 = MI(7);
R2 = misc(1);
R3 = misc(2);
del2 = misc(3);
del3 = misc(4);
gamma61 = misc(5);
gamma62 = misc(6);
r6 = varsSS1(1);
r7 = varsSS1(2);
r6b = varsSS1(3);
r6f = varsSS1(4);
%%%
x1 = q(1);
y1 = q(2);
tht1 = q(3);
tht2 = q(4);
tht3 = q(5);
tht4 = q(6);
tht5 = q(7);
tht6 = q(8);
tht7 = q(9);
vx1 = qdot(1);
vy1 = qdot(2);
omg1 = qdot(3);
omg2 = qdot(4);
omg3 = qdot(5);
omg4 = qdot(6);
omg5 = qdot(7);
omg6 = qdot(8);
omg7 = qdot(9);
ax1 = qddot(1);
ay1 = qddot(2);
alp1 = qddot(3);
alp2 = qddot(4);
alp3 = qddot(5);
alp4 = qddot(6);
alp5 = qddot(7);
alp6 = qddot(8);
alp7 = qddot(9);

% Ass1=[(-1),(-1),0,0,0,0,0,0,0,0;0,0,(-1),(-1),0,0,0,0,0,0;(-1).*R2.* ...
%   sin(del2+(-1).*tht1),(-1).*R2.*sin(del2+(-1).*tht1),(-1).*R2.*cos( ...
%   del2+(-1).*tht1),(-1).*R2.*cos(del2+(-1).*tht1),1,1,0,0,0,0;L2.* ...
%   sin(tht2),L2.*sin(tht2),(-1).*L2.*cos(tht2),(-1).*L2.*cos(tht2),( ...
%   -1),0,1,0,0,0;0,0,0,0,0,(-1),0,1,0,0;L4.*sin(tht4),L4.*sin(tht4),( ...
%   -1).*L4.*cos(tht4),(-1).*L4.*cos(tht4),0,0,(-1),0,1,0;0,0,0,0,0,0, ...
%   0,(-1),0,1;r6b.*sin(gamma61+(-1).*tht6)+r6.*sin(tht6),r6f.*sin( ...
%   gamma62+(-1).*tht6)+r6.*sin(tht6),(-1).*r6b.*cos(gamma61+(-1).* ...
%   tht6)+(-1).*r6.*cos(tht6),(-1).*r6f.*cos(gamma62+(-1).*tht6)+(-1) ...
%   .*r6.*cos(tht6),0,0,0,0,(-1),0;0,0,0,0,0,0,0,0,0,(-1);0,0,x1+R2.* ...
%   cos(del2+(-1).*tht1)+L2.*cos(tht2)+L4.*cos(tht4)+(-1).*r6b.*cos( ...
%   gamma61+(-1).*tht6)+r6.*cos(tht6)+(-1).*(m1+m2+m3+m4+m5+m6+m7).^( ...
%   -1).*(m1.*x1+m2.*(x1+R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2))+m3.*( ...
%   x1+R3.*cos(del3+tht1)+r3.*cos(tht3))+m4.*(x1+R2.*cos(del2+(-1).* ...
%   tht1)+L2.*cos(tht2)+r4.*cos(tht4))+m5.*(x1+R3.*cos(del3+tht1)+L3.* ...
%   cos(tht3)+r5.*cos(tht5))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos( ...
%   tht2)+L4.*cos(tht4)+r6.*cos(tht6))+m7.*(x1+R3.*cos(del3+tht1)+L3.* ...
%   cos(tht3)+L5.*cos(tht5)+r7.*cos(tht7))),x1+R2.*cos(del2+(-1).* ...
%   tht1)+L2.*cos(tht2)+L4.*cos(tht4)+(-1).*r6f.*cos(gamma62+(-1).* ...
%   tht6)+r6.*cos(tht6)+(-1).*(m1+m2+m3+m4+m5+m6+m7).^(-1).*(m1.*x1+ ...
%   m2.*(x1+R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2))+m3.*(x1+R3.*cos( ...
%   del3+tht1)+r3.*cos(tht3))+m4.*(x1+R2.*cos(del2+(-1).*tht1)+L2.* ...
%   cos(tht2)+r4.*cos(tht4))+m5.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+ ...
%   r5.*cos(tht5))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+L4.* ...
%   cos(tht4)+r6.*cos(tht6))+m7.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+ ...
%   L5.*cos(tht5)+r7.*cos(tht7))),1,1,1,1,1,1];
% 
% bss1=[(-1).*ax1.*m1+(-1).*m2.*(ax1+R2.*((-1).*omg1.^2.*cos(del2+(-1).* ...
%   tht1)+alp1.*sin(del2+(-1).*tht1))+(-1).*r2.*(omg2.^2.*cos(tht2)+ ...
%   alp2.*sin(tht2)))+(-1).*m3.*(ax1+(-1).*R3.*(omg1.^2.*cos(del3+ ...
%   tht1)+alp1.*sin(del3+tht1))+(-1).*r3.*(omg3.^2.*cos(tht3)+alp3.* ...
%   sin(tht3)))+(-1).*m4.*(ax1+(-1).*L2.*omg2.^2.*cos(tht2)+(-1).* ...
%   omg4.^2.*r4.*cos(tht4)+R2.*((-1).*omg1.^2.*cos(del2+(-1).*tht1)+ ...
%   alp1.*sin(del2+(-1).*tht1))+(-1).*alp2.*L2.*sin(tht2)+(-1).*alp4.* ...
%   r4.*sin(tht4))+(-1).*m5.*(ax1+(-1).*L3.*omg3.^2.*cos(tht3)+(-1).* ...
%   omg5.^2.*r5.*cos(tht5)+(-1).*R3.*(omg1.^2.*cos(del3+tht1)+alp1.* ...
%   sin(del3+tht1))+(-1).*alp3.*L3.*sin(tht3)+(-1).*alp5.*r5.*sin( ...
%   tht5))+(-1).*m6.*(ax1+(-1).*L2.*omg2.^2.*cos(tht2)+(-1).*L4.* ...
%   omg4.^2.*cos(tht4)+(-1).*omg6.^2.*r6.*cos(tht6)+R2.*((-1).* ...
%   omg1.^2.*cos(del2+(-1).*tht1)+alp1.*sin(del2+(-1).*tht1))+(-1).* ...
%   alp2.*L2.*sin(tht2)+(-1).*alp4.*L4.*sin(tht4)+(-1).*alp6.*r6.*sin( ...
%   tht6))+(-1).*m7.*(ax1+(-1).*L3.*omg3.^2.*cos(tht3)+(-1).*L5.* ...
%   omg5.^2.*cos(tht5)+(-1).*omg7.^2.*r7.*cos(tht7)+(-1).*R3.*( ...
%   omg1.^2.*cos(del3+tht1)+alp1.*sin(del3+tht1))+(-1).*alp3.*L3.*sin( ...
%   tht3)+(-1).*alp5.*L5.*sin(tht5)+(-1).*alp7.*r7.*sin(tht7)),(-1).* ...
%   ay1.*m1+(-1).*g.*m1+(-1).*g.*m2+(-1).*g.*m3+(-1).*g.*m4+(-1).*g.* ...
%   m5+(-1).*g.*m6+(-1).*g.*m7+(-1).*m2.*(ay1+R2.*(alp1.*cos(del2+(-1) ...
%   .*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+r2.*(alp2.*cos(tht2)+(-1).* ...
%   omg2.^2.*sin(tht2)))+(-1).*m3.*(ay1+R3.*(alp1.*cos(del3+tht1)+(-1) ...
%   .*omg1.^2.*sin(del3+tht1))+r3.*(alp3.*cos(tht3)+(-1).*omg3.^2.* ...
%   sin(tht3)))+(-1).*m4.*(ay1+alp2.*L2.*cos(tht2)+alp4.*r4.*cos(tht4)+ ...
%   R2.*(alp1.*cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+( ...
%   -1).*L2.*omg2.^2.*sin(tht2)+(-1).*omg4.^2.*r4.*sin(tht4))+(-1).* ...
%   m5.*(ay1+alp3.*L3.*cos(tht3)+alp5.*r5.*cos(tht5)+R3.*(alp1.*cos( ...
%   del3+tht1)+(-1).*omg1.^2.*sin(del3+tht1))+(-1).*L3.*omg3.^2.*sin( ...
%   tht3)+(-1).*omg5.^2.*r5.*sin(tht5))+(-1).*m6.*(ay1+alp2.*L2.*cos( ...
%   tht2)+alp4.*L4.*cos(tht4)+alp6.*r6.*cos(tht6)+R2.*(alp1.*cos(del2+ ...
%   (-1).*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+(-1).*L2.*omg2.^2.*sin( ...
%   tht2)+(-1).*L4.*omg4.^2.*sin(tht4)+(-1).*omg6.^2.*r6.*sin(tht6))+( ...
%   -1).*m7.*(ay1+alp3.*L3.*cos(tht3)+alp5.*L5.*cos(tht5)+alp7.*r7.* ...
%   cos(tht7)+R3.*(alp1.*cos(del3+tht1)+(-1).*omg1.^2.*sin(del3+tht1))+ ...
%   (-1).*L3.*omg3.^2.*sin(tht3)+(-1).*L5.*omg5.^2.*sin(tht5)+(-1).* ...
%   omg7.^2.*r7.*sin(tht7)),(-1).*alp1.*MI1+(-1).*alp1.*(m2+m4+m6).* ...
%   R2.^2+(-1).*alp1.*m5.*R3.^2+(-1).*alp1.*m7.*R3.^2+(-1).*ay1.*m6.* ...
%   R2.*cos(del2+(-1).*tht1)+(-1).*g.*m6.*R2.*cos(del2+(-1).*tht1)+( ...
%   -1).*ay1.*m5.*R3.*cos(del3+tht1)+(-1).*g.*m5.*R3.*cos(del3+tht1)+( ...
%   -1).*ay1.*m7.*R3.*cos(del3+tht1)+(-1).*g.*m7.*R3.*cos(del3+tht1)+( ...
%   -1).*alp2.*L2.*m6.*R2.*cos(del2+(-1).*tht1+tht2)+(-1).*alp3.*L3.* ...
%   m5.*R3.*cos(del3+tht1+(-1).*tht3)+(-1).*alp3.*L3.*m7.*R3.*cos( ...
%   del3+tht1+(-1).*tht3)+(-1).*alp4.*L4.*m6.*R2.*cos(del2+(-1).*tht1+ ...
%   tht4)+(-1).*alp5.*L5.*m7.*R3.*cos(del3+tht1+(-1).*tht5)+(-1).* ...
%   alp5.*m5.*R3.*r5.*cos(del3+tht1+(-1).*tht5)+(-1).*alp6.*m6.*R2.* ...
%   r6.*cos(del2+(-1).*tht1+tht6)+(-1).*alp7.*m7.*R3.*r7.*cos(del3+ ...
%   tht1+(-1).*tht7)+(-1).*ax1.*m6.*R2.*sin(del2+(-1).*tht1)+ax1.*m5.* ...
%   R3.*sin(del3+tht1)+ax1.*m7.*R3.*sin(del3+tht1)+L2.*m6.*omg2.^2.* ...
%   R2.*sin(del2+(-1).*tht1+tht2)+(-1).*m2.*R2.*(ay1.*cos(del2+(-1).* ...
%   tht1)+g.*cos(del2+(-1).*tht1)+alp2.*r2.*cos(del2+(-1).*tht1+tht2)+ ...
%   ax1.*sin(del2+(-1).*tht1)+(-1).*omg2.^2.*r2.*sin(del2+(-1).*tht1+ ...
%   tht2))+(-1).*L3.*m5.*omg3.^2.*R3.*sin(del3+tht1+(-1).*tht3)+(-1).* ...
%   L3.*m7.*omg3.^2.*R3.*sin(del3+tht1+(-1).*tht3)+(-1).*m3.*R3.*( ...
%   alp1.*R3+ay1.*cos(del3+tht1)+g.*cos(del3+tht1)+alp3.*r3.*cos(del3+ ...
%   tht1+(-1).*tht3)+(-1).*ax1.*sin(del3+tht1)+omg3.^2.*r3.*sin(del3+ ...
%   tht1+(-1).*tht3))+L4.*m6.*omg4.^2.*R2.*sin(del2+(-1).*tht1+tht4)+( ...
%   -1).*m4.*R2.*(ay1.*cos(del2+(-1).*tht1)+g.*cos(del2+(-1).*tht1)+ ...
%   alp2.*L2.*cos(del2+(-1).*tht1+tht2)+alp4.*r4.*cos(del2+(-1).*tht1+ ...
%   tht4)+ax1.*sin(del2+(-1).*tht1)+(-1).*L2.*omg2.^2.*sin(del2+(-1).* ...
%   tht1+tht2)+(-1).*omg4.^2.*r4.*sin(del2+(-1).*tht1+tht4))+(-1).* ...
%   L5.*m7.*omg5.^2.*R3.*sin(del3+tht1+(-1).*tht5)+(-1).*m5.*omg5.^2.* ...
%   R3.*r5.*sin(del3+tht1+(-1).*tht5)+m6.*omg6.^2.*R2.*r6.*sin(del2+( ...
%   -1).*tht1+tht6)+(-1).*m7.*omg7.^2.*R3.*r7.*sin(del3+tht1+(-1).* ...
%   tht7),(-1).*alp2.*L2.^2.*(m4+m6)+(-1).*alp2.*MI2+(-1).*m2.*r2.*( ...
%   alp2.*r2+ay1.*cos(tht2)+g.*cos(tht2)+alp1.*R2.*cos(del2+(-1).* ...
%   tht1+tht2)+(-1).*ax1.*sin(tht2)+omg1.^2.*R2.*sin(del2+(-1).*tht1+ ...
%   tht2))+(-1).*L2.*(m4.*(ay1.*cos(tht2)+g.*cos(tht2)+alp1.*R2.*cos( ...
%   del2+(-1).*tht1+tht2)+alp4.*r4.*cos(tht2+(-1).*tht4)+(-1).*ax1.* ...
%   sin(tht2)+omg1.^2.*R2.*sin(del2+(-1).*tht1+tht2)+omg4.^2.*r4.*sin( ...
%   tht2+(-1).*tht4))+m6.*(ay1.*cos(tht2)+g.*cos(tht2)+alp1.*R2.*cos( ...
%   del2+(-1).*tht1+tht2)+alp4.*L4.*cos(tht2+(-1).*tht4)+alp6.*r6.* ...
%   cos(tht2+(-1).*tht6)+(-1).*ax1.*sin(tht2)+omg1.^2.*R2.*sin(del2+( ...
%   -1).*tht1+tht2)+L4.*omg4.^2.*sin(tht2+(-1).*tht4)+omg6.^2.*r6.* ...
%   sin(tht2+(-1).*tht6))),(-1).*alp3.*L3.^2.*(m5+m7)+(-1).*alp3.*MI3+ ...
%   (-1).*m3.*r3.*(alp3.*r3+alp1.*R3.*cos(del3+tht1+(-1).*tht3)+ay1.* ...
%   cos(tht3)+g.*cos(tht3)+(-1).*omg1.^2.*R3.*sin(del3+tht1+(-1).* ...
%   tht3)+(-1).*ax1.*sin(tht3))+(-1).*L3.*(m5.*(alp1.*R3.*cos(del3+ ...
%   tht1+(-1).*tht3)+ay1.*cos(tht3)+g.*cos(tht3)+alp5.*r5.*cos(tht3+( ...
%   -1).*tht5)+(-1).*omg1.^2.*R3.*sin(del3+tht1+(-1).*tht3)+(-1).* ...
%   ax1.*sin(tht3)+omg5.^2.*r5.*sin(tht3+(-1).*tht5))+m7.*(alp1.*R3.* ...
%   cos(del3+tht1+(-1).*tht3)+ay1.*cos(tht3)+g.*cos(tht3)+alp5.*L5.* ...
%   cos(tht3+(-1).*tht5)+alp7.*r7.*cos(tht3+(-1).*tht7)+(-1).* ...
%   omg1.^2.*R3.*sin(del3+tht1+(-1).*tht3)+(-1).*ax1.*sin(tht3)+L5.* ...
%   omg5.^2.*sin(tht3+(-1).*tht5)+omg7.^2.*r7.*sin(tht3+(-1).*tht7))), ...
%   (-1).*alp4.*L4.^2.*m6+(-1).*alp4.*MI4+(-1).*m4.*r4.*(alp4.*r4+ ...
%   alp2.*L2.*cos(tht2+(-1).*tht4)+ay1.*cos(tht4)+g.*cos(tht4)+alp1.* ...
%   R2.*cos(del2+(-1).*tht1+tht4)+(-1).*L2.*omg2.^2.*sin(tht2+(-1).* ...
%   tht4)+(-1).*ax1.*sin(tht4)+omg1.^2.*R2.*sin(del2+(-1).*tht1+tht4))+ ...
%   (-1).*L4.*m6.*(alp2.*L2.*cos(tht2+(-1).*tht4)+ay1.*cos(tht4)+g.* ...
%   cos(tht4)+alp1.*R2.*cos(del2+(-1).*tht1+tht4)+alp6.*r6.*cos(tht4+( ...
%   -1).*tht6)+(-1).*L2.*omg2.^2.*sin(tht2+(-1).*tht4)+(-1).*ax1.*sin( ...
%   tht4)+omg1.^2.*R2.*sin(del2+(-1).*tht1+tht4)+omg6.^2.*r6.*sin( ...
%   tht4+(-1).*tht6)),(-1).*alp5.*L5.^2.*m7+(-1).*alp5.*MI5+(-1).*m5.* ...
%   r5.*(alp5.*r5+alp1.*R3.*cos(del3+tht1+(-1).*tht5)+alp3.*L3.*cos( ...
%   tht3+(-1).*tht5)+ay1.*cos(tht5)+g.*cos(tht5)+(-1).*omg1.^2.*R3.* ...
%   sin(del3+tht1+(-1).*tht5)+(-1).*L3.*omg3.^2.*sin(tht3+(-1).*tht5)+ ...
%   (-1).*ax1.*sin(tht5))+(-1).*L5.*m7.*(alp1.*R3.*cos(del3+tht1+(-1) ...
%   .*tht5)+alp3.*L3.*cos(tht3+(-1).*tht5)+ay1.*cos(tht5)+g.*cos(tht5)+ ...
%   alp7.*r7.*cos(tht5+(-1).*tht7)+(-1).*omg1.^2.*R3.*sin(del3+tht1+( ...
%   -1).*tht5)+(-1).*L3.*omg3.^2.*sin(tht3+(-1).*tht5)+(-1).*ax1.*sin( ...
%   tht5)+omg7.^2.*r7.*sin(tht5+(-1).*tht7)),(-1).*alp6.*MI6+(-1).* ...
%   m6.*r6.*(alp6.*r6+alp2.*L2.*cos(tht2+(-1).*tht6)+alp4.*L4.*cos( ...
%   tht4+(-1).*tht6)+ay1.*cos(tht6)+g.*cos(tht6)+alp1.*R2.*cos(del2+( ...
%   -1).*tht1+tht6)+(-1).*L2.*omg2.^2.*sin(tht2+(-1).*tht6)+(-1).*L4.* ...
%   omg4.^2.*sin(tht4+(-1).*tht6)+(-1).*ax1.*sin(tht6)+omg1.^2.*R2.* ...
%   sin(del2+(-1).*tht1+tht6)),(-1).*alp7.*MI7+(-1).*m7.*r7.*(alp7.* ...
%   r7+alp1.*R3.*cos(del3+tht1+(-1).*tht7)+alp3.*L3.*cos(tht3+(-1).* ...
%   tht7)+alp5.*L5.*cos(tht5+(-1).*tht7)+ay1.*cos(tht7)+g.*cos(tht7)+( ...
%   -1).*omg1.^2.*R3.*sin(del3+tht1+(-1).*tht7)+(-1).*L3.*omg3.^2.* ...
%   sin(tht3+(-1).*tht7)+(-1).*L5.*omg5.^2.*sin(tht5+(-1).*tht7)+(-1) ...
%   .*ax1.*sin(tht7)),alp1.*MI1+alp2.*MI2+alp3.*MI3+alp4.*MI4+alp5.* ...
%   MI5+alp6.*MI6+alp7.*MI7+(-1).*ax1.*m1.*y1+(-1).*(ay1+g).*m1.*(m1+ ...
%   m2+m3+m4+m5+m6+m7).^(-1).*(m2.*R2.*cos(del2+(-1).*tht1)+m4.*R2.* ...
%   cos(del2+(-1).*tht1)+m6.*R2.*cos(del2+(-1).*tht1)+m3.*R3.*cos( ...
%   del3+tht1)+m5.*R3.*cos(del3+tht1)+m7.*R3.*cos(del3+tht1)+L2.*(m4+ ...
%   m6).*cos(tht2)+m2.*r2.*cos(tht2)+L3.*(m5+m7).*cos(tht3)+m3.*r3.* ...
%   cos(tht3)+L4.*m6.*cos(tht4)+m4.*r4.*cos(tht4)+L5.*m7.*cos(tht5)+ ...
%   m5.*r5.*cos(tht5)+m6.*r6.*cos(tht6)+m7.*r7.*cos(tht7))+m2.*(x1+ ...
%   R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2)+(-1).*(m1+m2+m3+m4+m5+m6+ ...
%   m7).^(-1).*(m1.*x1+m2.*(x1+R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2))+ ...
%   m3.*(x1+R3.*cos(del3+tht1)+r3.*cos(tht3))+m4.*(x1+R2.*cos(del2+( ...
%   -1).*tht1)+L2.*cos(tht2)+r4.*cos(tht4))+m5.*(x1+R3.*cos(del3+tht1)+ ...
%   L3.*cos(tht3)+r5.*cos(tht5))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+ ...
%   L2.*cos(tht2)+L4.*cos(tht4)+r6.*cos(tht6))+m7.*(x1+R3.*cos(del3+ ...
%   tht1)+L3.*cos(tht3)+L5.*cos(tht5)+r7.*cos(tht7)))).*(ay1+g+alp2.* ...
%   r2.*cos(tht2)+R2.*(alp1.*cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+( ...
%   -1).*tht1))+(-1).*omg2.^2.*r2.*sin(tht2))+(-1).*m2.*(y1+(-1).*R2.* ...
%   sin(del2+(-1).*tht1)+r2.*sin(tht2)).*(ax1+R2.*((-1).*omg1.^2.*cos( ...
%   del2+(-1).*tht1)+alp1.*sin(del2+(-1).*tht1))+(-1).*r2.*(omg2.^2.* ...
%   cos(tht2)+alp2.*sin(tht2)))+m3.*(x1+R3.*cos(del3+tht1)+r3.*cos( ...
%   tht3)+(-1).*(m1+m2+m3+m4+m5+m6+m7).^(-1).*(m1.*x1+m2.*(x1+R2.*cos( ...
%   del2+(-1).*tht1)+r2.*cos(tht2))+m3.*(x1+R3.*cos(del3+tht1)+r3.* ...
%   cos(tht3))+m4.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+r4.*cos( ...
%   tht4))+m5.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+r5.*cos(tht5))+ ...
%   m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+L4.*cos(tht4)+r6.* ...
%   cos(tht6))+m7.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+L5.*cos(tht5)+ ...
%   r7.*cos(tht7)))).*(ay1+g+alp3.*r3.*cos(tht3)+R3.*(alp1.*cos(del3+ ...
%   tht1)+(-1).*omg1.^2.*sin(del3+tht1))+(-1).*omg3.^2.*r3.*sin(tht3))+ ...
%   m3.*(y1+R3.*sin(del3+tht1)+r3.*sin(tht3)).*((-1).*ax1+R3.*( ...
%   omg1.^2.*cos(del3+tht1)+alp1.*sin(del3+tht1))+r3.*(omg3.^2.*cos( ...
%   tht3)+alp3.*sin(tht3)))+m4.*(y1+(-1).*R2.*sin(del2+(-1).*tht1)+ ...
%   L2.*sin(tht2)+r4.*sin(tht4)).*((-1).*ax1+L2.*omg2.^2.*cos(tht2)+ ...
%   omg4.^2.*r4.*cos(tht4)+R2.*(omg1.^2.*cos(del2+(-1).*tht1)+(-1).* ...
%   alp1.*sin(del2+(-1).*tht1))+alp2.*L2.*sin(tht2)+alp4.*r4.*sin( ...
%   tht4))+m4.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+r4.*cos( ...
%   tht4)+(-1).*(m1+m2+m3+m4+m5+m6+m7).^(-1).*(m1.*x1+m2.*(x1+R2.*cos( ...
%   del2+(-1).*tht1)+r2.*cos(tht2))+m3.*(x1+R3.*cos(del3+tht1)+r3.* ...
%   cos(tht3))+m4.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+r4.*cos( ...
%   tht4))+m5.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+r5.*cos(tht5))+ ...
%   m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+L4.*cos(tht4)+r6.* ...
%   cos(tht6))+m7.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+L5.*cos(tht5)+ ...
%   r7.*cos(tht7)))).*(ay1+g+alp2.*L2.*cos(tht2)+alp4.*r4.*cos(tht4)+ ...
%   R2.*(alp1.*cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+( ...
%   -1).*L2.*omg2.^2.*sin(tht2)+(-1).*omg4.^2.*r4.*sin(tht4))+m5.*(y1+ ...
%   R3.*sin(del3+tht1)+L3.*sin(tht3)+r5.*sin(tht5)).*((-1).*ax1+L3.* ...
%   omg3.^2.*cos(tht3)+omg5.^2.*r5.*cos(tht5)+R3.*(omg1.^2.*cos(del3+ ...
%   tht1)+alp1.*sin(del3+tht1))+alp3.*L3.*sin(tht3)+alp5.*r5.*sin( ...
%   tht5))+m5.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+r5.*cos(tht5)+(-1) ...
%   .*(m1+m2+m3+m4+m5+m6+m7).^(-1).*(m1.*x1+m2.*(x1+R2.*cos(del2+(-1) ...
%   .*tht1)+r2.*cos(tht2))+m3.*(x1+R3.*cos(del3+tht1)+r3.*cos(tht3))+ ...
%   m4.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+r4.*cos(tht4))+m5.* ...
%   (x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+r5.*cos(tht5))+m6.*(x1+R2.* ...
%   cos(del2+(-1).*tht1)+L2.*cos(tht2)+L4.*cos(tht4)+r6.*cos(tht6))+ ...
%   m7.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+L5.*cos(tht5)+r7.*cos( ...
%   tht7)))).*(ay1+g+alp3.*L3.*cos(tht3)+alp5.*r5.*cos(tht5)+R3.*( ...
%   alp1.*cos(del3+tht1)+(-1).*omg1.^2.*sin(del3+tht1))+(-1).*L3.* ...
%   omg3.^2.*sin(tht3)+(-1).*omg5.^2.*r5.*sin(tht5))+m6.*(y1+(-1).* ...
%   R2.*sin(del2+(-1).*tht1)+L2.*sin(tht2)+L4.*sin(tht4)+r6.*sin(tht6) ...
%   ).*((-1).*ax1+L2.*omg2.^2.*cos(tht2)+L4.*omg4.^2.*cos(tht4)+ ...
%   omg6.^2.*r6.*cos(tht6)+R2.*(omg1.^2.*cos(del2+(-1).*tht1)+(-1).* ...
%   alp1.*sin(del2+(-1).*tht1))+alp2.*L2.*sin(tht2)+alp4.*L4.*sin( ...
%   tht4)+alp6.*r6.*sin(tht6))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.* ...
%   cos(tht2)+L4.*cos(tht4)+r6.*cos(tht6)+(-1).*(m1+m2+m3+m4+m5+m6+m7) ...
%   .^(-1).*(m1.*x1+m2.*(x1+R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2))+ ...
%   m3.*(x1+R3.*cos(del3+tht1)+r3.*cos(tht3))+m4.*(x1+R2.*cos(del2+( ...
%   -1).*tht1)+L2.*cos(tht2)+r4.*cos(tht4))+m5.*(x1+R3.*cos(del3+tht1)+ ...
%   L3.*cos(tht3)+r5.*cos(tht5))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+ ...
%   L2.*cos(tht2)+L4.*cos(tht4)+r6.*cos(tht6))+m7.*(x1+R3.*cos(del3+ ...
%   tht1)+L3.*cos(tht3)+L5.*cos(tht5)+r7.*cos(tht7)))).*(ay1+g+alp2.* ...
%   L2.*cos(tht2)+alp4.*L4.*cos(tht4)+alp6.*r6.*cos(tht6)+R2.*(alp1.* ...
%   cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+(-1).*L2.* ...
%   omg2.^2.*sin(tht2)+(-1).*L4.*omg4.^2.*sin(tht4)+(-1).*omg6.^2.* ...
%   r6.*sin(tht6))+m7.*(y1+R3.*sin(del3+tht1)+L3.*sin(tht3)+L5.*sin( ...
%   tht5)+r7.*sin(tht7)).*((-1).*ax1+L3.*omg3.^2.*cos(tht3)+L5.* ...
%   omg5.^2.*cos(tht5)+omg7.^2.*r7.*cos(tht7)+R3.*(omg1.^2.*cos(del3+ ...
%   tht1)+alp1.*sin(del3+tht1))+alp3.*L3.*sin(tht3)+alp5.*L5.*sin( ...
%   tht5)+alp7.*r7.*sin(tht7))+m7.*(x1+R3.*cos(del3+tht1)+L3.*cos( ...
%   tht3)+L5.*cos(tht5)+r7.*cos(tht7)+(-1).*(m1+m2+m3+m4+m5+m6+m7).^( ...
%   -1).*(m1.*x1+m2.*(x1+R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2))+m3.*( ...
%   x1+R3.*cos(del3+tht1)+r3.*cos(tht3))+m4.*(x1+R2.*cos(del2+(-1).* ...
%   tht1)+L2.*cos(tht2)+r4.*cos(tht4))+m5.*(x1+R3.*cos(del3+tht1)+L3.* ...
%   cos(tht3)+r5.*cos(tht5))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos( ...
%   tht2)+L4.*cos(tht4)+r6.*cos(tht6))+m7.*(x1+R3.*cos(del3+tht1)+L3.* ...
%   cos(tht3)+L5.*cos(tht5)+r7.*cos(tht7)))).*(ay1+g+alp3.*L3.*cos( ...
%   tht3)+alp5.*L5.*cos(tht5)+alp7.*r7.*cos(tht7)+R3.*(alp1.*cos(del3+ ...
%   tht1)+(-1).*omg1.^2.*sin(del3+tht1))+(-1).*L3.*omg3.^2.*sin(tht3)+ ...
%   (-1).*L5.*omg5.^2.*sin(tht5)+(-1).*omg7.^2.*r7.*sin(tht7))]';


% without tau terms in zmp eqn
Ass1=[(-1),(-1),0,0,0,0,0,0,0,0;0,0,(-1),(-1),0,0,0,0,0,0;(-1).*R2.* ...
  sin(del2+(-1).*tht1),(-1).*R2.*sin(del2+(-1).*tht1),(-1).*R2.*cos( ...
  del2+(-1).*tht1),(-1).*R2.*cos(del2+(-1).*tht1),1,1,0,0,0,0;L2.* ...
  sin(tht2),L2.*sin(tht2),(-1).*L2.*cos(tht2),(-1).*L2.*cos(tht2),( ...
  -1),0,1,0,0,0;0,0,0,0,0,(-1),0,1,0,0;L4.*sin(tht4),L4.*sin(tht4),( ...
  -1).*L4.*cos(tht4),(-1).*L4.*cos(tht4),0,0,(-1),0,1,0;0,0,0,0,0,0, ...
  0,(-1),0,1;r6b.*sin(gamma61+(-1).*tht6)+r6.*sin(tht6),r6f.*sin( ...
  gamma62+(-1).*tht6)+r6.*sin(tht6),(-1).*r6b.*cos(gamma61+(-1).* ...
  tht6)+(-1).*r6.*cos(tht6),(-1).*r6f.*cos(gamma62+(-1).*tht6)+(-1) ...
  .*r6.*cos(tht6),0,0,0,0,(-1),0;0,0,0,0,0,0,0,0,0,(-1);0,0,x1+R2.* ...
  cos(del2+(-1).*tht1)+L2.*cos(tht2)+L4.*cos(tht4)+(-1).*r6b.*cos( ...
  gamma61+(-1).*tht6)+r6.*cos(tht6)+(-1).*(m1+m2+m3+m4+m5+m6+m7).^( ...
  -1).*(m1.*x1+m2.*(x1+R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2))+m3.*( ...
  x1+R3.*cos(del3+tht1)+r3.*cos(tht3))+m4.*(x1+R2.*cos(del2+(-1).* ...
  tht1)+L2.*cos(tht2)+r4.*cos(tht4))+m5.*(x1+R3.*cos(del3+tht1)+L3.* ...
  cos(tht3)+r5.*cos(tht5))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos( ...
  tht2)+L4.*cos(tht4)+r6.*cos(tht6))+m7.*(x1+R3.*cos(del3+tht1)+L3.* ...
  cos(tht3)+L5.*cos(tht5)+r7.*cos(tht7))),x1+R2.*cos(del2+(-1).* ...
  tht1)+L2.*cos(tht2)+L4.*cos(tht4)+(-1).*r6f.*cos(gamma62+(-1).* ...
  tht6)+r6.*cos(tht6)+(-1).*(m1+m2+m3+m4+m5+m6+m7).^(-1).*(m1.*x1+ ...
  m2.*(x1+R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2))+m3.*(x1+R3.*cos( ...
  del3+tht1)+r3.*cos(tht3))+m4.*(x1+R2.*cos(del2+(-1).*tht1)+L2.* ...
  cos(tht2)+r4.*cos(tht4))+m5.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+ ...
  r5.*cos(tht5))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+L4.* ...
  cos(tht4)+r6.*cos(tht6))+m7.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+ ...
  L5.*cos(tht5)+r7.*cos(tht7))),0,0,0,0,0,0];

bss1=[(-1).*ax1.*m1+(-1).*m2.*(ax1+R2.*((-1).*omg1.^2.*cos(del2+(-1).* ...
  tht1)+alp1.*sin(del2+(-1).*tht1))+(-1).*r2.*(omg2.^2.*cos(tht2)+ ...
  alp2.*sin(tht2)))+(-1).*m3.*(ax1+(-1).*R3.*(omg1.^2.*cos(del3+ ...
  tht1)+alp1.*sin(del3+tht1))+(-1).*r3.*(omg3.^2.*cos(tht3)+alp3.* ...
  sin(tht3)))+(-1).*m4.*(ax1+(-1).*L2.*omg2.^2.*cos(tht2)+(-1).* ...
  omg4.^2.*r4.*cos(tht4)+R2.*((-1).*omg1.^2.*cos(del2+(-1).*tht1)+ ...
  alp1.*sin(del2+(-1).*tht1))+(-1).*alp2.*L2.*sin(tht2)+(-1).*alp4.* ...
  r4.*sin(tht4))+(-1).*m5.*(ax1+(-1).*L3.*omg3.^2.*cos(tht3)+(-1).* ...
  omg5.^2.*r5.*cos(tht5)+(-1).*R3.*(omg1.^2.*cos(del3+tht1)+alp1.* ...
  sin(del3+tht1))+(-1).*alp3.*L3.*sin(tht3)+(-1).*alp5.*r5.*sin( ...
  tht5))+(-1).*m6.*(ax1+(-1).*L2.*omg2.^2.*cos(tht2)+(-1).*L4.* ...
  omg4.^2.*cos(tht4)+(-1).*omg6.^2.*r6.*cos(tht6)+R2.*((-1).* ...
  omg1.^2.*cos(del2+(-1).*tht1)+alp1.*sin(del2+(-1).*tht1))+(-1).* ...
  alp2.*L2.*sin(tht2)+(-1).*alp4.*L4.*sin(tht4)+(-1).*alp6.*r6.*sin( ...
  tht6))+(-1).*m7.*(ax1+(-1).*L3.*omg3.^2.*cos(tht3)+(-1).*L5.* ...
  omg5.^2.*cos(tht5)+(-1).*omg7.^2.*r7.*cos(tht7)+(-1).*R3.*( ...
  omg1.^2.*cos(del3+tht1)+alp1.*sin(del3+tht1))+(-1).*alp3.*L3.*sin( ...
  tht3)+(-1).*alp5.*L5.*sin(tht5)+(-1).*alp7.*r7.*sin(tht7)),(-1).* ...
  ay1.*m1+(-1).*g.*m1+(-1).*g.*m2+(-1).*g.*m3+(-1).*g.*m4+(-1).*g.* ...
  m5+(-1).*g.*m6+(-1).*g.*m7+(-1).*m2.*(ay1+R2.*(alp1.*cos(del2+(-1) ...
  .*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+r2.*(alp2.*cos(tht2)+(-1).* ...
  omg2.^2.*sin(tht2)))+(-1).*m3.*(ay1+R3.*(alp1.*cos(del3+tht1)+(-1) ...
  .*omg1.^2.*sin(del3+tht1))+r3.*(alp3.*cos(tht3)+(-1).*omg3.^2.* ...
  sin(tht3)))+(-1).*m4.*(ay1+alp2.*L2.*cos(tht2)+alp4.*r4.*cos(tht4)+ ...
  R2.*(alp1.*cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+( ...
  -1).*L2.*omg2.^2.*sin(tht2)+(-1).*omg4.^2.*r4.*sin(tht4))+(-1).* ...
  m5.*(ay1+alp3.*L3.*cos(tht3)+alp5.*r5.*cos(tht5)+R3.*(alp1.*cos( ...
  del3+tht1)+(-1).*omg1.^2.*sin(del3+tht1))+(-1).*L3.*omg3.^2.*sin( ...
  tht3)+(-1).*omg5.^2.*r5.*sin(tht5))+(-1).*m6.*(ay1+alp2.*L2.*cos( ...
  tht2)+alp4.*L4.*cos(tht4)+alp6.*r6.*cos(tht6)+R2.*(alp1.*cos(del2+ ...
  (-1).*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+(-1).*L2.*omg2.^2.*sin( ...
  tht2)+(-1).*L4.*omg4.^2.*sin(tht4)+(-1).*omg6.^2.*r6.*sin(tht6))+( ...
  -1).*m7.*(ay1+alp3.*L3.*cos(tht3)+alp5.*L5.*cos(tht5)+alp7.*r7.* ...
  cos(tht7)+R3.*(alp1.*cos(del3+tht1)+(-1).*omg1.^2.*sin(del3+tht1))+ ...
  (-1).*L3.*omg3.^2.*sin(tht3)+(-1).*L5.*omg5.^2.*sin(tht5)+(-1).* ...
  omg7.^2.*r7.*sin(tht7)),(-1).*alp1.*MI1+(-1).*alp1.*(m2+m4+m6).* ...
  R2.^2+(-1).*alp1.*m5.*R3.^2+(-1).*alp1.*m7.*R3.^2+(-1).*ay1.*m6.* ...
  R2.*cos(del2+(-1).*tht1)+(-1).*g.*m6.*R2.*cos(del2+(-1).*tht1)+( ...
  -1).*ay1.*m5.*R3.*cos(del3+tht1)+(-1).*g.*m5.*R3.*cos(del3+tht1)+( ...
  -1).*ay1.*m7.*R3.*cos(del3+tht1)+(-1).*g.*m7.*R3.*cos(del3+tht1)+( ...
  -1).*alp2.*L2.*m6.*R2.*cos(del2+(-1).*tht1+tht2)+(-1).*alp3.*L3.* ...
  m5.*R3.*cos(del3+tht1+(-1).*tht3)+(-1).*alp3.*L3.*m7.*R3.*cos( ...
  del3+tht1+(-1).*tht3)+(-1).*alp4.*L4.*m6.*R2.*cos(del2+(-1).*tht1+ ...
  tht4)+(-1).*alp5.*L5.*m7.*R3.*cos(del3+tht1+(-1).*tht5)+(-1).* ...
  alp5.*m5.*R3.*r5.*cos(del3+tht1+(-1).*tht5)+(-1).*alp6.*m6.*R2.* ...
  r6.*cos(del2+(-1).*tht1+tht6)+(-1).*alp7.*m7.*R3.*r7.*cos(del3+ ...
  tht1+(-1).*tht7)+(-1).*ax1.*m6.*R2.*sin(del2+(-1).*tht1)+ax1.*m5.* ...
  R3.*sin(del3+tht1)+ax1.*m7.*R3.*sin(del3+tht1)+L2.*m6.*omg2.^2.* ...
  R2.*sin(del2+(-1).*tht1+tht2)+(-1).*m2.*R2.*(ay1.*cos(del2+(-1).* ...
  tht1)+g.*cos(del2+(-1).*tht1)+alp2.*r2.*cos(del2+(-1).*tht1+tht2)+ ...
  ax1.*sin(del2+(-1).*tht1)+(-1).*omg2.^2.*r2.*sin(del2+(-1).*tht1+ ...
  tht2))+(-1).*L3.*m5.*omg3.^2.*R3.*sin(del3+tht1+(-1).*tht3)+(-1).* ...
  L3.*m7.*omg3.^2.*R3.*sin(del3+tht1+(-1).*tht3)+(-1).*m3.*R3.*( ...
  alp1.*R3+ay1.*cos(del3+tht1)+g.*cos(del3+tht1)+alp3.*r3.*cos(del3+ ...
  tht1+(-1).*tht3)+(-1).*ax1.*sin(del3+tht1)+omg3.^2.*r3.*sin(del3+ ...
  tht1+(-1).*tht3))+L4.*m6.*omg4.^2.*R2.*sin(del2+(-1).*tht1+tht4)+( ...
  -1).*m4.*R2.*(ay1.*cos(del2+(-1).*tht1)+g.*cos(del2+(-1).*tht1)+ ...
  alp2.*L2.*cos(del2+(-1).*tht1+tht2)+alp4.*r4.*cos(del2+(-1).*tht1+ ...
  tht4)+ax1.*sin(del2+(-1).*tht1)+(-1).*L2.*omg2.^2.*sin(del2+(-1).* ...
  tht1+tht2)+(-1).*omg4.^2.*r4.*sin(del2+(-1).*tht1+tht4))+(-1).* ...
  L5.*m7.*omg5.^2.*R3.*sin(del3+tht1+(-1).*tht5)+(-1).*m5.*omg5.^2.* ...
  R3.*r5.*sin(del3+tht1+(-1).*tht5)+m6.*omg6.^2.*R2.*r6.*sin(del2+( ...
  -1).*tht1+tht6)+(-1).*m7.*omg7.^2.*R3.*r7.*sin(del3+tht1+(-1).* ...
  tht7),(-1).*alp2.*L2.^2.*(m4+m6)+(-1).*alp2.*MI2+(-1).*m2.*r2.*( ...
  alp2.*r2+ay1.*cos(tht2)+g.*cos(tht2)+alp1.*R2.*cos(del2+(-1).* ...
  tht1+tht2)+(-1).*ax1.*sin(tht2)+omg1.^2.*R2.*sin(del2+(-1).*tht1+ ...
  tht2))+(-1).*L2.*(m4.*(ay1.*cos(tht2)+g.*cos(tht2)+alp1.*R2.*cos( ...
  del2+(-1).*tht1+tht2)+alp4.*r4.*cos(tht2+(-1).*tht4)+(-1).*ax1.* ...
  sin(tht2)+omg1.^2.*R2.*sin(del2+(-1).*tht1+tht2)+omg4.^2.*r4.*sin( ...
  tht2+(-1).*tht4))+m6.*(ay1.*cos(tht2)+g.*cos(tht2)+alp1.*R2.*cos( ...
  del2+(-1).*tht1+tht2)+alp4.*L4.*cos(tht2+(-1).*tht4)+alp6.*r6.* ...
  cos(tht2+(-1).*tht6)+(-1).*ax1.*sin(tht2)+omg1.^2.*R2.*sin(del2+( ...
  -1).*tht1+tht2)+L4.*omg4.^2.*sin(tht2+(-1).*tht4)+omg6.^2.*r6.* ...
  sin(tht2+(-1).*tht6))),(-1).*alp3.*L3.^2.*(m5+m7)+(-1).*alp3.*MI3+ ...
  (-1).*m3.*r3.*(alp3.*r3+alp1.*R3.*cos(del3+tht1+(-1).*tht3)+ay1.* ...
  cos(tht3)+g.*cos(tht3)+(-1).*omg1.^2.*R3.*sin(del3+tht1+(-1).* ...
  tht3)+(-1).*ax1.*sin(tht3))+(-1).*L3.*(m5.*(alp1.*R3.*cos(del3+ ...
  tht1+(-1).*tht3)+ay1.*cos(tht3)+g.*cos(tht3)+alp5.*r5.*cos(tht3+( ...
  -1).*tht5)+(-1).*omg1.^2.*R3.*sin(del3+tht1+(-1).*tht3)+(-1).* ...
  ax1.*sin(tht3)+omg5.^2.*r5.*sin(tht3+(-1).*tht5))+m7.*(alp1.*R3.* ...
  cos(del3+tht1+(-1).*tht3)+ay1.*cos(tht3)+g.*cos(tht3)+alp5.*L5.* ...
  cos(tht3+(-1).*tht5)+alp7.*r7.*cos(tht3+(-1).*tht7)+(-1).* ...
  omg1.^2.*R3.*sin(del3+tht1+(-1).*tht3)+(-1).*ax1.*sin(tht3)+L5.* ...
  omg5.^2.*sin(tht3+(-1).*tht5)+omg7.^2.*r7.*sin(tht3+(-1).*tht7))), ...
  (-1).*alp4.*L4.^2.*m6+(-1).*alp4.*MI4+(-1).*m4.*r4.*(alp4.*r4+ ...
  alp2.*L2.*cos(tht2+(-1).*tht4)+ay1.*cos(tht4)+g.*cos(tht4)+alp1.* ...
  R2.*cos(del2+(-1).*tht1+tht4)+(-1).*L2.*omg2.^2.*sin(tht2+(-1).* ...
  tht4)+(-1).*ax1.*sin(tht4)+omg1.^2.*R2.*sin(del2+(-1).*tht1+tht4))+ ...
  (-1).*L4.*m6.*(alp2.*L2.*cos(tht2+(-1).*tht4)+ay1.*cos(tht4)+g.* ...
  cos(tht4)+alp1.*R2.*cos(del2+(-1).*tht1+tht4)+alp6.*r6.*cos(tht4+( ...
  -1).*tht6)+(-1).*L2.*omg2.^2.*sin(tht2+(-1).*tht4)+(-1).*ax1.*sin( ...
  tht4)+omg1.^2.*R2.*sin(del2+(-1).*tht1+tht4)+omg6.^2.*r6.*sin( ...
  tht4+(-1).*tht6)),(-1).*alp5.*L5.^2.*m7+(-1).*alp5.*MI5+(-1).*m5.* ...
  r5.*(alp5.*r5+alp1.*R3.*cos(del3+tht1+(-1).*tht5)+alp3.*L3.*cos( ...
  tht3+(-1).*tht5)+ay1.*cos(tht5)+g.*cos(tht5)+(-1).*omg1.^2.*R3.* ...
  sin(del3+tht1+(-1).*tht5)+(-1).*L3.*omg3.^2.*sin(tht3+(-1).*tht5)+ ...
  (-1).*ax1.*sin(tht5))+(-1).*L5.*m7.*(alp1.*R3.*cos(del3+tht1+(-1) ...
  .*tht5)+alp3.*L3.*cos(tht3+(-1).*tht5)+ay1.*cos(tht5)+g.*cos(tht5)+ ...
  alp7.*r7.*cos(tht5+(-1).*tht7)+(-1).*omg1.^2.*R3.*sin(del3+tht1+( ...
  -1).*tht5)+(-1).*L3.*omg3.^2.*sin(tht3+(-1).*tht5)+(-1).*ax1.*sin( ...
  tht5)+omg7.^2.*r7.*sin(tht5+(-1).*tht7)),(-1).*alp6.*MI6+(-1).* ...
  m6.*r6.*(alp6.*r6+alp2.*L2.*cos(tht2+(-1).*tht6)+alp4.*L4.*cos( ...
  tht4+(-1).*tht6)+ay1.*cos(tht6)+g.*cos(tht6)+alp1.*R2.*cos(del2+( ...
  -1).*tht1+tht6)+(-1).*L2.*omg2.^2.*sin(tht2+(-1).*tht6)+(-1).*L4.* ...
  omg4.^2.*sin(tht4+(-1).*tht6)+(-1).*ax1.*sin(tht6)+omg1.^2.*R2.* ...
  sin(del2+(-1).*tht1+tht6)),(-1).*alp7.*MI7+(-1).*m7.*r7.*(alp7.* ...
  r7+alp1.*R3.*cos(del3+tht1+(-1).*tht7)+alp3.*L3.*cos(tht3+(-1).* ...
  tht7)+alp5.*L5.*cos(tht5+(-1).*tht7)+ay1.*cos(tht7)+g.*cos(tht7)+( ...
  -1).*omg1.^2.*R3.*sin(del3+tht1+(-1).*tht7)+(-1).*L3.*omg3.^2.* ...
  sin(tht3+(-1).*tht7)+(-1).*L5.*omg5.^2.*sin(tht5+(-1).*tht7)+(-1) ...
  .*ax1.*sin(tht7)),alp1.*MI1+alp2.*MI2+alp3.*MI3+alp4.*MI4+alp5.* ...
  MI5+alp6.*MI6+alp7.*MI7+(-1).*ax1.*m1.*y1+(-1).*(ay1+g).*m1.*(m1+ ...
  m2+m3+m4+m5+m6+m7).^(-1).*(m2.*R2.*cos(del2+(-1).*tht1)+m4.*R2.* ...
  cos(del2+(-1).*tht1)+m6.*R2.*cos(del2+(-1).*tht1)+m3.*R3.*cos( ...
  del3+tht1)+m5.*R3.*cos(del3+tht1)+m7.*R3.*cos(del3+tht1)+L2.*(m4+ ...
  m6).*cos(tht2)+m2.*r2.*cos(tht2)+L3.*(m5+m7).*cos(tht3)+m3.*r3.* ...
  cos(tht3)+L4.*m6.*cos(tht4)+m4.*r4.*cos(tht4)+L5.*m7.*cos(tht5)+ ...
  m5.*r5.*cos(tht5)+m6.*r6.*cos(tht6)+m7.*r7.*cos(tht7))+m2.*(x1+ ...
  R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2)+(-1).*(m1+m2+m3+m4+m5+m6+ ...
  m7).^(-1).*(m1.*x1+m2.*(x1+R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2))+ ...
  m3.*(x1+R3.*cos(del3+tht1)+r3.*cos(tht3))+m4.*(x1+R2.*cos(del2+( ...
  -1).*tht1)+L2.*cos(tht2)+r4.*cos(tht4))+m5.*(x1+R3.*cos(del3+tht1)+ ...
  L3.*cos(tht3)+r5.*cos(tht5))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+ ...
  L2.*cos(tht2)+L4.*cos(tht4)+r6.*cos(tht6))+m7.*(x1+R3.*cos(del3+ ...
  tht1)+L3.*cos(tht3)+L5.*cos(tht5)+r7.*cos(tht7)))).*(ay1+g+alp2.* ...
  r2.*cos(tht2)+R2.*(alp1.*cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+( ...
  -1).*tht1))+(-1).*omg2.^2.*r2.*sin(tht2))+(-1).*m2.*(y1+(-1).*R2.* ...
  sin(del2+(-1).*tht1)+r2.*sin(tht2)).*(ax1+R2.*((-1).*omg1.^2.*cos( ...
  del2+(-1).*tht1)+alp1.*sin(del2+(-1).*tht1))+(-1).*r2.*(omg2.^2.* ...
  cos(tht2)+alp2.*sin(tht2)))+m3.*(x1+R3.*cos(del3+tht1)+r3.*cos( ...
  tht3)+(-1).*(m1+m2+m3+m4+m5+m6+m7).^(-1).*(m1.*x1+m2.*(x1+R2.*cos( ...
  del2+(-1).*tht1)+r2.*cos(tht2))+m3.*(x1+R3.*cos(del3+tht1)+r3.* ...
  cos(tht3))+m4.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+r4.*cos( ...
  tht4))+m5.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+r5.*cos(tht5))+ ...
  m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+L4.*cos(tht4)+r6.* ...
  cos(tht6))+m7.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+L5.*cos(tht5)+ ...
  r7.*cos(tht7)))).*(ay1+g+alp3.*r3.*cos(tht3)+R3.*(alp1.*cos(del3+ ...
  tht1)+(-1).*omg1.^2.*sin(del3+tht1))+(-1).*omg3.^2.*r3.*sin(tht3))+ ...
  m3.*(y1+R3.*sin(del3+tht1)+r3.*sin(tht3)).*((-1).*ax1+R3.*( ...
  omg1.^2.*cos(del3+tht1)+alp1.*sin(del3+tht1))+r3.*(omg3.^2.*cos( ...
  tht3)+alp3.*sin(tht3)))+m4.*(y1+(-1).*R2.*sin(del2+(-1).*tht1)+ ...
  L2.*sin(tht2)+r4.*sin(tht4)).*((-1).*ax1+L2.*omg2.^2.*cos(tht2)+ ...
  omg4.^2.*r4.*cos(tht4)+R2.*(omg1.^2.*cos(del2+(-1).*tht1)+(-1).* ...
  alp1.*sin(del2+(-1).*tht1))+alp2.*L2.*sin(tht2)+alp4.*r4.*sin( ...
  tht4))+m4.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+r4.*cos( ...
  tht4)+(-1).*(m1+m2+m3+m4+m5+m6+m7).^(-1).*(m1.*x1+m2.*(x1+R2.*cos( ...
  del2+(-1).*tht1)+r2.*cos(tht2))+m3.*(x1+R3.*cos(del3+tht1)+r3.* ...
  cos(tht3))+m4.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+r4.*cos( ...
  tht4))+m5.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+r5.*cos(tht5))+ ...
  m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+L4.*cos(tht4)+r6.* ...
  cos(tht6))+m7.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+L5.*cos(tht5)+ ...
  r7.*cos(tht7)))).*(ay1+g+alp2.*L2.*cos(tht2)+alp4.*r4.*cos(tht4)+ ...
  R2.*(alp1.*cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+( ...
  -1).*L2.*omg2.^2.*sin(tht2)+(-1).*omg4.^2.*r4.*sin(tht4))+m5.*(y1+ ...
  R3.*sin(del3+tht1)+L3.*sin(tht3)+r5.*sin(tht5)).*((-1).*ax1+L3.* ...
  omg3.^2.*cos(tht3)+omg5.^2.*r5.*cos(tht5)+R3.*(omg1.^2.*cos(del3+ ...
  tht1)+alp1.*sin(del3+tht1))+alp3.*L3.*sin(tht3)+alp5.*r5.*sin( ...
  tht5))+m5.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+r5.*cos(tht5)+(-1) ...
  .*(m1+m2+m3+m4+m5+m6+m7).^(-1).*(m1.*x1+m2.*(x1+R2.*cos(del2+(-1) ...
  .*tht1)+r2.*cos(tht2))+m3.*(x1+R3.*cos(del3+tht1)+r3.*cos(tht3))+ ...
  m4.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos(tht2)+r4.*cos(tht4))+m5.* ...
  (x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+r5.*cos(tht5))+m6.*(x1+R2.* ...
  cos(del2+(-1).*tht1)+L2.*cos(tht2)+L4.*cos(tht4)+r6.*cos(tht6))+ ...
  m7.*(x1+R3.*cos(del3+tht1)+L3.*cos(tht3)+L5.*cos(tht5)+r7.*cos( ...
  tht7)))).*(ay1+g+alp3.*L3.*cos(tht3)+alp5.*r5.*cos(tht5)+R3.*( ...
  alp1.*cos(del3+tht1)+(-1).*omg1.^2.*sin(del3+tht1))+(-1).*L3.* ...
  omg3.^2.*sin(tht3)+(-1).*omg5.^2.*r5.*sin(tht5))+m6.*(y1+(-1).* ...
  R2.*sin(del2+(-1).*tht1)+L2.*sin(tht2)+L4.*sin(tht4)+r6.*sin(tht6) ...
  ).*((-1).*ax1+L2.*omg2.^2.*cos(tht2)+L4.*omg4.^2.*cos(tht4)+ ...
  omg6.^2.*r6.*cos(tht6)+R2.*(omg1.^2.*cos(del2+(-1).*tht1)+(-1).* ...
  alp1.*sin(del2+(-1).*tht1))+alp2.*L2.*sin(tht2)+alp4.*L4.*sin( ...
  tht4)+alp6.*r6.*sin(tht6))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.* ...
  cos(tht2)+L4.*cos(tht4)+r6.*cos(tht6)+(-1).*(m1+m2+m3+m4+m5+m6+m7) ...
  .^(-1).*(m1.*x1+m2.*(x1+R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2))+ ...
  m3.*(x1+R3.*cos(del3+tht1)+r3.*cos(tht3))+m4.*(x1+R2.*cos(del2+( ...
  -1).*tht1)+L2.*cos(tht2)+r4.*cos(tht4))+m5.*(x1+R3.*cos(del3+tht1)+ ...
  L3.*cos(tht3)+r5.*cos(tht5))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+ ...
  L2.*cos(tht2)+L4.*cos(tht4)+r6.*cos(tht6))+m7.*(x1+R3.*cos(del3+ ...
  tht1)+L3.*cos(tht3)+L5.*cos(tht5)+r7.*cos(tht7)))).*(ay1+g+alp2.* ...
  L2.*cos(tht2)+alp4.*L4.*cos(tht4)+alp6.*r6.*cos(tht6)+R2.*(alp1.* ...
  cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+(-1).*L2.* ...
  omg2.^2.*sin(tht2)+(-1).*L4.*omg4.^2.*sin(tht4)+(-1).*omg6.^2.* ...
  r6.*sin(tht6))+m7.*(y1+R3.*sin(del3+tht1)+L3.*sin(tht3)+L5.*sin( ...
  tht5)+r7.*sin(tht7)).*((-1).*ax1+L3.*omg3.^2.*cos(tht3)+L5.* ...
  omg5.^2.*cos(tht5)+omg7.^2.*r7.*cos(tht7)+R3.*(omg1.^2.*cos(del3+ ...
  tht1)+alp1.*sin(del3+tht1))+alp3.*L3.*sin(tht3)+alp5.*L5.*sin( ...
  tht5)+alp7.*r7.*sin(tht7))+m7.*(x1+R3.*cos(del3+tht1)+L3.*cos( ...
  tht3)+L5.*cos(tht5)+r7.*cos(tht7)+(-1).*(m1+m2+m3+m4+m5+m6+m7).^( ...
  -1).*(m1.*x1+m2.*(x1+R2.*cos(del2+(-1).*tht1)+r2.*cos(tht2))+m3.*( ...
  x1+R3.*cos(del3+tht1)+r3.*cos(tht3))+m4.*(x1+R2.*cos(del2+(-1).* ...
  tht1)+L2.*cos(tht2)+r4.*cos(tht4))+m5.*(x1+R3.*cos(del3+tht1)+L3.* ...
  cos(tht3)+r5.*cos(tht5))+m6.*(x1+R2.*cos(del2+(-1).*tht1)+L2.*cos( ...
  tht2)+L4.*cos(tht4)+r6.*cos(tht6))+m7.*(x1+R3.*cos(del3+tht1)+L3.* ...
  cos(tht3)+L5.*cos(tht5)+r7.*cos(tht7)))).*(ay1+g+alp3.*L3.*cos( ...
  tht3)+alp5.*L5.*cos(tht5)+alp7.*r7.*cos(tht7)+R3.*(alp1.*cos(del3+ ...
  tht1)+(-1).*omg1.^2.*sin(del3+tht1))+(-1).*L3.*omg3.^2.*sin(tht3)+ ...
  (-1).*L5.*omg5.^2.*sin(tht5)+(-1).*omg7.^2.*r7.*sin(tht7))]';


sol = Ass1\bss1;
vars = [sol ; det(Ass1)];

end