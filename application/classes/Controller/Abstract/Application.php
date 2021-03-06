<?php defined('SYSPATH') or die('No direct script access.');

abstract class Controller_Abstract_Application extends Controller_Template
{

    protected $view;

    /**
     * @throws Exception
     * @throws Kohana_Exception
     */
    public function before()
    {
        $app_config = Kohana::$config->load('application');
        $this->check_defaults($app_config);
        $this->view = View::factory($app_config->get('defaults')['view']);
        $this->template = $app_config->get('defaults')['template'];
        parent::before();
        $this->template->bind('view', $this->view)
            ->set('title', $app_config->get('title'));
    }

    /**
     * @param Kohana_Config_Group $app_config
     * @throws Exception
     */
    private function check_defaults(Kohana_Config_Group $app_config)
    {
        if (
            ( ! is_array($app_config->get('defaults'))) OR
            ( ! isset($app_config->get('defaults')['template'])) OR
            ( ! isset($app_config->get('defaults')['view']))
        ) {
            throw new \Exception(
                'You must specified default template and view in your application config file'
            );
        }
    }
}