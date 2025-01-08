% Entries in x should be arranged in increasing order
x = [1 2 3 4 5];
y = [1 0 3 1 2];
u = linspace(1,5,21)
v = piecelin(x,y,u)
plot(u,v,'r*-');
hold on;
plot(x,y,'go');