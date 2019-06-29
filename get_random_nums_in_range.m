function result = get_random_nums_in_range()
%rng(0,'twister');

a = 10;
b = 101;
r = (b-a).*rand(12,1) + a;  % 12 random numbers in the range 10 to 101 open interval

r_range = [min(r) max(r)];

r_unique = unique(r);  % to remove repitition of random numbers generated, if any

%disp(class(r));


%disp(class(r_range));
%disp(r_range);
%disp(r);

%i=1;
%disp(class(r(i)));
    
%result = r_range;
integers = [1 2 3 4 5 6 7 8 9 ];


for i=1:9
    num_d = r_unique(i);
    num_int = int16(num_d);
    integers(i) = num_int;
end

%disp(integers);
result = integers;
end