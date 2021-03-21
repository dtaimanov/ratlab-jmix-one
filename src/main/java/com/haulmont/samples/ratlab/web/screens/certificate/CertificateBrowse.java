package com.haulmont.samples.ratlab.web.screens.certificate;

import com.haulmont.cuba.gui.screen.LoadDataBeforeShow;
import com.haulmont.samples.ratlab.entity.stuff.Certificate;
import com.haulmont.samples.ratlab.service.ResearchService;
import io.jmix.email.EmailException;
import io.jmix.ui.Dialogs;
import io.jmix.ui.action.Action;
import io.jmix.ui.screen.*;

import javax.inject.Inject;

@UiController("ratlab_Certificate.browse")
@UiDescriptor("certificate-browse.xml")
@LookupComponent("certificatesTable")
@LoadDataBeforeShow
public class CertificateBrowse extends StandardLookup<Certificate> {
    @Inject
    private ResearchService researchService;

    @Inject
    protected Dialogs dialogs;

    public void sendEmail() {
    }

    @Subscribe("certificatesTable.sendEmail")
    public void onCertificatesTableSendEmail(Action.ActionPerformedEvent event) {
        try {
            researchService.sendEmail();
        } catch (EmailException e) {
            dialogs.createExceptionDialog().withThrowable(e).show();
        }
    }
}