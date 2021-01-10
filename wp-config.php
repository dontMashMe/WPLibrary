<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wpbaza' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '/0ZWI[?9v#dNj$<AJt>T0<[y3=2I7>ahsF~>>o%S&h_Qf$zMk-<}]efh3QQu3sZg' );
define( 'SECURE_AUTH_KEY',  '|-_jArVGvw*!5e+6J6rHU>G}b#t|{?`H>e=&Af(4Y<C|cffAn[Y[ _l))X[Ht4@x' );
define( 'LOGGED_IN_KEY',    'y]|Chp.F(eiZP+Ehq?&CT2Wl*{2lGBW6F[2DK_Q{{373%}_=Z#I@b6]ft$jWvw,O' );
define( 'NONCE_KEY',        'z#D#!=?s -_+g^y5T)YgBT~r>[UNXN2N$TDic-@6WsJ[#c:eo!L-[_c:.erB/+A;' );
define( 'AUTH_SALT',        '{V,_EJN9dR8SQv7OK|SGJbk48b50nGpk9E7{o5@aZHyPf(x]}lC`!vgka-rc*J?@' );
define( 'SECURE_AUTH_SALT', 'wh>+u?h0}-g4YQ-c[8l6I[1hd0?w@/P`LgX)P@/.$Gjl/,RqFg5T)(u`8YEZE:2J' );
define( 'LOGGED_IN_SALT',   'piQ?u.FzA/hNwo(.C>8XW!V*MF3ou;=xn[Tl[B=^w8mG|Y_}RurK#%hHWo6]+uzk' );
define( 'NONCE_SALT',       '+&n@2CabKZiVQ|+&B]Jkd,:]hcIgHkPIkj<%B?;,7xSq:dGI.sy6PNJ(LX2;<[Vy' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
