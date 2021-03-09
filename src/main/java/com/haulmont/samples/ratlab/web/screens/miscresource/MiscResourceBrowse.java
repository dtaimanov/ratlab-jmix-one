package com.haulmont.samples.ratlab.web.screens.miscresource;

import com.haulmont.cuba.gui.screen.LoadDataBeforeShow;
import com.haulmont.samples.ratlab.entity.resources.MiscResource;
import io.jmix.ui.screen.LookupComponent;
import io.jmix.ui.screen.MasterDetailScreen;
import io.jmix.ui.screen.UiController;
import io.jmix.ui.screen.UiDescriptor;

@UiController("ratlab_MiscResource.browse")
@UiDescriptor("misc-resource-browse.xml")
@LookupComponent("table")
@LoadDataBeforeShow
public class MiscResourceBrowse extends MasterDetailScreen<MiscResource> {
}