<?php

class Request
{
    public function get($key, $default = null)
    {
        return isset($_GET[$key])? $_GET[$key] : $default;
    }
    public function post($key, $default = null)
    {
        return isset($_POST[$key])? $_POST[$key] : $default;
    }
}