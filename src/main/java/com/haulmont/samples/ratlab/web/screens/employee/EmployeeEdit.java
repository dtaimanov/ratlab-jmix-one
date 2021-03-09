package com.haulmont.samples.ratlab.web.screens.employee;

import com.haulmont.cuba.gui.screen.LoadDataBeforeShow;
import com.haulmont.samples.ratlab.entity.stuff.Employee;
import io.jmix.ui.screen.EditedEntityContainer;
import io.jmix.ui.screen.StandardEditor;
import io.jmix.ui.screen.UiController;
import io.jmix.ui.screen.UiDescriptor;

@UiController("ratlab_Employee.edit")
@UiDescriptor("employee-edit.xml")
@EditedEntityContainer("employeeDc")
@LoadDataBeforeShow
public class EmployeeEdit extends StandardEditor<Employee> {
}