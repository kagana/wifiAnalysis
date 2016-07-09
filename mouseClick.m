function mouseClick(gcbo, eventdata)
global p dm ldata
persistent dl

if isempty(ldata)
    ldata = [];
end

cP = get(gca,'Currentpoint');
x = cP(1,1);
y = cP(1,2);

distRef = 999;
xc = x;
yc = y;

for i = 1:length(p)
    dist = sqrt((p(i,2)-x)^2+(p(i,3)-y)^2);
    if dist<distRef
        xc = p(i,2);
        yc = p(i,3);
        distRef = dist;
    end
end

if isempty(dl)
    dl.x = xc;
    dl.y = yc;
else
    if sqrt((dl.x-xc)^2+(dl.y-yc)^2) <= dm*sqrt(2)
        line([dl.x, xc], [dl.y, yc])
        ldata = [ldata; [dl.x, xc, dl.y, yc]];
    end
    dl.x = xc;
    dl.y = yc;
end

fprintf('x=%5.2f\ty=%5.2f\n',xc,yc)