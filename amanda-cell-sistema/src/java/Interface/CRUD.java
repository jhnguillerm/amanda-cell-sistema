
package Interface;

import java.util.List;

public interface CRUD <T> {
    
    public List toList();
    public boolean create(T entidad);
    public boolean update(T entidad);
    public boolean delete(T entidad);
    public boolean search(T entidad);
    
}
