var editor;
$(document).ready(function () {
    $('#info_message').hide();
    $('#error_message').hide();
    var i18n = i18n_config();
    editor = new $.fn.dataTable.Editor({
        ajax: {
            create: {
                url: "/users/create",
                data: formatData,
                label: i18n.create.label
            },
            edit: {
                url:"/users/edit",
                data:formatData
            },
            remove: {
                url:"/users/delete",
                data:formatData
            }
        },
        idSrc: "id",
        i18n: {
            error: {
                system: i18n.error.system
            },
            create: {
                title: i18n.create.title,
                button: i18n.create.button,
                submit: i18n.create.submit
            },
            edit: {
                title: i18n.edit.title,
                button: i18n.edit.button,
                submit: i18n.edit.submit
            },
            remove: {
                title: i18n.remove.title,
                button: i18n.remove.button,
                submit: i18n.remove.submit,
                confirm: {
                    _: i18n.remove.confirm.many,
                    1: i18n.remove.confirm.one
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
            name: "country_id",
            value: "country",
            data: "country_id",
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
                log(JSON.parse(data.responseText).error, true);
            }
        },
        columns: [
            {data: "id"},
            {data: "first_name"},
            {data: "last_name"},
            {data: "email"},
            {
                data: "country_id",
                render: function ( data, type, full, meta ) {
                    return full.country;
                }
            },
            {data: "city"},
            {data: "address"}
        ],
        "language": {
            "search": i18n.language.search,
            "paginate": {
                "previous": i18n.language.paginate.previous,
                "next": i18n.language.paginate.next,
                "first": i18n.language.paginate.first,
                "last": i18n.language.paginate.last
            },
            "zeroRecords": i18n.language.zeroRecords,
            "info":i18n.language.info
        }
    });

    var tableTools = new $.fn.dataTable.TableTools(table, {
        sRowSelect: "os",
        aButtons: [
            {sExtends: "editor_create", editor: editor},
            {sExtends: "editor_edit", editor: editor},
            {sExtends: "editor_remove", editor: editor}
        ]
    });

    config_editor(i18n);

    $(tableTools.fnContainer()).prependTo('#users_wrapper');
});