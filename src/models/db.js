import { Pool } from 'pg';

/**
 * PostgreSQL connection pool.
 *
 * Local development:
 * Uses DB_URL from your local .env file.
 *
 * Render production:
 * Uses DATABASE_URL from the Render environment settings.
 */

const connectionString =
    process.env.DATABASE_URL || process.env.DB_URL;

if (!connectionString) {
    throw new Error(
        'Database connection string is missing. Set DATABASE_URL or DB_URL.'
    );
}

const isRenderDatabase =
    connectionString.includes('render.com');

const pool = new Pool({
    connectionString,
    ssl: isRenderDatabase
        ? {
            rejectUnauthorized: false
        }
        : false
});

/**
 * Export either:
 * - a logging wrapper in development
 * - the normal PostgreSQL pool in production
 */
let db;

if (
    process.env.NODE_ENV === 'development' &&
    process.env.ENABLE_SQL_LOGGING === 'true'
) {
    db = {
        async query(text, params) {
            try {
                const start = Date.now();

                const result = await pool.query(text, params);

                const duration = Date.now() - start;

                console.log('Executed query:', {
                    text: text.replace(/\s+/g, ' ').trim(),
                    duration: `${duration}ms`,
                    rows: result.rowCount
                });

                return result;
            } catch (error) {
                console.error('Error in query:', {
                    text: text.replace(/\s+/g, ' ').trim(),
                    error: error.message
                });

                throw error;
            }
        },

        async close() {
            await pool.end();
        }
    };
} else {
    db = pool;
}

/**
 * Test the database connection.
 */
const testConnection = async () => {
    try {
        const result = await db.query(
            'SELECT NOW() AS current_time'
        );

        console.log(
            'Database connection successful:',
            result.rows[0].current_time
        );

        return true;
    } catch (error) {
        console.error(
            'Database connection failed:',
            error.message
        );

        throw error;
    }
};

export { db as default, testConnection };