package parkbook.domain;


import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
@Data
public class Request {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    private Date time;

    @NotBlank(message = "Please fill the message")
    @Length(max = 2048, message = "Request too long (more then 2048 chars)")
    private String text;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    private String filename;



    public Request(String text,  User user) {
        this.author = user;
        this.text = text;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }
    public String getAuthorEmail() {
        return author != null ? author.getEmail() : "<none>";
    }

}
