<?php defined('SYSPATH') or die('No direct script access.');

class Application_Result
{
    const PARAM_SUCCESS = 'success';
    const PARAM_MESSAGE = 'message';
    const PARAM_DATA = 'data';
    const PARAM_ERROR = 'error';


    protected $success;
    protected $message;
    protected $data;
    protected $error;


    public function __construct(array $params = array())
    {
        if (!empty($params)) {
            foreach ($params as $key => $value) {
                switch ($key) {
                    case self::PARAM_MESSAGE:
                        $this->message = $value;
                        break;
                    case self::PARAM_SUCCESS:
                        $this->success = $value;
                        break;
                    case self::PARAM_DATA:
                        $this->data = $value;
                        break;
                    case self::PARAM_ERROR:
                        $this->error = $value;
                        break;
                    default:
                        break;
                }
            }
        }
    }

    static public function create()
    {
        return new self();
    }

    /**
     * @param $message
     *
     * @return Application_Result
     */
    public function setMessage($message)
    {
        $this->message = $message;
        return $this;
    }

    public function getMessage()
    {
        return $this->message;
    }

    /**
     * @param $success
     *
     * @return Application_Result
     */
    public function setSuccess($success)
    {
        $this->success = $success;
        return $this;
    }

    public function getSuccess()
    {
        return $this->success;
    }

    /**
     * @param $data
     * @return Application_Result
     */
    public function setData($data)
    {
        $this->data = $data;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getData()
    {
        return $this->data;
    }

    /**
     * @return mixed
     */
    public function getError()
    {
        return $this->error;
    }
}
