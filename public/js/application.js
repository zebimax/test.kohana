var editor; // use a global for the submit and return data rendering in the examples

$(document).ready(function() {
    editor = new $.fn.dataTable.Editor( {
        ajax: "/users/list",
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

    var table = $('#example').DataTable( {
        lengthChange: false,
        ajax: "/users/list",
        columns: [
            { data: null, render: function ( data, type, row ) {
                // Combine the first and last names into a single table field
                return data.first_name+' '+data.last_name;
            } },
            { data: "position" },
            { data: "office" },
            { data: "extn" },
            { data: "start_date" },
            { data: "salary", render: $.fn.DataTable.render.number( ',', '.', 0, '$' ) }
        ]
    } );

    var tableTools = new $.fn.DataTable.TableTools( table, {
        sRowSelect: "os",
        aButtons: [
            { sExtends: "editor_create", editor: editor },
            { sExtends: "editor_edit",   editor: editor },
            { sExtends: "editor_remove", editor: editor }
        ]
    } );
    $( tableTools.fnContainer() ).appendTo( '#example_wrapper .col-xs-6:eq(0)' );
} );