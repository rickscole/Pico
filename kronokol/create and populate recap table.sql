


create table krn.recap 
(
    id int primary key identity(1, 1)
    , ts datetime2(7)
    , start_date datetime2(7)
    , end_date datetime2(7)
    , value nvarchar(4000)
)

insert into krn.recap 
select
ts_recap
, startdate
, enddate
, value 
from tbl_recap
