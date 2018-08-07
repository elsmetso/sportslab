<?php
/**
 * Copyright Pieter Smets (c)  2018
 */

/**
 * Created by PhpStorm.
 * User: smets
 * Date: 7/08/2018
 * Time: 18:32
 */

   include('session.php');
?>
<html">

   <head>
      <title>Welcome </title>
   </head>

   <body>
      <h1>Welcome <?php echo $login_session; ?></h1>
      <h2><a href = "logout.php">Sign Out</a></h2>
   </body>

</html>