/atom/movable/proc/get_base_value()
	return initial(value)

/atom/movable/proc/calculate_value()

	. = get_base_value()

	for(var/k in contents)
		var/atom/movable/M = k
		. += M.calculate_value()

	if(reagents && length(reagents.stored_reagents))
		for(var/reagent_type in reagents.stored_reagents)
			var/reagent_volume = reagents.stored_reagents[reagent_type]
			var/reagent/R = REAGENT(reagent_type)
			. += R.value*reagent_volume

	return .



/atom/movable/proc/get_value()
	if(!value_last)
		value_last = calculate_value()
	return value_last