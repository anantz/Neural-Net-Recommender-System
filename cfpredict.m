function [pred]= cfpredict(uid,mov)

load('UNew.txt');
m = size(y(:,1), 1);
n = size(mov)(1);

load('average.txt');
load('similarity.txt');
pred = 0;

%%Applying the CF formula
for j=1:n,
	pre = 0;
	den = 0;
	rated = find(y(:,2)==mov(j,1)); %index of all entries with movie j
	for i=1:size(rated)(1),
		user = rated(i,1);
		pre = pre + sim(uid, y(user,1)) * (y(user,3) - av(y(user,1)));
		den = den + abs(sim(uid,y(user,1)));
	end

	if (den ~= 0)	
		if (pred == 0)
				pred = [uid mov(j,1) round(av(uid)+(pre/den))];
		else
				pred = [pred;uid mov(j,1) round(av(uid)+(pre/den))];
		endif
	endif

end

endfunction
