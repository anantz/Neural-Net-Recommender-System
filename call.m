data = 1000;
%%loading datasets
load('train.txt');
totalUsers = y(data,1); %gettin no. of users in dataset
%covering up remaining data of totalUser
ind = find(y(:,1)==totalUsers);
data = ind(length(ind));
y = y(1:data,:);
save UNew.txt y;

load('test.txt');
ind = find(t(:,1)==totalUsers);
data = ind(length(ind));
t = t(1:data,:);
save u1.txt t;

%if 0

%%================Calculates the weigths of the Neural Network=============
%%For each user, the item content rated by him is generated using generateContent
%%optimize()is called to train each user profile

fprintf('\nStart time ...')
ctime(time())
Theta = 0;

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

%endif
ctime(time())

%%=======Calculates similarity between all users==========
similar(totalUsers);
fprintf('\nSimilarity ...')
ctime(time())

%%=======Calculates average ratings of all users============
getaverageratings(totalUsers);
fprintf('\nAverage ...')
ctime(time())

%%endif

ctime(time())
%%For Test error
%if 0

%%===================Getting predictions===============
pred = 0;
%%for each userfind list of movies to predict ratings: mov
%%Then call the predict() function


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
	
	o= cfpredict(i,mov);
	if(o ~=0)
	if (pred == 0)
		pred = o;
	else
		pred = [pred; o];
	endif
endif
save predictions.txt pred;
end
%save predictions.txt pred;

fprintf('\nPredictions ...')

ctime(time())	

%%=============Error Calculation===============
%if 0
%r = find(t(:,1)==totalUsers);

err = 0;
for i=1:totalUsers,
	err = err + error(i,1);
end
%if(size(r)(1)~=0)
%	err = sqrt(err/r(size(r))(1))
%else
	err = sqrt(err/size(t)(1))	

%%TRAIN ERROR
%%===================Getting predictions===============
pred = 0;
%%for each userfind list of movies to predict ratings: mov
%%Then call the predict() function


for i=1:totalUsers,
	
	if(size(find(y(:,1)==i))(1) == 0)
		continue;
	endif
			
	mov = 0;
	for j=1:size(y)(1),
		if(y(j,1)==i)
			if (mov==0) mov = y(j,2);
			else mov = [mov; y(j,2)];
			endif
		endif
	end	
	
	o= cfpredict(i,mov);
	if(o ~=0)
	if (pred == 0)
		pred = o;
	else
		pred = [pred; o];
	endif
endif
save predictionsTrain.txt pred;
end
%save predictions.txt pred;

fprintf('\nPredictions ...')

ctime(time())	
%endif
%%=============Error Calculation===============

err = 0;
for i=1:totalUsers,
	err = err + error(i,2);
end
	err = sqrt(err/size(y)(1))	

%endif
