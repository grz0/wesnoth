/*
   Copyright (C) 2003 - 2018 the Battle for Wesnoth Project https://www.wesnoth.org/

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY.

   See the COPYING file for more details.
*/

#pragma once

namespace utils {

template<typename T>
class guard_value {
	T* ref_;
	T old_val_;
public:
	guard_value(T& ref, T new_val)
		: ref_(&ref)
		, old_val_(ref)
	{
		ref = new_val;
	}
	~guard_value()
	{
		*ref_ = old_val_;
	}
};

}
