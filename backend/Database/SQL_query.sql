select project.project_id as id, project.project_name as project, perk.title as perk, item.item_name as item
from perk, item, reward_item, project
where perk.perk_id = reward_item.perk_id and item.item_id = reward_item.item_id and project.project_id = perk.project_id
ORDER by id, perk asc;

SELECT *
from item;

select project.project_id, project.project_name, project.creator_id, perk.perk_id, perk.price
from project, perk 
where project.project_id = perk.project_id
order by project_id, price asc;

select project.project_id as id, project.project_name, sum(backed_project.backed_amount) as raised_fund
from project, backed_project
where project.project_id = backed_project.project_id
group by project.project_id