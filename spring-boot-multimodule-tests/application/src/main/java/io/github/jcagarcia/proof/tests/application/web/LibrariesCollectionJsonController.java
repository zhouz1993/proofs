package io.github.jcagarcia.proof.tests.application.web;
import io.github.jcagarcia.proof.tests.model.domain.Library;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

/**
 * = LibrariesCollectionJsonController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Library.class, pathPrefix = "/api", type = ControllerType.COLLECTION)
@RooJSON
public class LibrariesCollectionJsonController {
}
