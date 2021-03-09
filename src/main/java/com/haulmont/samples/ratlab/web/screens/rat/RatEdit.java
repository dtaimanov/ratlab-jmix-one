package com.haulmont.samples.ratlab.web.screens.rat;

import com.haulmont.cuba.gui.screen.LoadDataBeforeShow;
import com.haulmont.samples.ratlab.entity.resources.Rat;
import io.jmix.ui.screen.EditedEntityContainer;
import io.jmix.ui.screen.StandardEditor;
import io.jmix.ui.screen.UiController;
import io.jmix.ui.screen.UiDescriptor;

@UiController("ratlab_Rat.edit")
@UiDescriptor("rat-edit.xml")
@EditedEntityContainer("ratDc")
@LoadDataBeforeShow
public class RatEdit extends StandardEditor<Rat> {
}