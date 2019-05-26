package parkbook.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.boot.autoconfigure.security.oauth2.resource.PrincipalExtractor;
import org.springframework.boot.autoconfigure.security.oauth2.resource.ResourceServerProperties;
import org.springframework.boot.autoconfigure.security.oauth2.resource.UserInfoTokenServices;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.filter.OAuth2ClientAuthenticationProcessingFilter;
import org.springframework.security.oauth2.client.filter.OAuth2ClientContextFilter;
import org.springframework.security.oauth2.client.token.grant.code.AuthorizationCodeResourceDetails;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import parkbook.domain.Role;
import parkbook.domain.User;
import parkbook.repos.UserRepo;
import parkbook.service.UserService;

import java.rmi.server.UID;
import java.util.Collections;
import java.util.UUID;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableOAuth2Client
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserService userService;

    @Autowired
    UserRepo userRepo;

    @Autowired
    OAuth2ClientContext oAuth2ClientContext;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Bean
   public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder(8);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                    .antMatchers("/", "/registration", "/static/**", "/activate/*", "/loginGoogle/*").permitAll()
                    .anyRequest().authenticated()
                .and()
                    .formLogin()
                    .loginPage("/login")
                    .defaultSuccessUrl("/main")
                    .permitAll()
                .and()
                    .logout()
                    .permitAll()
                .and().addFilterAfter(ssoFilter(), BasicAuthenticationFilter.class);
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService)
                .passwordEncoder(passwordEncoder);
    }

    @Bean
    OAuth2ClientAuthenticationProcessingFilter ssoFilter() {
        OAuth2ClientAuthenticationProcessingFilter clientAuthenticationProcessingFilter = new OAuth2ClientAuthenticationProcessingFilter("/loginGoogle");
        OAuth2RestTemplate restTemplate = new OAuth2RestTemplate(authorizationCodeResourceDetails(), oAuth2ClientContext);
        clientAuthenticationProcessingFilter.setRestTemplate(restTemplate);
        clientAuthenticationProcessingFilter.setAuthenticationSuccessHandler(new SimpleUrlAuthenticationSuccessHandler("/main"));
        UserInfoTokenServices userInfoTokenServices = new UserInfoTokenServices(resourceServerProperties().getUserInfoUri(), authorizationCodeResourceDetails().getClientId());
        userInfoTokenServices.setRestTemplate(restTemplate);
        userInfoTokenServices.setPrincipalExtractor(principalExtractor(userRepo));
        clientAuthenticationProcessingFilter.setTokenServices(userInfoTokenServices);
        return clientAuthenticationProcessingFilter;
    }

    @ConfigurationProperties(value = "security.oauth2.client")
    @Bean
    public AuthorizationCodeResourceDetails authorizationCodeResourceDetails() {
        return new AuthorizationCodeResourceDetails();
    }

    @ConfigurationProperties(value = "security.oauth2.resource")
    @Bean
    public ResourceServerProperties resourceServerProperties() {
        return new ResourceServerProperties();
    }

    @Bean
    FilterRegistrationBean<OAuth2ClientContextFilter> registrationBean(OAuth2ClientContextFilter filter) {
        FilterRegistrationBean<OAuth2ClientContextFilter> oAuth2ClientContextFilterFilterRegistrationBean = new FilterRegistrationBean<>();
        oAuth2ClientContextFilterFilterRegistrationBean.setFilter(filter);
        oAuth2ClientContextFilterFilterRegistrationBean.setOrder(-100);
        return oAuth2ClientContextFilterFilterRegistrationBean;
    }



    @Bean
    public PrincipalExtractor principalExtractor(UserRepo userRepo){
        return map -> {
            PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

            String username = (String) map.get("email");
           User user =  userRepo.findByUsername(username);

           if(user == null){
               User newUser = new User();

               newUser.setName((String)map.get("given_name"));
               newUser.setSurname((String)map.get("family_name"));
               newUser.setUsername(username);
               newUser.setEmail(username);
               newUser.setPassword(passwordEncoder.encode(username));
               newUser.setPhoneNumber("Your phone number");
               newUser.setRoles(Collections.singleton(Role.USER));
               userRepo.save(newUser);
               return newUser;
           }else {
               return user;
           }
        };

    }

}
