package com.vet.dao;

import java.util.List;

public interface GenericDAO<T> {

    List<T> findAll();
    boolean insert(T model);
    boolean update(T model);
    boolean delete(int id);
    T findById(int id);
}