// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.application.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springsource.petclinic.application.web.VetJsonMixin;
import com.springsource.petclinic.model.Visit;
import java.util.Set;

privileged aspect VetJsonMixin_Roo_JSONMixin {
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @JsonIgnore
    private Set<Visit> VetJsonMixin.visits;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Set
     */
    public Set<Visit> VetJsonMixin.getVisits() {
        return visits;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visits
     */
    public void VetJsonMixin.setVisits(Set<Visit> visits) {
        this.visits = visits;
    }
    
}
