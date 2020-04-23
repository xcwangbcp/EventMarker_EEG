% clear
%%% read the edf file 
%%% how to design the marker's position
cfg            = [];
cfg.dataset    = 'Test_4.edf';
cfg.continuous = 'yes';
cfg.channel    = 'all';
data           = ft_preprocessing(cfg);

Test_data = data.trial{1,1}(3:end,:);


% load('block1');
[ , col]=size(Test_data);
event = zeros(8,col(2));
for i= 1:8
    threshhold = (max(Test_data(i,:))-min(Test_data(i,:)))*0.5;
    event_location = find(Test_data(i,:)>threshhold );
    diff_location = diff(event_location);
    xx = event_location(diff_location>1)+1;
    event(i,xx) = 1;
end
code = event(1,:)*2^0+event(2,:)*2^1+event(3,:)*2^2.....
    +event(4,:)*2^3+event(5,:)*2^4+event(6,:)*2^5.....
    +event(7,:)*2^6+event(8,:)*2^7;
code = code(code>0);




% 255
% bin2dec(event)
% termi = find(code1==255);
% termi_block1 = code1(termi);
% all = find(code1>0);
% all_block1 = code1(all);
% 
% correct = find(code1==250);
% correct1 = code1(correct)
% 
% incorrect = find(code1==251);
% incorrect1 = code1(incorrect)
% %%%%
% load('block2');
% [ , col]=size(block2);
% event = zeros(8,col(2));
% for i= 1:8
%     event_loacation = find(block2(i,:)>15);
%  
%     event(i,event_loacation) = 1;
% end
% code2 = event(1,:)*2^0+event(2,:)*2^1+event(3,:)*2^2.....
%     +event(4,:)*2^3+event(5,:)*2^4+event(6,:)*2^5.....
%     +event(7,:)*2^6+event(8,:)*2^7;
% % 255
% % bin2dec(event)
% termi = find(code2==255);
% termi_block2 = code2(termi);
% all = find(code2>0);
% all_block2 = code2(all);
% 
% correct = find(code2==250);
% correct2 = code2(correct)
% 
% incorrect = find(code2==251);
% incorrect2 = code2(incorrect) 





