package org.springframework.roo.petclinic.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ObjectOptimisticLockingFailureException;
import org.springframework.ui.Model;

/**
 * = ConcurrencyTemplate
 * <p>
 * Template class that simplifies programmatic concurrency demarcation and
 * concurrency exception handling.
 *
 * @param <T> Generic type that indicates the type of element that should be returned after
 *            {@link #executeWithOcc(ConcurrencyCallback)} is called.
 */
public class ConcurrencyTemplate<T> {

    // Logger to log possible concurrency exceptions
    private static final Log LOGGER = LogFactory.getLog(ConcurrencyTemplate.class);

    /**
     * The element that will manage the concurrency behaviour if some
     * concurrency exception appears.
     */
    private ConcurrencyManager manager;

    /**
     * The record that could produce the concurrency exception. Usually, this
     * record is the entity that is beeing persisted.
     */
    private Object record;

    /**
     * The Model of the View layer that contains all the necessary attributes to construct
     * a valid form.
     */
    private Model model;

    /**
     * Default constructor that receives all the necessary parameters.
     *
     * @param manager The element that will manage the concurrency behaviour if some concurrency
     *                exception appears.
     * @param record  The record that could produce the concurrency exception. Usually, this
     *                record is the entity that is beeing persisted.
     * @param model   The Model of the View layer that contains all the necessary attributes to construct a valid form.
     */
    public ConcurrencyTemplate(ConcurrencyManager manager, Object record, Model model) {
        this.manager = manager;
        this.record = record;
        this.model = model;
    }

    /**
     * Executes the provided action. If something goes wrong and a {@link ConcurrencyException} appears during
     * the process, it delegates in the provided {@link ConcurrencyManager} to manage the concurrency behaviour.
     *
     * @param action The action that should be executed and that could produce a Concurrency Exception.
     * @return An object with the same type as the specified in the ConcurrencyTemplate constructor
     */
    public T executeWithOcc(ConcurrencyCallback<T> action) {
        try {
            // Execute the provided action and return the result
            return action.executeWithOcc();
        } catch (ObjectOptimisticLockingFailureException ex) {
            // If some Concurrency Exception appears, log the error as debug level
            // and throws a custom exception that contains all the information about
            // the view layer.
            LOGGER.debug(ex.getLocalizedMessage());
            throw new ConcurrencyException(this.manager, this.record, this.model, ex);
        }
    }
}
