<?php
 if (!defined('_INCLUDE')) die('"'.__FILE__.'" not executable... me, i abort.');

	require_once(str_replace('//','/',dirname(__FILE__).'/').'db.inc.php');

	initializeUser($current_user);

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
function initializeUser ($user_id) {

    $user_name = '';
    switch ($user_id) {
        case 'ctl':
            $user_name = 'Amministratore CTL';
            break;
        case 'martynau':
            $user_name = 'Martyna Urbaniak';
            break;
        case 'serenap':
            $user_name = 'Serena Pezzini';
            break;
        case 'giovannar':
            $user_name = 'Giovanna Rizzarelli';
            break;
        case 'carlog':
            $user_name = 'Carlo Alberto Girotto';
            break;
        case 'andreat':
            $user_name = 'Andrea Torre';
            break;
        case 'federicap':
            $user_name = 'Federica Pich';
            break;
        case 'claudial':
            $user_name = 'Claudia Lorito';
            break;
        case 'alessandrob':
            $user_name = 'Alessandro Benassi';
            break;
        case 'mariapiae':
            $user_name = 'Maria Pia Ellero';
    };

    $user_kind = DCTL_USER_GURU;
    $xmldb_user = DCTL_XMLDB_USER_ADMIN;
    $xmldb_pswd = DCTL_XMLDB_PSWD_ADMIN;

    if ($user_name != '') {
        define('DCTL_USER_ID', $user_id);
        define('DCTL_USER_NAME', $user_name);
        define('DCTL_USER_KIND', $user_kind);
        /* 
        define('DCTL_SQL_USER', $sql_user);
        define('DCTL_SQL_PSWD', $sql_pswd);
        */
        define('DCTL_XMLDB_USER', $xmldb_user);
        define('DCTL_XMLDB_PSWD', $xmldb_pswd);
        define('DCTL_USER_IS_EDITOR', $user_kind >= DCTL_USER_EDITOR);
        define('DCTL_USER_IS_ADMIN', $user_kind >= DCTL_USER_ADMIN);
        define('DCTL_USER_IS_GURU', $user_kind >= DCTL_USER_GURU);
    };
};

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

/* NO ?> IN FILE .INC */
