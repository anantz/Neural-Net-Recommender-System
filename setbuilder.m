t=0;y=0;
p=load('u.data');
p=sortrows(p);
for i=1:943,
	ind = find(p(:,1)==i);
	n = size(ind)(1);
	t1 = n * 0.8;
	t1 = int32(t1);
	starty = ind(1,1);
	endy = ind(1,1)+t1-1;
	startt = ind(1,1)+t1;
	endt = ind(length(ind));
	if (y==0)
		y = p(starty:endy,:);
	else
		y = [y; p(starty:endy,:)];
	endif
	if (t==0)
		t = p(startt:endt,:);
	else
		t = [t; p(startt:endt,:)];
	endif
end
save UNew.txt y;
save u1.txt t;	
