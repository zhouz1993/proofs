package org.springframework.roo.petclinic.web.validators;

import org.springframework.roo.petclinic.domain.MessageI18n;
import org.springframework.roo.petclinic.service.api.ValidatorService;
import org.springframework.util.Assert;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.List;
import java.util.Map;

/**
 * = GenericValidator
 * <p>
 * Implementation of the {@link Validator} interface to be able to validate
 * all the entities during the Binding process.
 */
public class GenericValidator<T> implements Validator {

    /**
     * The class that supports the validation
     */
    private Class<?> clazz;

    /**
     * The service used to validate
     */
    private ValidatorService validatorService;

    /**
     * Default constructor that receives the service to be able
     * to execute necessary operations during validation process.
     *
     * @param validatorService
     */
    public GenericValidator(Class<?> clazz, T validatorService) {
        Assert.notNull(clazz, "ERROR: You must provide a valid Class type");
        Assert.notNull(validatorService, "ERROR: You must provide a valid Validator service.");
        this.clazz = clazz;
        this.validatorService = (ValidatorService) validatorService;
    }

    /**
     * This Validator validates the type of class defined in
     * the constructor.
     */
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(this.clazz);
    }

    /**
     * The validation process of this element
     *
     * @param obj
     * @param errors
     */
    @Override
    public void validate(Object obj, Errors errors) {
        Map<String, List<MessageI18n>> messages = validatorService.validate(obj);
        messages.forEach((k,v)-> {
            v.forEach((e) -> {
                errors.rejectValue(k, e.label, e.values, "");
            });
        });
    }
}
