%%

stime = tg.TimeLog;
sposition = tg.OutputLog(:,1);
storque = tg.OutputLog(:,2);

data = csvread('elmoposition2.csv');
etime = data(:,2);
eposition = data(:,3);

data = csvread('elmotorque2.csv');
etorque = data(:,3);


eindex = 298:8110;
etime = etime(eindex);
etime = etime - etime(1);
etorque = etorque(eindex);
eposition = eposition(eindex);

soffset = 18;
sindex = (1.228e5:1.541e5) + soffset;
stime = stime(sindex);
stime = stime - stime(1);
storque = storque(sindex);
sposition = sposition(sindex);

toffset = -0.00;
%plot(stime(201:400), storque(201:400), etime(51:100), etorque(51:100));
%plot(stime+toffset, sposition, etime, eposition);
plot(stime, storque, etime, etorque);

