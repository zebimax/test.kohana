
function name_validation(value) {
    return minlength_validation(value, 2)
        && maxlength_validation(value, 32)
        && name_symbols_validation(value)
}


function last_name_validation(value) {
    return minlength_validation(value, 2)
        && maxlength_validation(value, 64)
        && name_symbols_validation(value)
}

function email_field_validation(value) {
    return maxlength_validation(value, 255)
        && email_validation(value)
}

function city_validation(value) {
    return value === "" | (maxlength_validation(value, 255)
        && name_symbols_validation(value));
}

function address_validation(value) {
    return maxlength_validation(value, 500);
}

function name_symbols_validation(value) {
    return /^[A-ZА-Я_0-9]+$/i.test( value );
}

function number_validation(value) {
    return /^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/.test( value );
}

function email_validation(value) {
    return /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/.test( value );
}

function minlength_validation( value, param ) {
    return value.length >= param;
}

function maxlength_validation( value, param ) {
    return value.length <= param;

}
