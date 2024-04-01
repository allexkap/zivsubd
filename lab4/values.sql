insert into tbl values (0, 3), (1, 8), (2, 5), (3, 0), (4, 1), (5, 9), (6, 4), (7, 2), (8, 6), (9, 7);
insert into sub1.tbl select * from tbl;
insert into sub2.tbl values (0, 'a'), (1, 'b'), (2, 'c'), (3, 'd'), (4, 'e'),
                            (5, 'f'), (6, 'g'), (7, 'h'), (8, 'i'), (9, 'j');
