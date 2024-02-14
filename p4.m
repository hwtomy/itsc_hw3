clc;
clear all;
clc;

L=20000;
a=0.1;
x=markov(a,L);
arcode=arithcode(x,a);

a2=0.1:0.05:0.9;
ho=[];
h=[];
hor=[];
hr=[];
ratio=zeros(1,length(a2));
ratio1=zeros(1,length(a2));
ratio2=zeros(1,length(a2));
for j=1:length(a2)
    x=markov(a2(j),L);
    rv=runlength(x);
    counts=optimal(rv);
     
    leng = 0;
    for i=1:length(rv)
        leng = leng + counts(rv(i));
    end
    ratio(j) = L/leng;

    gc= golomb(rv);
    ratio1(j) = L/length(gc);

    arcode=arithcode(x,a2(j));
    ratio2(j)=L/length(arcode);

    h=[h,entropy(arcode,0)];
    ho=[ho,entropy(x,0)];
    hr=[hr,entropy(arcode,1)];
    hor=[hor,entropy(x,1)];
end


figure;
plot(a2,h);
hold on
plot(a2,ho);
hold on
legend('entropy after code','origin entropy');
ylim([0, 1.1]);
xlabel('value of alpha');
ylabel('entropy');

figure;
plot(a2,hr);
hold on
plot(a2,hor);
hold on
legend('entropy rate after code','origin entropy rate');
xlabel('value of alpha');
ylabel('entropy rate');

figure;
plot(a2,ratio);
hold on
plot(a2,ratio1);
hold on
plot(a2,ratio2);
hold on
legend('ideal run length','golomb','arithmetic');
xlabel('value of alpha');
ylabel('compression ratio');


