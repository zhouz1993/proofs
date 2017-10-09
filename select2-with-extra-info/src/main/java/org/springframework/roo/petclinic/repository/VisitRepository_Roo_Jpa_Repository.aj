// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.repository;

import io.springlets.data.jpa.repository.DetachableJpaRepository;
import org.springframework.roo.petclinic.domain.Pet;
import org.springframework.roo.petclinic.domain.Vet;
import org.springframework.roo.petclinic.domain.Visit;
import org.springframework.roo.petclinic.repository.VisitRepository;
import org.springframework.roo.petclinic.repository.VisitRepositoryCustom;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VisitRepository_Roo_Jpa_Repository {
    
    declare parents: VisitRepository extends DetachableJpaRepository<Visit, Long>;
    
    declare parents: VisitRepository extends VisitRepositoryCustom;
    
    declare @type: VisitRepository: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @return Long
     */
    public abstract long VisitRepository.countByVet(Vet vet);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @return Long
     */
    public abstract long VisitRepository.countByPet(Pet pet);
    
}