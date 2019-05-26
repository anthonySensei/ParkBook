package parkbook.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import parkbook.domain.Request;
import parkbook.domain.User;
import parkbook.repos.RequestRepo;
import parkbook.service.MailSender;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class RequestController {

    @Autowired
    private RequestRepo requestRepo;

    @Autowired
    private MailSender mailSender;

    @Value("${upload.path}")
    private String uploadPath;


    @GetMapping("/request")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model,
                       @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Request> page;


            page = requestRepo.findAll(pageable);



        model.addAttribute("page", page);
        model.addAttribute("url", "/request");

        return "request";
    }

    @PostMapping("/request")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Request request,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        request.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("request", request);
        } else {
            saveFile(request, file);

            model.addAttribute("request", null);

            requestRepo.save(request);
        }

        sendMessage(user);

        return "redirect:/request";
    }

    private void sendMessage(User user) {
        if(!StringUtils.isEmpty(user.getEmail())){
            String message = String.format(
                    "Hello, %s! \n" +
                            "Thank for your request. Admin will process it. Wait for further information.",
                    user.getUsername()
            );
            mailSender.send(user.getEmail(), "Request", message);
        }
    }

    private void saveFile(@Valid Request request, @RequestParam("file") MultipartFile file) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            request.setFilename(resultFilename);
        }
    }
}
