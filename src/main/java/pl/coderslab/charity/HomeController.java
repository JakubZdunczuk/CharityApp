package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.donation.DonationRepository;
import pl.coderslab.institution.InstitutionRepository;


@Controller
public class HomeController {
 private final InstitutionRepository institutionRepository;
 private final DonationRepository donationRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @RequestMapping("/")
    public String homeAction(Model model) {
        model.addAttribute("institution", institutionRepository.findAll());
        model.addAttribute("bags", donationRepository.sumQuantity());
        model.addAttribute("don", donationRepository.countAllByIdGreaterThan(0));
        return "index";
    }

}