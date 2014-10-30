<?php defined('SYSPATH') OR die('No direct script access.');

class Kohana_Exception extends Kohana_Kohana_Exception {

    public static function handler(Exception $e)
    {
        exit('test');
        $params = array
        (
            'action'  => 500,
            'message' => rawurlencode($e->getMessage())
        );

        if ($e instanceof HTTP_Exception)
        {
            $params['action'] = $e->getCode();
        }

        // Error sub-request.
        echo Request::factory(Route::get('error')->uri($params))
            ->execute()
            ->send_headers()
            ->body();
    }
}