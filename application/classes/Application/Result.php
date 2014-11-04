<?php

class Application_Result
{
    const PARAM_SUCCESS = 'success';
    const PARAM_MESSAGE = 'message';
    const PARAM_DATA = 'data';

    protected $success;

    protected $message;

    protected $data;

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
}
