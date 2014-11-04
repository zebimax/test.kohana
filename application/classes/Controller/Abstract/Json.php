<?php defined('SYSPATH') or die('No direct script access.');

abstract class Controller_Abstract_Json extends Controller
{
    /** @var View */
    protected $view;

    protected $model;

    protected $modelName;


    public function after()
    {
        $this->response->body($this->view->render());
    }

    public function __construct(Request $request, Response $response)
    {
        if ( ! $request->is_ajax()) {
            throw new \Exception('Only ajax requests!');
        }
        $this->init();

        parent::__construct($request, $response);
    }

    public function init()
    {
        $this->initView();
        $this->initModel();
    }

    private function initView()
    {
        $this->view = View::factory('json');
        $this->view
            ->set('success', TRUE)
            ->set('data', '')
            ->set('message', '')
            ->set('row', []);
    }

    private function initModel()
    {
        if ($this->modelName) {
            $this->model = Kohana_Model::factory($this->modelName);
        }
    }
}