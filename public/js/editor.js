function config_editor(i18n) {

    editor.on('submitSuccess', function (e, json) {
        log(json.msg, !json.success);
    });

    editor.on( 'preSubmit', function ( e, o ) {
        if (o.action === 'edit' || o.action === 'create') {
            this.check_modify(o.data);
        }
    } );
    editor.on( 'open', function ( e, type ) {
        $('.DTE_Form_Content').find('select,input').addClass('form-control');
    } );

    editor.check_modify = function(data) {

        if ( ! name_validation(data.first_name) ) {
            this.error(
                'first_name',
                i18n.messages.errors.required
                + ' ' + i18n.messages.errors.name
                + ' ' + i18n.messages.errors.length.format(2, 32)
            );
            return false;
        }

        if ( ! last_name_validation(data.last_name) ) {
            this.error(
                'last_name',
                i18n.messages.errors.required
                + ' ' + i18n.messages.errors.name
                + ' ' + i18n.messages.errors.length.format(2, 64)
            );
            return false;
        }

        if ( ! email_field_validation(data.email) ) {
            this.error(
                'email',
                i18n.messages.errors.email
            );
            return false;
        }

        if ( ! number_validation(data.country_id) ) {
            this.error(
                'country',
                i18n.messages.errors.select
            );
            return false;
        }

        if ( ! city_validation(data.city) ) {
            this.error(
                'city',
                i18n.messages.errors.length.format(2, 255)
            );
            return false;
        }

        if ( ! address_validation(data.address) ) {
            this.error(
                'address',
                i18n.messages.errors.length.format(2, 500)
            );
            return false;
        }
    }
}