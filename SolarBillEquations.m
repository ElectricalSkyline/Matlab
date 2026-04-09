clear
x = 0:25:800
xa = 0:25:400
xb = 400:25:800
plan1 = 15*x+25
plan2a = 12*x+40
plan2b = 14*x - 760
plot(x,plan1)
hold("on")
plot(xa, plan2a(1:numel(xa)), '--', xb, plan2b(end-numel(xb)+1:end), '--')
hold("on")

legend('Plan 1', 'Plan 2a', 'Plan 2b');
xlabel('kWatts');
ylabel('Price');
title('Comparison of Plans');

priceTable = table(x', plan1', arrayfun(@priceEqation, x)', 'VariableNames', {'kWatts','Plan1','Plan2'});

disp(priceTable)

function bill = priceEqation(w);
    if w<400
        bill = 12*w+40;
    else
        bill = 14*w - 760;
    end
end