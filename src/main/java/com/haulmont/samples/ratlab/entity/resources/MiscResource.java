package com.haulmont.samples.ratlab.entity.resources;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.StandardEntity;
import io.jmix.core.metamodel.annotation.JmixEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@JmixEntity
@Table(name = "RATLAB_MISC_RESOURCE")
@Entity(name = "ratlab_MiscResource")
@NamePattern("%s|name")
public class MiscResource extends StandardEntity {
    private static final long serialVersionUID = -1707059619304141296L;

    @Column(name = "NAME")
    private String name;

    @NotNull
    @Column(name = "TYPE_", nullable = false)
    private String type;

    @Column(name = "AMOUNT")
    private BigDecimal amount;

    @NotNull
    @Column(name = "CONSUMABLE", nullable = false, columnDefinition = "boolean default true")
    private Boolean consumable = false;

    public Boolean getConsumable() {
        return consumable;
    }

    public void setConsumable(Boolean consumable) {
        this.consumable = consumable;
    }

    public ResourceType getType() {
        return type == null ? null : ResourceType.fromId(type);
    }

    public void setType(ResourceType type) {
        this.type = type == null ? null : type.getId();
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}