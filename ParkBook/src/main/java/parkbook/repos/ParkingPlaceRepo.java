package parkbook.repos;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import parkbook.domain.ParkingPlace;

public interface ParkingPlaceRepo extends JpaRepository<ParkingPlace, Long> {
    Page<ParkingPlace> findAll(Pageable pageable);

    Page<ParkingPlace> findByAddress(String address, Pageable pageable);


}
