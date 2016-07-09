% TEST
clear all
close all
clearvars

global p dm ldata

% get data from plot
fig = figure;

% z = peaks;
% plot(z(:,30:35))

dm = 0.5;
dmax = 10;
x = 0:dm:dmax;
y = x;
n = 1;

for i = 1:length(x)
    xp = x(i);
    for j = 1:length(x)
        yp = y(j);
        p(n,:)=[n,xp,yp];
        n = n+1;
    end
end

plot(p(:,2),p(:,3),'x');
hold on

% dcm_obj = datacursormode(fig);
% 
% set(dcm_obj,'DisplayStyle','datatip',...
% 'SnapToDataVertex','off','Enable','on')

% set(findall(gca), 'HitTest', 'off')
set(gca, 'HitTest', 'on', 'ButtonDownFcn', @mouseClick)
set(get(gca,'Children'),'ButtonDownFcn', @mouseClick)
