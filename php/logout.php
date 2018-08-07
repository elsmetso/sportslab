<?php
/**
 * Copyright Pieter Smets (c)  2018
 */

/**
 * Created by PhpStorm.
 * User: smets
 * Date: 7/08/2018
 * Time: 18:33
 */
session_start();

if(session_destroy()) {
    header("Location: login.php");
}
?>