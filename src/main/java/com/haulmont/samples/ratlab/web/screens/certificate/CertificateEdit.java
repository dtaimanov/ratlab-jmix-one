package com.haulmont.samples.ratlab.web.screens.certificate;

import com.haulmont.cuba.gui.screen.LoadDataBeforeShow;
import com.haulmont.samples.ratlab.entity.stuff.Certificate;
import io.jmix.ui.screen.EditedEntityContainer;
import io.jmix.ui.screen.StandardEditor;
import io.jmix.ui.screen.UiController;
import io.jmix.ui.screen.UiDescriptor;

@UiController("ratlab_Certificate.edit")
@UiDescriptor("certificate-edit.xml")
@EditedEntityContainer("certificateDc")
@LoadDataBeforeShow
public class CertificateEdit extends StandardEditor<Certificate> {
}