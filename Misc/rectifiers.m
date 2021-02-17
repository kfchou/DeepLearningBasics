x = -8:0.05:3;

sigmoid = @(x) 1./(1+exp(-x));

relu = max(0,x);
GeLU = 0.5*x.*(1+tanh(sqrt(2/pi)*(x+0.044715*x.^3)));
SiLU = x.*sigmoid(x);
softplus = log(1+exp(x));

plot(x,relu,'linewidth',2); hold on;

leakySlope = 0.1;
leakyRelu = x.*(x > 0) + leakySlope*x.*(x<0);
plot(x,leakyRelu,'linewidth',2)

plot(x,softplus,'linewidth',2)
plot(x,GeLU,'linewidth',2)
plot(x,SiLU,'linewidth',2)

ELU = x.*(x > 0) + 0.5*(exp(x)-1).*(x<0);
plot(x,ELU,'linewidth',2)

l = legend('ReLU','LeakyReLU (tunable)','SoftPlus','GeLU','SiLU','ELU (tunable)');
l.Location = 'NorthWest';
l.Box = 'off';
xlim([-4 2])
ylim([-0.5 2])

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';
