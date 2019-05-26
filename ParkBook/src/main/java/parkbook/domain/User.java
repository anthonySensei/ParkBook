package parkbook.domain;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Collection;
import java.util.Set;


@Data
@Entity
@Table(name = "usr")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Username cannot be empty")
    private String username;


    @NotBlank(message = "Password cannot be empty")
    private String password;


    @NotBlank(message = "Name cannot be empty")
    private String name;


    @NotBlank(message = "Surname cannot be empty")
    private String surname;


    @NotBlank(message = "Email cannot be empty")
    @Email(message = "Email is not correct")
    private String email;

    private String activationCode;




    @Lob
    @Column(name="phone_number", length=512)
    @NotBlank(message = "Phone number cannot be empty")
    String phoneNumber;

    private boolean active;



    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    public boolean isAdmin(){
        return roles.contains(Role.ADMIN);
    }
    public boolean isWorker(){
        return roles.contains(Role.WORKER);
    }
    public boolean isUser(){
        return roles.contains(Role.USER);
    }

    public Long getId() {
        return id;
    }


    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
