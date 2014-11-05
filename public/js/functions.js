String.prototype.format = function() {
    var str = this;
    for (var i = 0; i < arguments.length; i++) {
        var reg = new RegExp("\\{" + i + "\\}", "gm");
        str = str.replace(reg, arguments[i]);
    }
    return str;
}

function getCountriesList(){
    var list = new Array({"label" : "name", "value" : "id"});

    list.splice(0,1);
    $.ajax({
        url: '/countries/list',
        async: false,
        dataType: 'json',
        success: function (json) {
            var obj = {},
                data = json.data;

            for(var i = 0; i < data.length; i++){
                obj = { "label" : data[i]['name'], "value" : data[i]['id']};
                list.push(obj);
            }
        },
        error: function(objRequest, error, error_msg){
            var message = objRequest.responseJSON !== 'undefined'
                ? objRequest.responseJSON.msg
                : error_msg;
            log('Error in country list:' + message, true);
        }
    });
    return list;
}

function log(message, is_error) {
    var info_element = (is_error) ? $('#error_message') : $('#info_message');
    info_element.html(message);
    info_element.show();

    setTimeout(function () {
        info_element.html('');
        info_element.hide();
    }, 2500);
}

function formatData(data) {

    var form_data = data.data || [];
    if (data.id) {
        form_data['id'] = data.id;
    }
    return form_data;
}