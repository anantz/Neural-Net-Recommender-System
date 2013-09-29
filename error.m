%%Calculates error by comparing predicted ratings with that in test file
function [err] = error(uid,mode)
if (mode == 1)
	load('u1.txt');
else
	load('UNew.txt');
	t = y;
endif	
m = size(t)(1);
load('predictions.txt');
n = size(pred)(1);
err = 0;
for i=1:m,
	if(t(i,1) == uid)
		for j=1:n,
			if(pred(j,2) == t(i,2))
				err = err + (pred(j,3) - t(i,3))^2;
			endif
		end
	endif
end


endfunction