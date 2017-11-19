package com.mol.common.controller;

import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by usher on 16/8/31.
 */
public class PageResult2<T> extends HashMap<String, Object> {

    public final String DRAW = "draw";
    public final String RECORDS_TOTAL = "recordsTotal";
    public final String RECORDS_FILTERED = "recordsFiltered";
    public final String DATA = "data";

    public PageResult2(List<T> list, int draw) {
        this.put(DRAW, draw);
        this.put(RECORDS_TOTAL, list.size());
        this.put(RECORDS_FILTERED, list.size());
        this.put(DATA, list);
    }

    public PageResult2(List<T> list, int draw, boolean pageable) {
        if (pageable){
            PageInfo<T> pageInfo = new PageInfo<T>(list);
        }else{
            this.put(DATA, list);
        }
        this.put(DRAW, draw);
        this.put(RECORDS_TOTAL, list.size());
        this.put(RECORDS_FILTERED, list.size());

    }

}
