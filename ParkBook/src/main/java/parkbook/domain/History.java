package parkbook.domain;


import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "history")
public class History {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String bookTime;

    private String startParkingTime;

    private String finishParkingTime;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "parking_place_id")
    private ParkingPlace parkingPlace;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ticket_id")
    private Ticket ticket;

    public History(){}

    public History(String bookTime, String startParkingTime, String finishParkingTime, User user, ParkingPlace parkingPlace, Ticket ticket) {
        this.bookTime = bookTime;
        this.startParkingTime = startParkingTime;
        this.finishParkingTime = finishParkingTime;
        this.user = user;
        this.parkingPlace = parkingPlace;
        this.ticket = ticket;
    }

    public String getUsername() {
        return user != null ? user.getUsername() : "<none>";
    }
    public String userUsername() { return user != null ? user.getUsername() : "<none>"; }
    public String getParkingAddress() {
        return parkingPlace != null ? parkingPlace.getAddress() : "<none>";
    }
    public String getUserEmail() {
        return user != null ? user.getEmail() : "<none>";
    }
    public Long getTicketNumber() {
        return ticket != null ? ticket.getId() : null;
    }

}
