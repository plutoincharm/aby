clc;
clear;
clearvars;
%%%
global L r m MI R2 R3 del2 del3 g
%%%
L2 = 0.36668;
L3 = 0.36668;
L4 = 0.4361;
L5 = 0.4361;
r2 = 0.1588;
r3 = 0.1588;
r4 = 0.1888;
r5 = 0.1888;
m1 = 50.172;
m2 = 7.4;
m3 = 7.4;
m4 = 3.411;
m5 = 3.411;
MI1 = 0.2;
MI2 = 0.1038;
MI3 = 0.1038;
MI4 = 0.05916;
MI5 = 0.05916;
%%%
g = 9.81;
L = [L2 L3 L4 L5];
r = [r2 r3 r4 r5];
m = [m1 m2 m3 m4 m5];
MI = [MI1 MI2 MI3 MI4 MI5];
%%%
coord = readmatrix("joint_coordinates.xlsx");
time = coord(:,1);
xiphoid_x = 2000-coord(:,14);
xiphoid_y = coord(:,15);
%%% left side
lhip_x = 2000-coord(:,2);
lhip_y = coord(:,3);
lknee_x = 2000-coord(:,6);
lknee_y = coord(:,7);
lankle_x = 2000-coord(:,10);
lankle_y = coord(:,11);
lmeta_x = 2000-coord(:,22);
lmeta_y = coord(:,23);
lpost_x = 2000-coord(:,18);
lpost_y = coord(:,19);
%%% right side
rhip_x = 2000-coord(:,4);
rhip_y = coord(:,5);
rknee_x = 2000-coord(:,8);
rknee_y = coord(:,9);
rankle_x = 2000-coord(:,12);
rankle_y = coord(:,13);
rmeta_x = 2000-coord(:,20);
rmeta_y = coord(:,21);
rpost_x = 2000-coord(:,16);
rpost_y = coord(:,17);
%%% mid-point of pelvis
x_p = (lhip_x+rhip_x)/2;
y_p = (lhip_y+rhip_y)/2;
%%%
del2 = 0;
del3 = 0;
R2 = 0.001*mean(sqrt((rhip_x(6:140)-xiphoid_x(6:140)).^2 + (rhip_y(6:140)-xiphoid_y(6:140)).^2));
R3 = 0.001*mean(sqrt((lhip_x(6:140)-xiphoid_x(6:140)).^2 + (lhip_y(6:140)-xiphoid_y(6:140)).^2));
%%%
figure; hold on;
xlim([0 3000]);
ylim([0 1800]);
base = plot([0 3000],[20 20],'k-','Linewidth',1);
pelvis = plot([lhip_x(1) rhip_x(1)],[lhip_y(1) rhip_y(1)],'k-','LineWidth',1);
T = plot([xiphoid_x(1) ((lhip_x(1)+rhip_x(1))/2)],[xiphoid_y(1) ((lhip_y(1)+rhip_y(1))/2)],'k-','LineWidth',1);
%%% left side
thigh_l = plot([lhip_x(1) lknee_x(1)],[lhip_y(1) lknee_y(1)],'b-','LineWidth',1);
shank_l = plot([lknee_x(1) lankle_x(1)],[lknee_y(1) lankle_y(1)],'b-','LineWidth',1);
x_l = plot([lankle_x(1)  lmeta_x(1)],[lankle_y(1)  lmeta_y(1)],'b-','LineWidth',1);
y_l = plot([lankle_x(1) lpost_x(1)],[lankle_y(1) lpost_y(1)],'b-','LineWidth',1);
z_l = plot([lpost_x(1)  lmeta_x(1)],[lpost_y(1)  lmeta_y(1)],'b-','LineWidth',1);
%%% right side
thigh_r = plot([rhip_x(1) rknee_x(1)],[rhip_y(1) rknee_y(1)],'r-','LineWidth',1);
shank_r = plot([rknee_x(1) rankle_x(1)],[rknee_y(1) rankle_y(1)],'r-','LineWidth',1);
x_r = plot([rankle_x(1)  rmeta_x(1)],[rankle_y(1)  rmeta_y(1)],'r-','LineWidth',1);
y_r = plot([rankle_x(1) rpost_x(1)],[rankle_y(1) rpost_y(1)],'r-','LineWidth',1);
z_r = plot([rpost_x(1)  rmeta_x(1)],[rpost_y(1)  rmeta_y(1)],'r-','LineWidth',1);        
%%% Animation
for i = 1:length(time)
    clf;
    xlim([0 3000]);
    ylim([0 1800]);
    hold on;
    base = plot([0 3000],[20 20],'k-','Linewidth',1);
    pelvis = plot([lhip_x(i) rhip_x(i)],[lhip_y(i) rhip_y(i)],'k-','LineWidth',1);
    T = plot([xiphoid_x(i) ((lhip_x(i)+rhip_x(i))/2)],[xiphoid_y(i) ((lhip_y(i)+rhip_y(i))/2)],'k-','LineWidth',1);
    %%% left side
    thigh_l = plot([lhip_x(i) lknee_x(i)],[lhip_y(i) lknee_y(i)],'b-','LineWidth',1);
    shank_l = plot([lknee_x(i) lankle_x(i)],[lknee_y(i) lankle_y(i)],'b-','LineWidth',1);
    x_l = plot([lankle_x(i)  lmeta_x(i)],[lankle_y(i)  lmeta_y(i)],'b-','LineWidth',1);
    y_l = plot([lankle_x(i) lpost_x(i)],[lankle_y(i) lpost_y(i)],'b-','LineWidth',1);
    z_l = plot([lpost_x(i)  lmeta_x(i)],[lpost_y(i)  lmeta_y(i)],'b-','LineWidth',1);
    %%% right side
    thigh_r = plot([rhip_x(i) rknee_x(i)],[rhip_y(i) rknee_y(i)],'r-','LineWidth',1);
    shank_r = plot([rknee_x(i) rankle_x(i)],[rknee_y(i) rankle_y(i)],'r-','LineWidth',1);
    x_r = plot([rankle_x(i)  rmeta_x(i)],[rankle_y(i)  rmeta_y(i)],'r-','LineWidth',1);
    y_r = plot([rankle_x(i) rpost_x(i)],[rankle_y(i) rpost_y(i)],'r-','LineWidth',1);
    z_r = plot([rpost_x(i)  rmeta_x(i)],[rpost_y(i)  rmeta_y(i)],'r-','LineWidth',1); 
    % status of gait cycle
    if (time(i)>=0.05 && time(i)<0.25)
        text(2000,1700,'Double Support');
    elseif (time(i)>=0.25 && time(i)<0.75)
        text(2000,1700,{'Right Swing Phase','Left Single Support'});
    elseif (time(i)>=0.75 && time(i)<1)
        text(2000,1700,'Double Support');
    elseif (time(i)>=1 && time(i)<1.39)
        text(2000,1700,{'Left Swing Phase','Right Single Support'});
    elseif (time(i)>=1.39 && time(i)<1.66)
        text(2000,1700,'Double Support');
    elseif (time(i)>=1.66 && time(i)<2.1)
        text(2000,1700,{'Right Swing Phase','Left Single Support'});
    end
    pause(0.05);
end
%%% calculating angles
theta_thigh_left = atan2d(lknee_y-lhip_y,lknee_x-lhip_x);
theta_leg_left = atan2d(lankle_y-lknee_y,lankle_x-lknee_x);
theta_thigh_right = atan2d(rknee_y-rhip_y,rknee_x-rhip_x);
theta_leg_right = atan2d(rankle_y-rknee_y,rankle_x-rknee_x);
%%% angles for inverse dynamics code
tht1 = pi/2 + atan2(xiphoid_y-y_p,xiphoid_x-x_p);
tht2 = pi/2 + atan2(rhip_y-rknee_y,rhip_x-rknee_x);
tht3 = pi/2 + atan2(lhip_y-lknee_y,lhip_x-lknee_x);
tht4 = pi/2 + atan2(rknee_y-rankle_y,rknee_x-rankle_x);
tht5 = pi/2 + atan2(lknee_y-lankle_y,lknee_x-lankle_x);
%%% coords of link CoMs
x1 = 0.001*xiphoid_x;
y1 = 0.001*xiphoid_y;
%%% velocities
vx1 = deriv1(x1,time);
vy1 = deriv1(y1,time);
omg1 = deriv1(tht1,time);
omg2 = deriv1(tht2,time);
omg3 = deriv1(tht3,time);
omg4 = deriv1(tht4,time);
omg5 = deriv1(tht5,time);
%%% accelerations
ax1 = deriv1(vx1,time);
ay1 = deriv1(vy1,time);
alp1 = deriv1(omg1,time);
alp2 = deriv1(omg2,time);
alp3 = deriv1(omg3,time);
alp4 = deriv1(omg4,time);
alp5 = deriv1(omg5,time);
%%% forces
c = 1;
for k = 1:length(time)
    q1 = [x1(k) y1(k) tht1(k) tht2(k) tht3(k) tht4(k) tht5(k)];
    q2 = [omg1(k) omg2(k) omg3(k) omg4(k) omg5(k)];
    q3 = [ax1(k) ay1(k) alp1(k) alp2(k) alp3(k) alp4(k) alp5(k)];
    if (k>=1 && k<6)
        sol(c,:) = single_stance_r(q1,q2,q3);
    elseif (k>=6 && k<26)
        sol(c,:) = double_stance(q1,q2,q3);
    elseif (k>=26 && k<76)
        sol(c,:) = single_stance_l(q1,q2,q3);
    elseif (k>=76 && k<101)
        sol(c,:) = double_stance(q1,q2,q3);
    elseif (k>=101 && k<140)
        sol(c,:) = single_stance_r(q1,q2,q3);
    elseif (k>=140 && k<167)
        sol(c,:) = double_stance(q1,q2,q3);
    else
        sol(c,:) = single_stance_l(q1,q2,q3);
    end
    c = c+1;
end
%%% plotting
Fn_r = sol(:,10); %% ground normal reaction force for right leg
Fn_l = sol(:,12); %% ground normal reaction force for left leg
T1 = sol(:,13);
T2 = sol(:,14);
T3 = sol(:,15);
T4 = sol(:,16);
T5 = sol(:,17);
figure;
plot(time,Fn_r,'k-');
title('ground normal reaction force - right leg');
xlabel('time (sec)');
ylabel('force (N)');
figure;
plot(time,Fn_l,'k-');
title('ground normal reaction force - left leg');
xlabel('time (sec)');
ylabel('force (N)');
figure;
plot(time,T1,'k-');
title('T_1 vs time');
xlabel('time (sec)');
ylabel('torque (N-m)');
figure;
plot(time,T2,'k-');
title('T_2 vs time');
xlabel('time (sec)');
ylabel('torque (N-m)');
figure;
plot(time,T3,'k-');
title('T_3 vs time');
xlabel('time (sec)');
ylabel('torque (N-m)');
figure;
plot(time,T4,'k-');
title('T_4 vs time');
xlabel('time (sec)');
ylabel('torque (N-m)');
figure;
plot(time,T5,'k-');
title('T_5 vs time');
xlabel('time (sec)');
ylabel('torque (N-m)');


        
        
        
        