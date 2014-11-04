<?php defined('SYSPATH') or die('No direct script access.');

use Application_Result as Result;

class Controller_Users extends Controller_Abstract_Json
{
    protected $modelName = 'Users';

    /** @var Model_Users */
    protected $model;

    public function action_create()
    {
        $data = $this->get_form_data();
        if ($data->check()) {
            $result = $this->model->create($data->data());
        } else {
            $result = $this->getResult([
                'message' => 'NOT VALID FORM'
            ]);
        }

        $this->view
            ->set('success', $result->getSuccess())
            ->set('row', $result->getData())
            ->set('message', $result->getMessage());
    }


    public function action_delete()
    {
     Request::$current->post();
     $this->view
          ->set('success', false)
          ->set('data', 'Deleted successfully')
          ->set('message', 'Deleted successfully');

   }

   public function action_list()
    {
        /** @var Model_UsersView $users_view */
        $users_view = Model::factory('UsersView');
        $this->view->set('data' , $users_view->getList());
    }

    protected function get_form_data($create = TRUE)
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

    protected function getResult(array $data = [])
    {

        return new Result([
            Result::PARAM_SUCCESS => $this->getResultParam($data, Result::PARAM_SUCCESS),
            Result::PARAM_MESSAGE => $this->getResultParam($data, Result::PARAM_MESSAGE),
            Result::PARAM_DATA => $this->getResultParam($data, Result::PARAM_DATA),
            Result::PARAM_ROW => $this->getResultParam($data, Result::PARAM_ROW),
        ]);
    }

    /**
     * @param array $data
     * @param $param
     * @return bool
     */
    protected function getResultParam(array $data, $param)
    {
        return isset($data[$param])
            ? $data[$param]
            : FALSE;
    }
}