/*
update _state set
	id_terminated = 7
	where id in(2472,3514,3527,3548,4723,4890,4922,6911,10379,8955);
*/

select a.name, wo.opdrachtgever, wo.id_object, we.*
-- select wos.id
	from werkopdracht wo, _state wos,
		werkervaring we, _state wes,
		cv c, _account a
	where wos.id = wo.id_state
		and wos.id_terminated is null
		and c.id_object = wo.id_cv
		and a.id = c.id_account
		and wes.id = we.id_state
		and wes.id_terminated is null
		and we.id_werkopdracht = wo.id_object
		and (select count(we2.id_state)
			from werkervaring we2, _state wes2
			where wes2.id = we2.id_state
				and wes2.id_terminated is null
				and we2.id_werkopdracht = wo.id_object) < 2
	order by wo.id_object;