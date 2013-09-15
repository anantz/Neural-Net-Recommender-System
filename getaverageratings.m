function [av]= getaverageratings(totalUsers)
load('UNew.txt');
m = size(y(:,1), 1);
av = 0;
for u=1:totalUsers,
	s = 0;
	e = 0;
	avg = 0;
	for i=1:m,
		if (y(i,1) == u)
			e = e+1;
			if (e == 1)
				s = i;
			endif
		else
			if(s > 0)
				break;
			endif
		endif		
	end
	e = e + s - 1;
	num =  e - s + 1;
	avg = sum(y(s:e,3))/num;
	if (av == 0)
		av = avg;
	else
		av = [av;avg];
	endif
end

save average.txt av;	
endfunction