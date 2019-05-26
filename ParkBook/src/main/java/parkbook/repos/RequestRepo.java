package parkbook.repos;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import parkbook.domain.Request;
import parkbook.domain.User;


public interface RequestRepo extends CrudRepository<Request, Long> {

      Page<Request> findAll(Pageable pageable);

      Page<Request> findByAuthor(User user, Pageable pageable);
}
