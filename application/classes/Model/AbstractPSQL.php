<?php
use Database_PostgreSQL_Result as Result;


class Model_AbstractPSQL
{
    protected $table;

    public function getList()
    {
        $query = DB::select()->from($this->table);
        /** @var $res Result */
        $res = $query->execute();
        return $res->as_array();
    }

    public function get($id)
    {
        $query = DB::select()
            ->from($this->table)
            ->where('id', '=', $id);
        /** @var $res Result */
        $res = $query->execute();
        return $res->as_array();
    }
}