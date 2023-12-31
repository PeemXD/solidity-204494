{

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function validator_revert_t_uint256(value) {
        if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
    }

    function abi_decode_t_uint256(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function store_literal_in_memory_8dd422c66475327620a41f77bf727530d32d963efc60e41d77546d765327b07c(memPtr) {

        mstore(add(memPtr, 0), "require collateral greater than ")

        mstore(add(memPtr, 32), "equal to 150%")

    }

    function abi_encode_t_stringliteral_8dd422c66475327620a41f77bf727530d32d963efc60e41d77546d765327b07c_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 45)
        store_literal_in_memory_8dd422c66475327620a41f77bf727530d32d963efc60e41d77546d765327b07c(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_8dd422c66475327620a41f77bf727530d32d963efc60e41d77546d765327b07c__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_8dd422c66475327620a41f77bf727530d32d963efc60e41d77546d765327b07c_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_81ea5fdb311c40e6546c569898b145fb8df5f84e5832d3bc52d8fd290eb15e2b(memPtr) {

        mstore(add(memPtr, 0), "money must greater than 0")

    }

    function abi_encode_t_stringliteral_81ea5fdb311c40e6546c569898b145fb8df5f84e5832d3bc52d8fd290eb15e2b_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 25)
        store_literal_in_memory_81ea5fdb311c40e6546c569898b145fb8df5f84e5832d3bc52d8fd290eb15e2b(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_81ea5fdb311c40e6546c569898b145fb8df5f84e5832d3bc52d8fd290eb15e2b__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_81ea5fdb311c40e6546c569898b145fb8df5f84e5832d3bc52d8fd290eb15e2b_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x12() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x12)
        revert(0, 0x24)
    }

    function panic_error_0x11() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x11)
        revert(0, 0x24)
    }

    function checked_div_t_uint256(x, y) -> r {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        if iszero(y) { panic_error_0x12() }

        r := div(x, y)
    }

    function checked_mul_t_uint256(x, y) -> product {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        let product_raw := mul(x, y)
        product := cleanup_t_uint256(product_raw)

        // overflow, if x != 0 and y != product/x
        if iszero(
            or(
                iszero(x),
                eq(y, div(product, x))
            )
        ) { panic_error_0x11() }

    }

}
