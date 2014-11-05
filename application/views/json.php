<?php
echo json_encode([
    'data' => $data,
    'success' => $success,
    'msg' => $message,
    'row' => $row,
    'error' => $error,
    'fieldErrors' => $field_errors
]);