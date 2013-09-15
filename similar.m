function [sim]= similar(totalUsers)
%%===========Calculates similarity===================
load ('Theta.txt');
sim = 0;
for i=1:totalUsers,
	s = 0;
	for j=1:totalUsers,
			t1 = Theta(i,:) .^ 2;
			t2 = Theta(j,:) .^ 2;
			t = (Theta(i,:) * Theta(j,:)')/(sqrt(sum(t1(:))) * sqrt(sum(t2(:)))); 
		if (s == 0)
			s = t;
		else
			s = [s t];
		endif
	end
	if (sim == 0)
		sim = s;
	else
		sim = [sim; s];
	endif
end		

save similarity.txt sim; 		
endfunction	


