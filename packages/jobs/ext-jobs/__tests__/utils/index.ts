import { getConnections } from 'pgsql-test';

type DB = {
  any: (sql: string, params?: any[]) => Promise<any[]>;
  one: (sql: string, params?: any[]) => Promise<any>;
};

function quoteIdent(id: string) {
  return `"${id.replace(/"/g, '""')}"`;
}

export function wrapConn(db: DB, schema: string) {
  return {
    insertOne: async (table: string, row: Record<string, any>, casts: Record<string, string> = {}) => {
      const keys = Object.keys(row);
      const cols = keys.map(k => quoteIdent(k)).join(', ');
      const values: any[] = [];
      const placeholders = keys.map((k, i) => {
        values.push(row[k]);
        const cast = casts[k];
        return `$${i + 1}${cast ? `::${cast}` : ''}`;
      }).join(', ');
      const sql = `INSERT INTO ${quoteIdent(schema)}.${quoteIdent(table)} (${cols}) VALUES (${placeholders}) RETURNING *`;
      const res = await db.any(sql, values);
      return res[0];
    },
    callAny: async (fn: string, args: Record<string, any> = {}, casts: Record<string, string> = {}) => {
      const keys = Object.keys(args);
      const values: any[] = [];
      const placeholders = keys.map((k, i) => {
        values.push(args[k]);
        const cast = casts[k];
        return `$${i + 1}${cast ? `::${cast}` : ''}`;
      }).join(', ');
      const sql = `SELECT * FROM ${quoteIdent(schema)}.${quoteIdent(fn)}(${placeholders})`;
      return db.any(sql, values);
    }
  };
}

export { getConnections };
