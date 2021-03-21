package com.haulmont.samples.ratlab.service;


import com.haulmont.samples.ratlab.entity.research.Research;
import io.jmix.email.EmailException;

public interface ResearchService {
    String NAME = "ratlab_ResearchService";

    void gatherResources(Research research);

    void perform(Research research);

    void sendEmail() throws EmailException;
}