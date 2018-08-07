<?php
/**
 * Copyright Pieter Smets (c)  2018
 */

/**
 * Created by PhpStorm.
 * User: smets
 * Date: 7/08/2018
 * Time: 18:30
 */

   include('connect.php');
   session_start();

   $user_check = $_SESSION['login_user'];

   $ses_sql = mysqli_query($db,"select voornaam from sporter where email = '$user_check' ");

   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);

   $login_session = $row['voornaam'];

   if(!isset($_SESSION['login_user'])){
       header("location:login.php");
   }
?>