<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Users extends Controller_Abstract_Json
{
    protected $modelName = 'UsersView';

    /** @var Model_UsersView */
    protected $model;

    public function action_create()
    {
        Request::$current->post();
        $this->view
            ->set('success', false)
            ->set('data', 'Deleted successfully')
            ->set('message', 'Not Created');
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
}