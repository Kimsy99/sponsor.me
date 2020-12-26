select *
from faq
where project_id = 20;

select *
from item
where project_id = 20;


--item_option of project 20
select * 
from item_option
where item_id = 127;

DELETE from item
where item_id = 127;

--reward item of project 20
select *
from reward_item
where item_id = 127;

--perk of project 20
select *
from perk
where perk_id = 2;

select *
from backed_project
where project_id = 20;

insert into backed_project(backer_id, project_id, perk_id, backed_amount)
value(
    1, 20, 3, 30000
)

select *
from backed_project
where project_id = 20;

DELETE from project
where project_id = 20;

DELETE from user
where user_id = 5;





