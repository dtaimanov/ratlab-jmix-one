package com.haulmont.samples.ratlab.web.screens.rat;

import com.haulmont.cuba.gui.screen.LoadDataBeforeShow;
import com.haulmont.samples.ratlab.entity.resources.Rat;
import io.jmix.ui.screen.LookupComponent;
import io.jmix.ui.screen.StandardLookup;
import io.jmix.ui.screen.UiController;
import io.jmix.ui.screen.UiDescriptor;

@UiController("ratlab_Rat.browse")
@UiDescriptor("rat-browse.xml")
@LookupComponent("ratsTable")
@LoadDataBeforeShow
public class RatBrowse extends StandardLookup<Rat> {
}