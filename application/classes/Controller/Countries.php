<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Countries extends Controller_Abstract_Json
{
    protected $modelName = 'Countries';

    /** @var Model_Countries */
    protected $model;

    public function action_list()
    {
        $this->view->set('data' , $this->model->getList());
    }
}