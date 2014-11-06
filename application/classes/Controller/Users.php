<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Users extends Controller_Abstract_Json
{
    const NOT_VALID_DATA_FORMAT = 'Не верный формат данных';
    protected $modelName = 'Users';

    /** @var Model_Users */
    protected $model;

    public function action_create()
    {
        $this->modify_data();
    }

    public function action_edit()
    {
        $this->check_required_post('id');
        $this->modify_data(FALSE);
    }

    /**
     * @throws Exception
     */
    public function action_delete()
    {
        $this->check_required_post('id');
        $ids = $this->request->post('id');
        if (!is_array($ids)) {
            throw new \Exception(self::NOT_VALID_DATA_FORMAT);
        }
        $result = $this->model->delete($ids);

        $this->view
             ->set('success', $result->getSuccess())
             ->set('data', $result->getData())
             ->set('message', $result->getMessage())
            ->set('error', $result->getError());
   }

   public function action_list()
    {
        /** @var Model_UsersView $users_view */
        $users_view = Model::factory('UsersView');
        $this->view->set('data' , $users_view->getList());
    }

    /**
     * @param bool $create
     * @return Validation
     */
    private function get_form_data($create = TRUE)
    {
        $name_regexp = '/^[A-ZА-Я_0-9]+$/i';
        $data = Validation::factory($this->request->post())
            ->rule('first_name', 'not_empty')
            ->rule('first_name', 'regex', [':value', $name_regexp])
            ->rule('first_name', 'min_length', [':value', '2'])
            ->rule('first_name', 'max_length', [':value', '32'])
            ->rule('last_name', 'not_empty')
            ->rule('last_name', 'regex', [':value', $name_regexp])
            ->rule('last_name', 'min_length', [':value', '2'])
            ->rule('last_name', 'max_length', [':value', '64'])
            ->rule('email', 'email')
            ->rule('country', 'digit')
            ->rule('city', 'regex', [':value', $name_regexp])
            ->rule('city', 'max_length', [':value', '255'])
            ->rule('address', 'max_length', [':value', '500']);
        if (!$create) {

            $data->rule(
                'id',
                [$this->model, 'user_exists'],
                [':value', ':validation']
            );
        }
        return $data;
    }

    /**
     * @param Validation $validation
     * @return array
     */
    protected function get_form_errors(Validation $validation)
    {
        $errors = [];
        foreach ($validation->errors('user_form_errors') as $field => $field_error) {
            $errors[] = [
                'name' => $field,
                'status' => $field_error
            ];
        }
        return $errors;
    }

    /**
     * @param bool $create
     */
    protected function modify_data($create = TRUE)
    {
        $data = $this->get_form_data($create);
        if ($data->check()) {
            $result = $this->model->modify($data->data());
            if ( ! $result->getSuccess()) {
                $this->view->set('error', $result->getMessage());
            }
        } else {
            $result = $this->get_result([
                'error' => $this->get_form_errors($data)
            ]);
        }

        $this->view
            ->set('success', $result->getSuccess())
            ->set('row', $result->getData())
            ->set('message', $result->getMessage())
            ->set('field_errors', $result->getError());
    }
}