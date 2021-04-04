
--[========[Unit Test Helpers]========]

if rawget(unit_test) ~= nil then
    print("Loading unit_test module...")

	function unit_test.finish(result)
		wesnoth.wml_actions.endlevel{
			test_result = result,
			linger_mode = true
		}
	end

	function unit_test.fail()
		unit_test.finish('fail')
	end

	function unit_test.pass()
		unit_test.finish('pass')
	end

    function unit_test.tostring(val)
        -- This exists so custom behaviour can be added for specific types if required.
        return tostring(val)
    end

    function unit_test.log(prefix, message)
        std_print(prefix .. ': ' .. message)
    end

	function unit_test.fail_if(condition, message)
		if condition then
            std_print('Failed because fail_if condition was true', message)
			unit_test.fail()
		else
			unit_test.pass()
		end
	end

	function unit_test.pass_if(condition, message)
		if condition then
			unit_test.pass()
		else
            std_print('Failed because pass_if condition was false', message)
			unit_test.fail()
		end
	end

	function unit_test.assert(condition, message)
		if not condition then
            std_print('Assertion failed: ' .. message)
			unit_test.fail()
		end
	end

	function unit_test.assert_not(condition, message)
		if condition then
            std_print('Negative assertion failed', message)
			unit_test.fail()
		end
	end

	function unit_test.assert_equal(a, b, message)
		if a ~= b then
            local expr = ('expected %s == %s'):format(unit_test.tostring(a), unit_test.tostring(b))
            std_print('Assertion failed (' .. expr .. ')', message)
			unit_test.fail()
		end
	end
	
	function unit_test.assert_not_equal(a, b, message)
		if a == b then
            local expr = ('expected %s ~= %s'):format(unit_test.tostring(a), unit_test.tostring(b))
            std_print('Assertion failed (' .. expr .. ')', message)
			unit_test.fail()
		end
	end
end