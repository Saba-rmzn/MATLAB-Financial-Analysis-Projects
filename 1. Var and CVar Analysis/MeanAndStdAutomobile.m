clc
clear
load DailyIndexAutomobile
m10=(1:10:1000)';
m20=(1:20:1000)';
m50=(1:50:1000)';
mean1=mean(price2ret(DailyIndexAutomobile));
mean10=mean(price2ret(DailyIndexAutomobile(m10)));
mean20=mean(price2ret(DailyIndexAutomobile(m20)));
mean50=mean(price2ret(DailyIndexAutomobile(m50)));
std1=std(price2ret(DailyIndexAutomobile));
std10=std(price2ret(DailyIndexAutomobile(m10)));
std20=std(price2ret(DailyIndexAutomobile(m20)));
std50=std(price2ret(DailyIndexAutomobile(m50)));
results=[mean1 mean10 mean20 mean50;std1 std10 std20 std50];
print results 