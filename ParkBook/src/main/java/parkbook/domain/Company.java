package parkbook.domain;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Company {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    private String company_name;
    private String address;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public Company() {
    }

    public Company(String company_name, String address, User user) {
        this.author = user;
        this.company_name = company_name;
        this.address = address;
    }


    public String getCompany_name() {
        return company_name;
    }



    public String getAddress() {
        return address;
    }


}
