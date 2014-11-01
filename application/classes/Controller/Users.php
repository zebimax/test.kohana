<?php defined('SYSPATH') or die('No direct script access.');
use Database_PostgreSQL_Result as Result;

class Controller_Users extends Controller_Abstract_Json
{

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
        $query = DB::select()->from('users_view');
        /** @var $res Result */
        $res = $query->execute();
        $this->view->set('data', $res->as_array());
    }
}