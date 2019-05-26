package parkbook.repos;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import parkbook.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);

    Page findAll(Pageable pageable);

    User findByActivationCode(String code);


    @Query
            (value = "select * from usr where id = :id",nativeQuery = true)
    User findByIdString(String id);
}
