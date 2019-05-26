package parkbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import parkbook.domain.Company;
import parkbook.domain.History;
import parkbook.domain.ParkingPlace;
import parkbook.domain.User;
import parkbook.repos.CompanyRepo;
import parkbook.repos.HistoryRepo;
import parkbook.repos.ParkingPlaceRepo;

import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private CompanyRepo companyRepo;
    @Autowired
    private ParkingPlaceRepo parkingPlaceRepo;
    @Autowired
    private HistoryRepo historyRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(
                       @RequestParam(required = false, defaultValue = "") String filter,
                                                                          Model model,
                       @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<ParkingPlace> page;


        if (filter != null && !filter.isEmpty()) {
            page = parkingPlaceRepo.findByAddress(filter,pageable );
        } else {
            page = parkingPlaceRepo.findAll(pageable);
        }

        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("filter", filter);

        return "main";
    }
    @GetMapping("/history")
    public String history(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model,
            @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable) {

        Page<History> page;


        if (filter != null && !filter.isEmpty()) {
             page = historyRepo.findByUserUsername(filter, pageable);
        } else {
            page = historyRepo.findAll(pageable);
        }

        model.addAttribute("page", page);
        model.addAttribute("url", "/history");
        model.addAttribute("filter", filter);

        return "history";
    }

    @GetMapping("/userhistory")
    public String userhistory(
            @AuthenticationPrincipal User user,
            Model model,
            @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable) {

        Page<History> page;



            page = historyRepo.findByUserUsername(user.getUsername(), pageable);

        model.addAttribute("page", page);
        model.addAttribute("url", "/history");

        return "userhistory";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String freePlaces,
            @RequestParam String pAddress,
            @RequestParam String address, Model model,
            @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable
    ) {

        Company company = new Company(text, address, user);

            companyRepo.save(company);
        ParkingPlace parkingPlace = new ParkingPlace(pAddress, company, Long.parseLong(freePlaces));

        parkingPlaceRepo.save(parkingPlace);

        Page<ParkingPlace> page = parkingPlaceRepo.findAll(pageable);

        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        return "main";
    }





}
