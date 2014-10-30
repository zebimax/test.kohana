<?php
class Application_ErrorHandler
{
    public static function handle($e)
    {
        var_dump($e);die();
    }

    public static function handleEx($e)
    {
        var_dump($e);die();
    }
}