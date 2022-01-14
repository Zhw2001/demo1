package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Person;

import java.util.List;

public interface PersonService {
    List<Person> getAll();

     Person getPersonByID(long id);

     void  delete(long id);

     void update(Person p);

     void newp(Person p);

     String getPasswordbyUsername(String username);
}
