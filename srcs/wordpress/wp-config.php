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
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

define('FS_METHOD', 'direct');

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
define('AUTH_KEY',         '[|1?CEs)n^T4e5`R@2~YuO*RI;I9gR~K<RFN9-HQgq|#gt^|Lwkgt8M.r+o<o:1&');
define('SECURE_AUTH_KEY',  ')Px)Q?^x[HuZ!T%V5G&a8jo#6fFACm}w^RREUc|1l5<lIq:8emvWK5~MN_d*@>SM');
define('LOGGED_IN_KEY',    'l-&Go<avq~@R2R]~@%rO_vokI=WwfRF}>nGAN#%OHngp46:uR|P1;7E0sxNJ)S1S');
define('NONCE_KEY',        '`1%Rz]1Nz!IogC!R/ct+Gmpv^GvDP/?b<!qW63vjm1MYfI/Z55:k}#a .(Q-ofMc');
define('AUTH_SALT',        'YL0^dR52roU&>k2tW0]MXv^^MY{c>0p+o Kn*V[geq-!nxraW-6PKKlId$r?ePGR');
define('SECURE_AUTH_SALT', '|9qqKU{MuET~OU7y<3ji{Jpa.IM$O^@sxF{n~6wJu+yqSNjM4HdYU #uiXm4%%Q`');
define('LOGGED_IN_SALT',   '70)|B3nEc1bo1lW}5<ah6{vlOVhFZG(<`#{`-!|wjePMN]gDSAm`A[*MFQN|(?^a');
define('NONCE_SALT',       '#i?OiH?;QHj6E[bL&pktro+LV&)pTSjM.#_t0qAG!=,=(*:Fo?Bj*6B`}XT^FKh;');

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
        define( 'ABSPATH', __DIR__ . 'var/www/wordpress' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';