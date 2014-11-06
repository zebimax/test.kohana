<?php defined('SYSPATH') or die('No direct script access.');

use Application_Result as Result;

abstract class Controller_Abstract_Json extends Controller
{
    const NOT_REQUIRED_PARAM_TPL = 'Не передан обязательный параметр %s ';

    /** @var View */
    protected $view;

    protected $model;

    protected $modelName;

    /**
     * @throws View_Exception
     */
    public function after()
    {
        $this->response->body($this->view->render());
    }

    /**
     * @param Request $request
     * @param Response $response
     * @throws Exception
     */
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
        $this->init_view();
        $this->init_model();
    }

    /**
     * @param array $data
     * @return Application_Result
     */
    protected function get_result(array $data = [])
    {
        return new Result([
            Result::PARAM_SUCCESS => $this->get_result_param($data, Result::PARAM_SUCCESS),
            Result::PARAM_MESSAGE => $this->get_result_param($data, Result::PARAM_MESSAGE),
            Result::PARAM_DATA => $this->get_result_param($data, Result::PARAM_DATA),
            Result::PARAM_ERROR => $this->get_result_param($data, Result::PARAM_ERROR)
        ]);
    }

    /**
     * @param array $data
     * @param $param
     * @return bool
     */
    protected function get_result_param(array $data, $param)
    {
        return isset($data[$param])
            ? $data[$param]
            : FALSE;
    }

    /**
     * @param $param
     * @throws Exception
     */
    protected function check_required_post($param)
    {
        if ( ! $this->request->post($param)) {
            throw new \Exception(
                sprintf(
                    self::NOT_REQUIRED_PARAM_TPL,
                    $param
                ));
        }
    }

    private function init_view()
    {
        $this->view = View::factory('json');
        $this->view
            ->set('success', TRUE)
            ->set('data', '')
            ->set('message', '')
            ->set('error', '')
            ->set('row', [])
           ->set('field_errors', []);
    }

    private function init_model()
    {
        if ($this->modelName) {
            $this->model = Kohana_Model::factory($this->modelName);
        }
    }
}