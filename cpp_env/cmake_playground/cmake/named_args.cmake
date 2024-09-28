function(COMPLEX)
    cmake_parse_arguments(
        COMPLEX_PREFIX       # Prefix for parsed arguments
        "FLAG1;FLAG2"     # Boolean flags (no value expected)
        "ONE_VALUE;ONE_VALUE2"  # Single-value arguments
        "MULTI_VALUES"       # Multi-value arguments
        ${ARGN}              # Arguments passed to the function
    )
    message("COMPLEX_PREFIX_FLAG1=${COMPLEX_PREFIX_FLAG1}")
    message("COMPLEX_PREFIX_FLAG2=${COMPLEX_PREFIX_FLAG2}")
    message("COMPLEX_PREFIX_ONE_VALUE=${COMPLEX_PREFIX_ONE_VALUE}")
    message("COMPLEX_PREFIX_ONE_VALUE2=${COMPLEX_PREFIX_ONE_VALUE2}")
    message("COMPLEX_PREFIX_MULTI_VALUES=${COMPLEX_PREFIX_MULTI_VALUES}")
    message("COMPLEX_PREFIX_UNPARSED_ARGUMENTS=${COMPLEX_PREFIX_UNPARSED_ARGUMENTS}")
endfunction()

complex(FLAG1
        MULTI_VALUES some other values
        ONE_VALUE value
        expected_not_parsed1 expected_not_parsed2)

# COMPLEX_PREFIX_FLAG1=TRUE
# COMPLEX_PREFIX_FLAG2=FALSE
# COMPLEX_PREFIX_ONE_VALUE=value
# COMPLEX_PREFIX_ONE_VALUE2=
# COMPLEX_PREFIX_MULTI_VALUES=some;other;values
# COMPLEX_PREFIX_UNPARSED_ARGUMENTS=expected_not_parsed1;expected_not_parsed2