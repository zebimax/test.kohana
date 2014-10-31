<?php defined('SYSPATH') or die('No direct script access.');

abstract class Controller_Abstract_Json extends Controller
{
    /** @var View */
    protected $view;

    public function after()
    {
        $this->response->body($this->view->render());
    }
    public function __construct(Request $request, Response $response)
    {
        if ( ! $request->is_ajax()) {
            throw new \Exception('Only ajax requests!');
        }
        $this->view = View::factory('json');
        $this->view
            ->set('success', TRUE)
            ->set('result', '')
            ->set('data', '')
            ->set('message', '')
            ->set('error', '');
        parent::__construct($request, $response);
    }
}