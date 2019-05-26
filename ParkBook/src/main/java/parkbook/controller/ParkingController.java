package parkbook.controller;


import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import parkbook.domain.History;
import parkbook.domain.ParkingPlace;
import parkbook.domain.Ticket;
import parkbook.domain.User;
import parkbook.repos.CompanyRepo;
import parkbook.repos.HistoryRepo;
import parkbook.repos.ParkingPlaceRepo;
import parkbook.repos.TicketRepo;
import parkbook.service.MailSender;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/parking")
public class ParkingController {

    @Autowired
    private CompanyRepo companyRepo;
    @Autowired
    private ParkingPlaceRepo parkingPlaceRepo;
    @Autowired
    private TicketRepo ticketRepo;
    @Autowired
    private HistoryRepo historyRepo;

    @Autowired
    private MailSender mailSender;

    @GetMapping("{parkingPlace}")
    public String parkingChooseForm(@PathVariable ParkingPlace parkingPlace, Model model){


        model.addAttribute("parkingPlace", parkingPlace);

        return "parkinggChoose";
    }

    @GetMapping
    public String addTicket(
            @AuthenticationPrincipal User user,
            @RequestParam("parkingPlaceId") ParkingPlace parkingPlace,
            @RequestParam String start_time,
            @RequestParam String end_time,
            Model model
    )
    {

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        Ticket ticket = new Ticket(start_time, end_time, parkingPlace, user);
        History history = new History(dateFormat.format(date),ticket.getStartTime(), ticket.getFinishTime(), user, parkingPlace, ticket);
        model.addAttribute("parkingPlace", parkingPlace);
        parkingPlace.setFreePlaces(parkingPlace.getFreePlaces()-1);
        parkingPlaceRepo.save(parkingPlace);
        ticketRepo.save(ticket);
        historyRepo.save(history);
        sendMessage(user, parkingPlace, ticket);
        return "redirect:/main";
    }



    private void sendMessage(User user, ParkingPlace parkingPlace, Ticket ticket) {
        if(!StringUtils.isEmpty(user.getEmail())){
            String message = String.format(
                    "Hello, %s! \n" +
                            "Congratulation! You successfully booked ticket in our site. Your ticket numbers is %s." +
                            "Parking address: %s(Company:%s)",
                    user.getUsername(),
                    ticket.getId(),
                    parkingPlace.getAddress(),
                    parkingPlace.getCompanyName()
            );
            mailSender.send(user.getEmail(), "Ticket", message);
        }
    }
}
