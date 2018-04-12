// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.repository;

import com.querydsl.core.types.Path;
import com.querydsl.jpa.JPQLQuery;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt.AttributeMappingBuilder;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.petclinic.domain.Owner;
import org.springframework.roo.petclinic.domain.Pet;
import org.springframework.roo.petclinic.domain.QPet;
import org.springframework.roo.petclinic.repository.PetRepositoryImpl;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

privileged aspect PetRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare @type: PetRepositoryImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String PetRepositoryImpl.SEND_REMINDERS = "sendReminders";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String PetRepositoryImpl.NAME = "name";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String PetRepositoryImpl.WEIGHT = "weight";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String PetRepositoryImpl.TYPE = "type";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String PetRepositoryImpl.OWNER = "owner";
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Pet> PetRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        
        QPet pet = QPet.pet;
        
        JPQLQuery<Pet> query = from(pet);
        
        Path<?>[] paths = new Path<?>[] {pet.sendReminders,pet.name,pet.weight,pet.type,pet.owner};        
        applyGlobalSearch(globalSearch, query, paths);
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(SEND_REMINDERS, pet.sendReminders)
			.map(NAME, pet.name)
			.map(WEIGHT, pet.weight)
			.map(TYPE, pet.type)
			.map(OWNER, pet.owner);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, pet);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Pet> PetRepositoryImpl.findAllByIdsIn(List<Long> ids, GlobalSearch globalSearch, Pageable pageable) {
        
        QPet pet = QPet.pet;
        
        JPQLQuery<Pet> query = from(pet);
        
        Path<?>[] paths = new Path<?>[] {pet.sendReminders,pet.name,pet.weight,pet.type,pet.owner};        
        applyGlobalSearch(globalSearch, query, paths);
        
        // Also, filter by the provided ids
        query.where(pet.id.in(ids));
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(SEND_REMINDERS, pet.sendReminders)
			.map(NAME, pet.name)
			.map(WEIGHT, pet.weight)
			.map(TYPE, pet.type)
			.map(OWNER, pet.owner);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, pet);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Pet> PetRepositoryImpl.findByOwner(Owner owner, GlobalSearch globalSearch, Pageable pageable) {
        
        QPet pet = QPet.pet;
        
        JPQLQuery<Pet> query = from(pet);
        
        Assert.notNull(owner, "owner is required");
        
        query.where(pet.owner.eq(owner));
        Path<?>[] paths = new Path<?>[] {pet.sendReminders,pet.name,pet.weight,pet.type,pet.owner};        
        applyGlobalSearch(globalSearch, query, paths);
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(SEND_REMINDERS, pet.sendReminders)
			.map(NAME, pet.name)
			.map(WEIGHT, pet.weight)
			.map(TYPE, pet.type)
			.map(OWNER, pet.owner);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, pet);
    }
    
}
