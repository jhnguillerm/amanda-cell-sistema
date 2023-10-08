
package Interface;

import java.util.List;

public interface CRUD <T> {
    
    public List toList();
    public T list(int id);
    public boolean add(T entidad);
    public boolean edit(T entidad);
    public boolean delete(int id);
    
}
