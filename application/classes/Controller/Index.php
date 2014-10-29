<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Index extends Controller_Application {

    public function action_index()
    {
        $this->view->set('appName', 'Test Users Application');
    }
}
