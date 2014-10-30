<?php defined('SYSPATH') or die('No direct script access.');

abstract class Controller_Abstract_Json extends Controller
{

    public function __construct(Request $request, Response $response)
    {
        if ( ! $request->is_ajax()) {
            throw new \Exception('Only ajax requests!');
        }
        parent::__construct($request, $response);
    }

}