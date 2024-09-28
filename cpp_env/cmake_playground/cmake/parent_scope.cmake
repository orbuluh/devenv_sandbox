# Define an inner function that sets a variable in the parent scope
function(inner_function var_name)
    set(${var_name} "Inner Value" PARENT_SCOPE)
endfunction()

# Define an outer function that calls the inner function
function(outer_function_not_propagate var_name)
    inner_function(${var_name})
endfunction()


function(outer_function_propagate_again var_name)
    inner_function(${var_name})
    set(${var_name} ${var_name} PARENT_SCOPE)
endfunction()

# Usage
outer_function_not_propagate(OuterVar)
message(STATUS "OuterVar is now '${OuterVar}'")
# OuterVar is now ''

outer_function_propagate_again(OuterVar)
message(STATUS "OuterVar is now '${OuterVar}'")
# OuterVar is now 'OuterVar'