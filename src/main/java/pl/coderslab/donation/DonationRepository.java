package pl.coderslab.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonationRepository extends JpaRepository<Donation, Long> {
    Donation findById(long id);
    long countAllByIdGreaterThan(long num);

    @Query(value = "SELECT sum(quantity) FROM Donation")
    long sumQuantity();
}
