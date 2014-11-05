<?php defined('SYSPATH') OR die('No direct script access.');

class Kohana_Exception extends Kohana_Kohana_Exception {

    public static function _handler(Exception $e)
    {
        $error = $data = $e->getMessage();
        $success = $row = FALSE;
        $field_errors = [];

        $view = View::factory('json')
            ->bind('success', $success)
            ->bind('data', $error)
            ->bind('message', $error)
            ->bind('row', $row)
            ->bind('error', $error)
            ->bind('field_errors', $field_errors);

        $response = Response::factory();
        $response->status(500);
        $response->headers('Content-Type', 'application/json; charset=utf-8');

        $response->body($view->render());
        return $response;
    }
}