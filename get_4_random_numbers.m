function result = get_4_random_numbers()
N=9;   % range desired
p=randperm(N);

vec = [1, 1, 1, 1, 1, 1, 1, 1, 1];  %  9 ones 

for i=1:N
    r=p(i);
    vec(i) = r;
    %disp(r);
end

disp(vec);

%get the first 4 - random positions...
ran_postions = [0,0,0,0];
for j= 1:4
    ran_postions(j) = vec(j);
end
disp(ran_postions);

result = sprintf('%.0f ',ran_postions); %with space , convert from string to double?

disp(class(result));

