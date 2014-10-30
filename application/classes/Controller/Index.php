<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Index extends Controller_Abstract_Application
{

    public function action_index()
    {

    }

    public function error_action()
    {
        $this->view = 'error';
    }

}