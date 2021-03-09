package com.haulmont.samples.ratlab.web.screens.laboratory;

import com.haulmont.cuba.gui.components.ButtonsPanel;
import com.haulmont.cuba.gui.screen.LoadDataBeforeShow;
import com.haulmont.samples.ratlab.entity.Laboratory;
import com.haulmont.samples.ratlab.entity.stuff.Employee;
import io.jmix.ui.action.list.AddAction;
import io.jmix.ui.action.list.RemoveAction;
import io.jmix.ui.screen.LookupComponent;
import io.jmix.ui.screen.MasterDetailScreen;
import io.jmix.ui.screen.UiController;
import io.jmix.ui.screen.UiDescriptor;

import javax.inject.Inject;
import javax.inject.Named;

@UiController("ratlab_Laboratory.browse")
@UiDescriptor("laboratory-browse.xml")
@LookupComponent("table")
@LoadDataBeforeShow
public class LaboratoryBrowse extends MasterDetailScreen<Laboratory> {
    @Named("employeesTable.add")
    private AddAction<Employee> employeesTableAdd;
    @Named("employeesTable.remove")
    private RemoveAction<Employee> employeesTableRemove;
    @Inject
    private ButtonsPanel employeesTableBP;

    @Override
    protected void initEditComponents(boolean enabled) {
        super.initEditComponents(enabled);
        employeesTableAdd.setEnabled(enabled);
        employeesTableRemove.setEnabled(enabled);
        employeesTableBP.setVisible(enabled);
    }
}