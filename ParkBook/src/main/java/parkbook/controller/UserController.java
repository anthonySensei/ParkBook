package parkbook.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import parkbook.domain.Role;
import parkbook.domain.User;
import parkbook.repos.UserRepo;
import parkbook.service.MailSender;
import parkbook.service.UserService;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")

public class UserController {
@Autowired
    UserRepo userRepo;

    @Autowired
    private MailSender mailSender;
    @Autowired
    private UserService userService;



public boolean compareMatch(String query, String template) {
   // return template.toLowerCase().matches(".*" + query.toLowerCase() + ".*");
    return template.toLowerCase().matches("" + query.toLowerCase() + "");
}

@PreAuthorize("hasAuthority('ADMIN')")
@GetMapping
    public String userList(@RequestParam(required = false, defaultValue = "") String filter, Model model,
                           @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable){

    Page<User> page = userRepo.findAll(pageable);

    model.addAttribute("page", page);
    model.addAttribute("url", "/user");
    return "userList";
}

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("userFilter")
    public String userListFilter(@RequestParam(required = false, defaultValue = "") String filter, Model model){

        Iterable<User> users = userRepo.findAll();
         users = ((List<User>) users).stream().filter(x -> compareMatch(x.getUsername(), filter)).collect(Collectors.toList());;

        model.addAttribute("users", users);
        model.addAttribute("filter", filter);
        return "userFilter";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
@GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {

        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    private void sendMessage(User user, String role) {
        if(!StringUtils.isEmpty(user.getEmail())){
            String message = String.format(
                    "Hello, %s! \n" +
                            "Congratulation! Now you are the %s of our site",
                    user.getUsername(),
                    role
            );
            mailSender.send(user.getEmail(), "New role", message);
        }
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();


        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);

        if (user.isUser()&&user.isAdmin()){
            sendMessage(user, "Admin");
        }
        if (user.isUser()&&user.isWorker()){
            sendMessage(user, "Worker");
        }

        return "redirect:/user";
    }
    @GetMapping("profile")
    public String getProfile(@AuthenticationPrincipal User user, Model model){
    model.addAttribute("user", user);
        return "profile";
    }

    @PostMapping ("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam String email,
            @RequestParam String name,
            @RequestParam String surname,
            @RequestParam String phoneNumber,
            @RequestParam String username,
            Model model)

            {
                model.addAttribute("user", user);
                if(!user.getUsername().equals(username)) {
                    if (!userService.userExists(username)) {
                        model.addAttribute("usernameError", "User exists!");  //якщо не могли добавити користувачв, то він існує
                        return "profile";
                    }

                }
        userService.updateProfile(user,username, email, name, surname, phoneNumber);
                model.addAttribute("somemessage", "Saved");


        return "profile";
    }

    @GetMapping("cngPassword")
    public String getCngPassword(@AuthenticationPrincipal User user, Model model){
        return "cngPassword";
    }

    @PostMapping ("cngPassword")
    public String ChangeUserPassword(
            @AuthenticationPrincipal User user,
            @RequestParam String password,
            @RequestParam("password2") String passwordConfirm,
            Model model)

    {

        if (!password.equals(passwordConfirm)) {
            model.addAttribute("passwordError", "Passwords are different!");
            System.out.println("Error");
            return "cngPassword";
        }else{
            userService.changeUserPassword(user, password);
        }

        return "redirect:/user/profile";
    }



}
