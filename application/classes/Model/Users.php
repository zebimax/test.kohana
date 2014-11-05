<?php
use Application_Result as Result;
use Model_UsersView as UsersView;


class Model_Users extends Model_AbstractPSQL
{
    const MODEL_NAME = 'Users';
    const MODIFY_ERROR = 'Ошибка создания/редактирования.';
    const CREATE_TPL = 'Пользователь с ИД %s создан.';
    const UPDATE_TPL = 'Пользователь с ИД %s отредактирован.';
    const NOT_EXISTS_ERROR_TPL = 'User with id % doesn\'t exists';

    const DELETE_ERROR = 'Ошибка удаления';
    const DELETE_MESSAGE = 'Удаление успешно выполнено';

    protected $table = 'users';

    public function modify($data)
    {

        if (isset ($data['id']) && (int)$data['id']) {
            $id = (int)$data['id'];
        } else {
            $id = 0;
        }
        $query = DB::query(
            Database::SELECT,
            "select users_modify(:id, :name, :last_name, :email, :country_id, :city, :address)"
        );
        $query->parameters([
            ':id' => $id,
            ':name' => $data['first_name'],
            ':last_name' => $data['last_name'],
            ':email' => $data['email'],
            ':country_id' => $data['country_id'],
            ':city' => $data['city'],
            ':address' => $data['address']
        ]);
        $modified = 0;
        $success = FALSE;
        $message  = self::MODIFY_ERROR;
        try {
            /** @var Database_Result $res */
            $res = $query->execute();
            $modified = $res->get('users_modify');

        } catch (\Exception $e) {
            // maybe used for logging
        }

        if ($modified) {
            $success = TRUE;
            if ($id) {
                $tpl = self::UPDATE_TPL;
            } else {
                $tpl = self::CREATE_TPL;
                $data['id'] = $modified;
            }
            $message = sprintf($tpl, $data['id']);
        }
        $row = $this->get_users_view_model()->get($data['id']);
        return new Result([
            Result::PARAM_SUCCESS => $success,
            Result::PARAM_MESSAGE => $message,
            Result::PARAM_DATA => $row[0]
        ]);
    }

    public function delete(array $ids = [])
    {
        $query = DB::query(
            Database::SELECT,
            "select users_delete(:ids)"
        );
        $query->parameters([
            ':ids' => $this->get_array_type($ids)
        ]);
        $success = FALSE;
        $message  = self::DELETE_ERROR;
        $modified = 0;
        try {
            /** @var Database_Result $res */
            $res = $query->execute();
            $modified = $res->get('users_delete');

        } catch (\Exception $e) {
            // maybe used for logging
        }

        if ($modified) {
            $success = TRUE;
            $message = self::DELETE_MESSAGE;
        }

        return new Result([
            Result::PARAM_SUCCESS => $success,
            Result::PARAM_MESSAGE => $message
        ]);
    }

    public function user_exists($id, Validation $validation)
    {
        $users_view = $this->get_users_view_model();
        $res = $users_view->get($id);
        if ( ! isset($res[0]) ) {
            $validation
                ->error('id', sprintf(self::NOT_EXISTS_ERROR_TPL, $id));
        }
    }

    /**
     * @return UsersView
     */
    protected function get_users_view_model()
    {
        $users_view = Kohana_Model::factory(UsersView::MODEL_NAME);
        return $users_view;
    }

    private function get_array_type(array $array)
    {
        return '{' . implode(',', $array) . '}';
    }
}