data = 10000;

y = load('u.data');
y = sortrows(y);
y = y(1:data,:);
save UNew.txt y;

fprintf('\nStart time ...')
ctime(time())
%%================Calculates the weigths of the Neural Network=============
%%For each user, the item content rated by him is generated using generateContent
%%optimize()is called to train each user profile
Theta = 0;
totalUsers = y(data,1);
for i=1:totalUsers,
	generateContent(i);%%generates NN input for every user
	if (Theta == 0)
		Theta = optimize(i);
	else
		Theta = [Theta; optimize(i)];
	endif
end
save Theta.txt Theta;	

fprintf('\nTheta calulated ...')


ctime(time())

%%=======Calculates similarity between all users==========
similar(totalUsers);
fprintf('\nSimilarity ...')
ctime(time())

%%=======Calculates average ratings of all users============
getaverageratings(totalUsers);
fprintf('\nAverage ...')
ctime(time())


ctime(time())
%%===================Getting predictions===============
pred = 0;
%%for each userfind list of movies to predict ratings: mov
%%Then call the predict() function
t = load('u1.test');

for i=1:totalUsers,
	if(size(find(t(:,1)==i))(1) == 0)
		continue;
	endif
			
	mov = 0;
	for j=1:size(t)(1),
		if(t(j,1)==i)
			if (mov==0) mov = t(j,2);
			else mov = [mov; t(j,2)];
			endif
		endif
	end	
	
	if (pred == 0)
		pred = cfpredict(i,mov);
	else
		pred = [pred; cfpredict(i,mov)];
	endif

save predictions.txt pred;
end
%save predictions.txt pred;

fprintf('\nPredictions ...')

ctime(time())	

%%=============Error Calculation===============
%if 0
r = find(t(:,1)==totalUsers);

err = 0;
for i=1:totalUsers,
	err = err + error(i);
end
err = sqrt(err/r(size(r))(1))
%m:total entries


%endif	
