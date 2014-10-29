<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Application extends Controller_Template {

    protected $view;

    public function before()
    {
        $this->view = View::factory(
            Kohana::$config->load('application.defaults.view')
        );
        $this->template = Kohana::$config->load('application.defaults.template');
        parent::before();
        $this->template->bind('view', $this->view);
    }
}