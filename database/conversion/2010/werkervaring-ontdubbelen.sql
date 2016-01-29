/*
update _state set
	id_terminated = 7
	where id in(3518,3532,3552,4573,4598,4619,4712,4901,4927,5072,5319,5339,6144,6305,6518,6915,7287,7304,7654,8872,9186,9531,10585);
*/

select a.name, wo.opdrachtgever, we1.*
-- select wes1.id
	from werkopdracht wo, _state wos,
		werkervaring we1, _state wes1,
		werkervaring we2, _state wes2,
		cv c, _account a
	where wos.id = wo.id_state
		and wos.id_terminated is null
		and wes1.id = we1.id_state
		and wes1.id_terminated is null
		and wes2.id = we2.id_state
		and wes2.id_terminated is null
		and we1.id_werkopdracht = wo.id_object
		and we2.id_werkopdracht = wo.id_object
		and we1.locale = we2.locale
		and we1.id_state < we2.id_state
		and c.id_object = wo.id_cv
		and a.id = c.id_account
	order by wo.id_object;

/*
select a.name, ps.*, p.*
	from profiel p, _state ps,
		cv c, _account a
	where ps.id = p.id_state
		and ps.id_terminated is null
		and c.id_object = p.id_cv
		and a.id = c.id_account
		and (select count(pp.id_state)
			from profiel pp, _state pps
			where pps.id = pp.id_state
				and pps.id_terminated is null
				and pp.id_cv = p.id_cv
				and pp.locale = p.locale) != 1
	order by p.id_cv, ps.id;
*/