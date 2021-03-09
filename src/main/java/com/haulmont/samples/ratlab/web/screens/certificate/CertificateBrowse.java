package com.haulmont.samples.ratlab.web.screens.certificate;

import com.haulmont.cuba.gui.screen.LoadDataBeforeShow;
import com.haulmont.samples.ratlab.entity.stuff.Certificate;
import io.jmix.ui.screen.LookupComponent;
import io.jmix.ui.screen.StandardLookup;
import io.jmix.ui.screen.UiController;
import io.jmix.ui.screen.UiDescriptor;

@UiController("ratlab_Certificate.browse")
@UiDescriptor("certificate-browse.xml")
@LookupComponent("certificatesTable")
@LoadDataBeforeShow
public class CertificateBrowse extends StandardLookup<Certificate> {
}