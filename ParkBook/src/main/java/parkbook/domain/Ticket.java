package parkbook.domain;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    private String startTime;

    private String finishTime;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "parking_place_id")
    private ParkingPlace parkingPlace;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    public Ticket(String startTime, String finishTime, ParkingPlace parkingPlace, User user) {
        this.startTime = startTime;
        this.finishTime = finishTime;
        this.parkingPlace = parkingPlace;
        this.user = user;
    }
}


