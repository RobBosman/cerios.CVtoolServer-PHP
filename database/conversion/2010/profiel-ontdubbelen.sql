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
