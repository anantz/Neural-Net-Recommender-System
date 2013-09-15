%%Calculates error by comparing predicted ratings with that in test file
function [err] = error(uid)

y = load('u1.test');
m = size(y)(1);
load('predictions.txt');
n = size(pred)(1);
err = 0;
for i=1:m,
	if(y(i,1) == uid)
		for j=1:n,
			if(pred(j,2) == y(i,2))
				err = err + (pred(j,3) - y(i,3))^2;
			endif
		end
	endif
end


endfunction