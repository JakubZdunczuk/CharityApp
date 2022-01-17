package pl.coderslab.donation;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.category.Category;
import pl.coderslab.institution.Institution;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Set;


@Getter
@Setter
@Entity
@Table(name = "donations")
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @NotNull(message="{notNull.message}")
    @Min(1)
    private int quantity;
    @OneToMany
    @NotNull(message="{notNull.message}")
    private List<Category> categories;
    @NotNull(message="{notNull.message}")
    @ManyToOne
    private Institution institution;
    @NotNull(message="{notNull.message}")
    private String street;
    @NotNull(message="{notNull.message}")
    private String city;
    @NotNull(message="{notNull.message}")
    private String zipcode;
    @NotNull(message="{notNull.message}")
    @Future
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate pickUpDate;
    @NotNull(message="{notNull.message}")
    private LocalTime pickUpTime;
    private String pickUpComment;

}
