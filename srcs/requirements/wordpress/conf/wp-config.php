<?php

define( 'DB_NAME',          getenv("SQL_DATABASE") );
define( 'DB_USER',          getenv("SQL_USER_LOGIN") );
define( 'DB_PASSWORD',      getenv("SQL_USER_PASSWORD") );
define( 'DB_HOST',          getenv("SQL_DOCKER_HOST") . ":" . getenv("SQL_DOCKER_PORT") );
define( 'DB_CHARSET',       getenv("SQL_CHARSET") );
define( 'DB_COLLATE',       getenv("SQL_COLLATE") );

define( 'AUTH_KEY',         'unique1' );
define( 'SECURE_AUTH_KEY',  'unique2' );
define( 'LOGGED_IN_KEY',    'unique3' );
define( 'NONCE_KEY',        'unique4' );
define( 'AUTH_SALT',        'unique5' );
define( 'SECURE_AUTH_SALT', 'unique6' );
define( 'LOGGED_IN_SALT',   'unique7' );
define( 'NONCE_SALT',       'unique8' );
define( 'WP_CACHE_KEY_SALT','unique9' );

define( 'WP_REDIS_HOST', 	getenv("RDS_DOCKER_HOST") );
define( 'WP_REDIS_PORT', 	getenv("RDS_DOCKER_PORT") );

define( 'WP_CACHE', 		true );
define( 'WP_DEBUG', 		false );
define( 'WP_DEBUG_LOG', 	false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

$table_prefix = '42wp_';

require_once(ABSPATH . 'wp-settings.php');