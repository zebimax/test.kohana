var editor; // use a global for the submit and return data rendering in the examples
const REQUIRED_ERROR = 'Это обязательное поле.';
const NAME_ERROR = 'Допустимые символы: буквы, цифры и знак _.';
const LENGTH_ERROR = 'Длина поля от {0} до {1}.';
const EMAIL_ERROR = 'Введите валидный емайл.';
const SELECT_ERROR = 'Недопустимое значение.';

String.prototype.format = function() {
    var str = this;
    for (var i = 0; i < arguments.length; i++) {
        var reg = new RegExp("\\{" + i + "\\}", "gm");
        str = str.replace(reg, arguments[i]);
    }
    return str;
}

$(document).ready(function () {
    $('#info_message').hide();
    $('#error_message').hide();

    editor = new $.fn.dataTable.Editor({
        ajax: {
            create: {
                url:"/users/create",
                data:formatData
            },
            edit: {
                url:"/users/edit",
                data:formatData
            },
            remove: "/users/delete"
        },
        idSrc: "id",
        i18n: {
            error: {
                system: function () {
                    log(JSON.parse(event.target.responseText).msg, true);
                }
            }
        },
        table: "#users",
        fields: [{
            label   : "Имя:",
            name    : "first_name"
        }, {
            label: "Фамилия:",
            name: "last_name"
        }, {
            label: "Емайл:",
            name: "email"
        }, {
            type:  "select",
            label: "Страна:",
            name: "country",
            ipOpts: getCountriesList()
        },{
            label: "Город:",
            name: "city"
        }, {
            label: "Адресс:",
            name: "address"
        }
        ]
    });


    var table = $('#users').DataTable({
        lengthChange: false,
        ajax: {
            url: "/users/list",
            error: function (data) {
                alert(JSON.parse(data.responseText).error);
            }
        },
        columns: [
            {data: "id"},
            {data: "first_name"},
            {data: "last_name"},
            {data: "email"},
            {data: "country"},
            {data: "city"},
            {data: "address"}
        ]
    });

    var tableTools = new $.fn.dataTable.TableTools(table, {
        sRowSelect: "os",
        aButtons: [
            {sExtends: "editor_create", editor: editor},
            {sExtends: "editor_edit", editor: editor},
            {sExtends: "editor_remove", editor: editor}
        ]
    });

    editor.on('submitSuccess', function (e, json) {
        log(json.msg, json.success);
    });

    editor.on( 'preSubmit', function ( e, o ) {
        if ( ! name_validation(o.data.first_name) ) {
            this.error(
                'first_name',
                REQUIRED_ERROR + ' ' + NAME_ERROR + ' ' + LENGTH_ERROR.format(2, 32)
            );
            return false;
        }

        if ( ! last_name_validation(o.data.last_name) ) {
            this.error(
                'last_name',
                REQUIRED_ERROR + ' ' + NAME_ERROR + ' ' + LENGTH_ERROR.format(2, 64)
            );
            return false;
        }

        if ( ! email_field_validation(o.data.email) ) {
            this.error(
                'email',
                EMAIL_ERROR
            );
            return false;
        }

        if ( ! number_validation(o.data.country) ) {
            this.error(
                'country',
                SELECT_ERROR
            );
            return false;
        }

        if ( ! city_validation(o.data.city) ) {
            this.error(
                'city',
                LENGTH_ERROR.format(2, 255)
            );
            return false;
        }

        if ( ! address_validation(o.data.address) ) {
            this.error(
                'address',
                LENGTH_ERROR.format(2, 500)
            );
            return false;
        }
    } );


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
        return data.data || [];
    }

    $(tableTools.fnContainer()).prependTo('#users_wrapper');
});