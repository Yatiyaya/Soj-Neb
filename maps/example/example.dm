#if !defined(USING_MAP_DATUM)

	#include "example_areas.dm"
	#include "example_shuttles.dm"
	#include "example_departments.dm"
	#include "example_jobs.dm"
	#include "example_unit_testing.dm"
	#include "../../mods/valsalia/_valsalia.dme"

	#include "example-1.dmm"
	#include "example-2.dmm"
	#include "example-3.dmm"

	#define USING_MAP_DATUM /datum/map/example

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Testing Site

#endif
