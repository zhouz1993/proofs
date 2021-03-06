// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.application.web.utils;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import com.springsource.petclinic.application.web.utils.VetDeserializer;
import com.springsource.petclinic.model.Vet;
import com.springsource.petclinic.service.api.VetService;
import io.springlets.web.NotFoundException;
import java.io.IOException;
import org.springframework.boot.jackson.JsonComponent;
import org.springframework.core.convert.ConversionService;

privileged aspect VetDeserializer_Roo_EntityDeserializer {
    
    declare @type: VetDeserializer: @JsonComponent;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return VetService
     */
    public VetService VetDeserializer.getVetService() {
        return vetService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vetService
     */
    public void VetDeserializer.setVetService(VetService vetService) {
        this.vetService = vetService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ConversionService
     */
    public ConversionService VetDeserializer.getConversionService() {
        return conversionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param conversionService
     */
    public void VetDeserializer.setConversionService(ConversionService conversionService) {
        this.conversionService = conversionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param jsonParser
     * @param context
     * @param codec
     * @param tree
     * @return Vet
     * @throws IOException
     */
    public Vet VetDeserializer.deserializeObject(JsonParser jsonParser, DeserializationContext context, ObjectCodec codec, JsonNode tree) throws IOException {
        String idText = tree.asText();
        Long id = conversionService.convert(idText, Long.class);
        Vet vet = vetService.findOne(id);
        if (vet == null) {
            throw new NotFoundException("Vet not found");
        }
        return vet;
    }
    
}
