<?php

session_start();
$email = $_SESSION["email"] ?? "";
print_r("Welcome $email !<br>");