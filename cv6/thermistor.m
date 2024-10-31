ntc = readtable("ntc.csv");

t = ntc.Var1;
r = ntc.Var2;

ad = (r ./ (r+10)) * 2^10;

p = polyfit(ad, t, 10);

ad2 = 0:1023;
t2 = round(polyval(p, ad2), 1);
hold on, plot(ad2, t2, 'r');

dlmwrite('data.dlm', t2*10, ',');

figure
plot(ad, t, 'ob')
hold on
plot(ad2, t2, "r")