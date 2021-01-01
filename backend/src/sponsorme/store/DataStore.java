package sponsorme.store;

/**
 * Abstraction for retrieval and storing of data from a database.
 * @param <T> data type
 *
 * @author Kenneth Tan
 */
public abstract class DataStore<T>
{
	public abstract T get(int key);
	
	public abstract void store(T value);
}
