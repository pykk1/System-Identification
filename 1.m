x = [1 2 3 4 5]
y=exp(x)
plot(x,y,'r','LineWidth',3)
hold on;
fi = [1 1 1; 1 2 4; 1 3 9; 1 4 16; 1 5 25]
y = y'
T = fi \ y
yaprox = fi * T
plot(x,yaprox,'b')