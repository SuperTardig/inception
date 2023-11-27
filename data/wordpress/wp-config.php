<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db' );

/** Database username */
define( 'DB_USER', 'user1' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '#r4Ri<Q]7e~AVaeK=#ba. sz=XKKCJ87d]z;*Z;F_ta8G]|M=iV.WI[0#`-PwVoV' );
define( 'SECURE_AUTH_KEY',   ',CE.kIDr8oa_TH1/e1>lby6[;U*q,bI8Yn}x7c`8]$Yo9GXtEXhin1YZhw&W{ERU' );
define( 'LOGGED_IN_KEY',     'SteJ|k}-}kt/fryzF+E4uZDyW^xqrnLO58m,!QJv1qjOWZedG.*=V_3nK*?BO)aJ' );
define( 'NONCE_KEY',         'I1~P{z^n8maN_fLHr:bx%/oTa2z%]s~u5H.]j<~S<<ZTl@ZraoGK98*tm7`dsR}V' );
define( 'AUTH_SALT',         '[#a.C~a*Y6uKkR:-:%Lw.|_oC_Zi$!r!nXR$iU6U;3Z9qbxcCBIz.A+F5EG@B3?6' );
define( 'SECURE_AUTH_SALT',  ' 8wn.>3/p2n7._B1jv<N#qC|/*s(S?@B<jb$fOXn;;Qp5g^JB.[dgzF( LW-7CP~' );
define( 'LOGGED_IN_SALT',    '-~nd{kr_6b.Y,`M<:LcjP;Iw7xJIAa-GND$M,nGashw.9u.H,B4H-7rP>(:]|5@-' );
define( 'NONCE_SALT',        'a9$L,C$.?0e5Xe!q0?SB;<y1t,Ne[q|A<|M M5;gj{A0o`vq!OO,>aGGQK>0qV>{' );
define( 'WP_CACHE_KEY_SALT', 'vo|wkgeFLriQe6Mw%;hz%qHP|]qm[3ycQ3${s5+@v gOG4ecs@0}X!uvuiW+)iUj' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
