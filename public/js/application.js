var editor; // use a global for the submit and return data rendering in the examples

$(document).ready(function() {
    editor = new $.fn.dataTable.Editor( {
        ajax: {
            create: "/users/create",
            edit:   "/users/edit",
            remove: "/users/delete"
        },
        idSrc: "id",
        i18n: {
            error: {
                system: function() {
                    return JSON.parse(event.target.responseText).error;
                }
            }
        },
        table: "#users",
        fields: [ {
            label: "Код:",
            name: "id"
        },
            {
            label: "Имя:",
            name: "first_name"
        }, {
            label: "Фамилия:",
            name: "last_name"
        }, {
            label: "Емайл:",
            name: "email"
        }, {
            label: "Страна:",
            name: "country"
        }, {
            label: "Город:",
            name: "city"
        }, {
            label: "Адресс:",
            name: "address"
        }
        ]
    } );

    var table = $('#users').DataTable( {
        lengthChange: false,
        ajax: {
            url: "/users/list",
            error: function(data) {
                alert(JSON.parse(data.responseText).error);
            }
        },
        columns: [
            { data: "id" },
            { data: "first_name" },
            { data: "last_name" },
            { data: "email" },
            { data: "country" },
            { data: "city" },
            { data: "address" }
        ]
    } );

    var tableTools = new $.fn.dataTable.TableTools( table, {
        sRowSelect: "os",
        aButtons: [
            { sExtends: "editor_create", editor: editor },
            { sExtends: "editor_edit",   editor: editor },
            { sExtends: "editor_remove", editor: editor }
        ]
    } );

    editor.on('submitSuccess', function(e, json, data ) {
        var info_element = (json.success) ? $('#info_message') : $('#error_message');
        info_element.html(json.msg);
        info_element.show();

        setTimeout( function () {
            info_element.html('');
            info_element.hide();
        }, 2500 );
    });


    $( tableTools.fnContainer() ).prependTo( '#users_wrapper' );
    $('#info_message').hide();
    $('#error_message').hide();
} );