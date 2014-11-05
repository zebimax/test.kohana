function i18n_config()
{
    return {
        error: {
            system: function () {
                log(JSON.parse(event.target.responseText).msg, true);
            }
        },
        create: {
            title: 'Новая запись',
            button: 'Добавить',
            submit: 'Добавить',
            label: 'Новая запись'
        },
        edit: {
            title: 'Редактирование',
            button: 'Изменить',
            submit: 'Сохранить',
            label: 'Редактирование'
        },
        remove: {
            title: 'Удаление',
            button: 'Удалить',
            submit: 'Удалить',
            label: 'Удаление',
            confirm: {
                many: 'Удаление. Количество записей для удаления: %d',
                one: 'Удалить одну запись'
            }
        },
        messages: {
            errors: {
                required: 'Это обязательное поле.',
                name: 'Допустимые символы: буквы, цифры и знак _.',
                length: 'Длина поля от {0} до {1}.',
                email: 'Введите валидный емайл.',
                select: 'Недопустимое значение.'
            }
        },
        language: {
            paginate: {
                previous: "Пред.",
                next: "След.",
                first: "В начало",
                last: "В конец"
            },
            search: "Поиск",
            loadingRecords: "Загрузка",
            zeroRecords: "Нет записей",
            info: "_START_ - _END_ из _TOTAL_ записей"
        }
    }
}
