package pl.coderslab.donation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.category.CategoryRepository;
import pl.coderslab.institution.InstitutionRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/donate")
public class DonationController {
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;

    public DonationController(CategoryRepository categoryRepository, InstitutionRepository institutionRepository) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
    }

    @RequestMapping
    public String Donate(Model model){
model.addAttribute("categories", categoryRepository.findAll());
model.addAttribute("institutions", institutionRepository.findAll());
model.addAttribute("donation", new Donation());
        return "form";
    }

    @PostMapping
    public String DonatePost(@Valid Donation donation){
        return "form";
    }
}
