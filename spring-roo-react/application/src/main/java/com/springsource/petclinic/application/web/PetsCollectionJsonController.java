package com.springsource.petclinic.application.web;
import com.springsource.petclinic.model.Pet;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

/**
 * = PetsCollectionJsonController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Pet.class, pathPrefix = "/api", type = ControllerType.COLLECTION)
@RooJSON
public class PetsCollectionJsonController {
}
