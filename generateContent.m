function [k] = generateContent(uid)
load('UNew.txt');
b = load('refinedata.txt');
X=0;
for i=1:size(y)(1),
	if (uid == y(i,1))
		for j=1:size(b)(1),
			if (y(i,2) == b(j,1))
				if (X == 0)
					X = b(j,2:end);
				else
					X = [X;b(j,2:end)];
				endif
			endif
		end
	endif
end						
save content.txt X;