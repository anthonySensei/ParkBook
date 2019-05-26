package parkbook.repos;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import parkbook.domain.History;


@Repository
public interface HistoryRepo extends JpaRepository<History, Long> {


    Page<History> findAll(Pageable pageable);

    Page findByUserUsername(String username, Pageable pageable);

}
