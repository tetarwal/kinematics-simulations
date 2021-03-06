# Initialization
# Implement a GUI

a=5;
b=6.6;
c=9;
d=10;
e=3;
alpha=40*pi/180;
t=0:0.05:10;
omega=2;

# Calculations

theta=omega*t;
gamma=atan(a*sin(theta)./(d-a*cos(theta)));
f=sqrt(a^2+d^2-2*a*d*cos(theta));
beta=acos((c^2-b^2-f.^2)./(2*b*f))-gamma;
p1=[0;0];
p2=a*[cos(theta);sin(theta)];
p3=[a*cos(theta)+b*cos(beta);a*sin(theta)+b*sin(beta)];
p4=d*[1;0];
p5=[a*cos(theta)+e*cos(alpha+beta);a*sin(theta)+e*sin(alpha+beta)];

# Velocity-anlaysis
# p3_v and p5_v vectors contain the velocity of endpoints of the coupler

p3_x=p3(1,:);
p3_y=p3(2,:);
p3_vx=diff(p3_x)./diff(t);
p3_vy=diff(p3_y)./diff(t);
p3_v=sqrt(p3_vx.^2+p3_vy.^2);
p5_x=p5(1,:);
p5_y=p5(2,:);
p5_vx=diff(p5_x)./diff(t);
p5_vy=diff(p5_y)./diff(t);
p5_v=sqrt(p5_vx.^2+p5_vy.^2);

# Plotting

for i=1:length(t)
    
    # Subplot-1
    plot1=subplot(3,1,1);
    p1_circle=viscircles(p1',0.1);
    p2_circle=viscircles(p2(:,i)',0.1);
    p3_circle=viscircles(p3(:,i)',0.1);
    p5_circle=viscircles(p5(:,i)',0.1);
    p4_circle=viscircles(p4',0.1);
    link_a=line([p1(1) p2(1,i)],[p1(2) p2(2,i)]);
    link_b=line([p2(1,i) p3(1,i)],[p2(2,i) p3(2,i)]);
    link_c=line([p3(1,i) p4(1)],[p3(2,i) p4(2)]);
    link_e=line([p2(1,i) p5(1,i)],[p2(2,i) p5(2,i)]);
    link_g=line([p5(1,i) p3(1,i)],[p5(2,i) p3(2,i)]);
    axis(plot1,'equal');
    xlim([-15 15]);
    ylim([-15 15]);
    pause(0.005);
    
    # Subplot-2
    if(i<length(t))
        delete(p1_circle);
        delete(p2_circle);
        delete(p3_circle);
        delete(p4_circle);
        delete(p5_circle);
        delete(link_a);
        delete(link_b);
        delete(link_c);
        delete(link_e);
        delete(link_g);
        plot2=subplot(3,1,2);
        plot(plot2,t(1:i),p3_v(1:i));
        axis([0 t(end) 0 30]);       
        plot3=subplot(3,1,3);
        plot(plot3,t(1:i),p5_v(1:i));
        axis([0 t(end) 0 30]);
        grid on;
    end
end
