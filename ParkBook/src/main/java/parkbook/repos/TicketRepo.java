package parkbook.repos;

import org.springframework.data.repository.CrudRepository;
import parkbook.domain.Ticket;

public interface TicketRepo extends CrudRepository<Ticket, Long> {

}
