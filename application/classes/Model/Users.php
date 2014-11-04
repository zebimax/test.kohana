<?php
use Application_Result as Result;
use Model_UsersView as UsersView;


class Model_Users extends Model_AbstractPSQL
{
    const MODEL_NAME = 'Users';

    protected $table = 'users';

    public function create($data)
    {
        $query = DB::query(
            Database::SELECT,
            "select users_insert(:name, :last_name, :email, :country_id, :city, :address)"
        );
        $query->parameters([
            ':name' => $data['first_name'],
            ':last_name' => $data['last_name'],
            ':email' => $data['email'],
            ':country_id' => $data['country'],
            ':city' => $data['city'],
            ':address' => $data['address']
        ]);
        /** @var Database_Result $res */
        $res = $query->execute();
        $data['id'] = $res->get('users_insert');

        return new Result([
            Result::PARAM_SUCCESS => TRUE,
            Result::PARAM_MESSAGE => sprintf('User created with id %s', $data['id']),
            Result::PARAM_DATA => $data
        ]);
    }

    public function user_exists($id, Validation $validation)
    {
        /** @var UsersView $users_view */
        $users_view = Kohana_Model::factory(UsersView::MODEL_NAME);
        $res = $users_view->get($id);
        if ( ! isset($res[0]) ) {
            $validation->error('id', 'User with id % doesn\'t exists');
        }
    }
}