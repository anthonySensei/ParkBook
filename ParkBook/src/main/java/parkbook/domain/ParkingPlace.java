package parkbook.domain;


import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class ParkingPlace {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String address;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "company_id")
    private Company company;

    private Long freePlaces;

    public ParkingPlace(){}

    public ParkingPlace(String address, Company company, Long freePlaces) {
        this.address = address;
        this.company = company;
        this.freePlaces = freePlaces;
    }

    public String getCompanyName() {
        return company != null ? company.getCompany_name() : "<none>";
    }
    public String getCompanyAddress() {
        return company != null ? company.getAddress() : "<none>";
    }
    public Long getCompanyId() {
        return company != null ? company.getId() : null;
    }


}
