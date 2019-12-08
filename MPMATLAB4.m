%Machine Problem 4
%A program to visualize the trajectory of a projectile for both ideal and non-ideal motion. 

hin = input('Please Enter the initial height in meters: ');
mv = input('\nPlease Enter the magnitude of the velocity in m/s: ');
tet = input('\nPlease Enter the angle in degrees with respect to the +x-axis at which the projectile is fired: ');
xacc = input('\nPlease Enter X-component of the acceleration in m/s^2: ');
yacc = input('\nPlease Enter Y-component of the acceleration in m/s^2: ');

t = 0:0.01:10000;

if yacc ~= 0
    yacc = -yacc;
    xacc = -xacc;
    
    %X-component
    mvx = mv*cosd(tet);
    x = mvx.*t + (1/2)*xacc*(t.^2);
    xi = mvx.*t;

    %Y-component
    mvy = mv*sind(tet);
    y = hin + mvy.*t + (1/2)*yacc*(t.^2); 
    
    neg_y = y<0;
    x(neg_y) = [];
    xi(neg_y) = [];
    y(neg_y) = [];
   
    plot(xi,y,'-.k');
    hold on
    
    plot(x,y,'-m');
    grid on;
    
    legend('Ideal Trajectory','Real(Non-Ideal) Trajectory')
    xlabel('Horizontal Distance');
    ylabel('Vertical Distance');
    title('Projectile Motion');
    
else
    disp ('Invalid!! Acceleration in y must not be equal to 0')
end