package parkbook.repos;


import org.springframework.data.repository.CrudRepository;
import parkbook.domain.Company;

import java.util.List;

public interface CompanyRepo extends CrudRepository<Company, Long> {

    List<Company> findByAddress(String address);

}
