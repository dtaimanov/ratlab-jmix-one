package com.haulmont.samples.ratlab.web.screens.employee;

import com.haulmont.cuba.gui.screen.LoadDataBeforeShow;
import com.haulmont.samples.ratlab.entity.stuff.Employee;
import io.jmix.ui.screen.LookupComponent;
import io.jmix.ui.screen.StandardLookup;
import io.jmix.ui.screen.UiController;
import io.jmix.ui.screen.UiDescriptor;

@UiController("ratlab_Employee.browse")
@UiDescriptor("employee-browse.xml")
@LookupComponent("employeesTable")
@LoadDataBeforeShow
public class EmployeeBrowse extends StandardLookup<Employee> {
}