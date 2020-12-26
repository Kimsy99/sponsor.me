package sponsorme.store;

import java.sql.SQLException;

/**
 * Abstraction for retrieval and storing of data from a database.
 * @param <T> data type
 *
 * @author Kenneth Tan
 */
public abstract class DataStore<T>
{
	public abstract T get(String key) throws SQLException;
	
	public abstract void store(T value);
}
