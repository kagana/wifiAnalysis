% Evaluate map data
global ldata dm p


% number of lines
nlines = size(ldata,1);
np = length(p);

% center of the router
% xc = 5;
% yc = 5;
% xc = 8;
% yc = 0.5;
xc = input('Enter X position of router: ');
yc = input('Enter Y position of router: ');

%calculated values for p
npc = p;

% constants
gama = 0.9;
dB0 = -40;
R = 1;
wallDrop = 3;

for i = 1:np
    line1 = [xc, p(i,2); yc p(i,3)];
    countWall = 0;
    for j = 1:nlines
        line2 = [ldata(j,1) ldata(j,2); ldata(j,3) ldata(j,4)];
        inside = InterX(line1, line2);
        if isempty(inside)
            inside = 0;
        else
            inside = 1;
        end
        countWall = countWall + inside;
    end
    r = sqrt((xc-p(i,2))^2+(yc-p(i,3))^2);
    sp = signalPower(dB0, gama, R, r) - countWall * wallDrop;
    if sp == inf
        sp = -10;
    end
    npc(i,4) = sp;
    npc(i,5) = countWall;
end

% for i = 1:np
%     % text(p(i,2),p(i,3),num2str(npc(i,4)));
%     if npc(i,5) ~= 0
%         plot(p(i,2),p(i,3),'O', 'Color', 'r');
%         hold on
%     end
% end

x = npc(:,2);
y = npc(:,3);
z = npc(:,4);

%Create regular grid across data space
n=50;
[X,Y] = meshgrid(linspace(min(x),max(x),n), linspace(min(y),max(y),n));

%create contour plot
contourf(X,Y,griddata(x,y,z,X,Y));

for i = 1:nlines
    line(ldata(i,1:2), ldata(i,3:4), 'Color', 'w', 'LineWidth', 3);
end

colorbar
