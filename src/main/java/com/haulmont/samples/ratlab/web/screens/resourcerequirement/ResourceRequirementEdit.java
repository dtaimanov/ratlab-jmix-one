package com.haulmont.samples.ratlab.web.screens.resourcerequirement;

import com.haulmont.cuba.gui.screen.LoadDataBeforeShow;
import com.haulmont.samples.ratlab.entity.research.ResourceRequirement;
import io.jmix.ui.screen.EditedEntityContainer;
import io.jmix.ui.screen.StandardEditor;
import io.jmix.ui.screen.UiController;
import io.jmix.ui.screen.UiDescriptor;

@UiController("ratlab_ResourceRequirement.edit")
@UiDescriptor("resource-requirement-edit.xml")
@EditedEntityContainer("resourceRequirementDc")
@LoadDataBeforeShow
public class ResourceRequirementEdit extends StandardEditor<ResourceRequirement> {
}