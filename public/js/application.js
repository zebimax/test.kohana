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
        table: "#example",
        fields: [ {
            label: "First name:",
            name: "first_name"
        }, {
            label: "Last name:",
            name: "last_name"
        }, {
            label: "Position:",
            name: "position"
        }, {
            label: "Office:",
            name: "office"
        }, {
            label: "Extension:",
            name: "extn"
        }, {
            label: "Start date:",
            name: "start_date"
        }, {
            label: "Salary:",
            name: "salary"
        }
        ]
    } );
    editor.on('submitSuccess', function(e, json, data ) {
        if (json.success) {
            $('#info_message').html(json.msg);
            $('#info_message').show();

            setTimeout( function () {
                $('#info_message').html('');
                $('#info_message').hide();
            }, 2500 );
        } else {
            $('#error_message').html(json.msg);
            $('#error_message').show();
            setTimeout( function () {
                $('#error_message').html('');
                $('#error_message').hide();
            }, 2500 );
        }
    });
    var table = $('#example').DataTable( {
        lengthChange: false,
        ajax: {
            url: "/users/list",
            error: function(data) {
                alert(JSON.parse(data.responseText).error);
            }
        },
        columns: [
            { data: null, render: function ( data, type, row ) {
                // Combine the first and last names into a single table field
                return data.first_name+' '+data.last_name;
            } },
            { data: "position" },
            { data: "office" },
            { data: "extn" },
            { data: "start_date" },
            { data: "salary", render: $.fn.dataTable.render.number( ',', '.', 0, '$' ) }
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
    $( tableTools.fnContainer() ).prependTo( '#example_wrapper' );
    $('#info_message').hide();
    $('#error_message').hide();
} );