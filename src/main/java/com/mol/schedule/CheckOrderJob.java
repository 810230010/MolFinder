package com.mol.schedule;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * Created by usher on 2017/12/26.
 */
public class CheckOrderJob {
    @Autowired
    private JobMapper jobMapper;
    public void execute(){
        jobMapper.updateInvalidOrder();
    }
}
