package com.ljsh.test.service.impl;
import com.ljsh.test.mbg.mapper.PersonMapper;
import com.ljsh.test.mbg.model.Person;
import com.ljsh.test.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {
    @Autowired
    private PersonMapper personMapper;

    /*
        Service层介于controller和dao之间作为服务层进行一些逻辑处理，
        这里逻辑太简单所以知识单纯调用dao所以不做注释
     */
    public List<Person> getAll(){
        return personMapper.getAll();
    }

    public Person getPersonByID(long id){
        return personMapper.getPersonByID(id);
    }

    public void  delete(long id){
        personMapper.delete(id);
    }

    public void update(Person p){
        personMapper.update(p);
    }

    public void newp(Person p){
        personMapper.newp(p);
    }

    public String getPasswordbyUsername(String username){return personMapper.getPasswordbyUsername(username);}
}