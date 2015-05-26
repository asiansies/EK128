load phonenos.dat

phonenos1 = int2str(phonenos(1));
phonenos2 = int2str(phonenos(2));
phonenos3 = int2str(phonenos(3));

fprintf('%s-%s-%s\n',phonenos1(1:3),phonenos1(4:6),phonenos1(7:10));
fprintf('%s-%s-%s\n',phonenos2(1:3),phonenos2(4:6),phonenos2(7:10));
fprintf('%s-%s-%s\n',phonenos3(1:3),phonenos3(4:6),phonenos3(7:10));

