package pl.coderslab.institution;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InstitutionRepository extends JpaRepository<Institution, Long> {
    Institution findById(long id);
    List<Institution> findAll();
}
