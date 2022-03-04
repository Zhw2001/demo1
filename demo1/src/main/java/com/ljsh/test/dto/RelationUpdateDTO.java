package com.ljsh.test.dto;

import lombok.Data;

import java.util.List;

@Data
public class RelationUpdateDTO <T,V>{  //接收前端发来的角色-权限信息，更新角色权限关系

    public RelationUpdateDTO(T subject_id, List<V> insert, List<V> delete) {
        this.subject_id = subject_id;
        this.insert = insert;
        this.delete = delete;
    }

    public RelationUpdateDTO(){}
    private T subject_id;
    private List<V> insert;
    private List<V> delete;

}
