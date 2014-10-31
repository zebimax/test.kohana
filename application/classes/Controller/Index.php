<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Index extends Controller_Abstract_Application
{

    public function action_index()
    {

    }

    public function action_error(array $params = [])
    {
        $this->view = 'error';
    }

}