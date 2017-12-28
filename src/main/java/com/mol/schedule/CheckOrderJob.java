package com.mol.schedule;

import com.mol.dao.IndexMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * Created by usher on 2017/12/26.
 */
public class CheckOrderJob {
    @Autowired
    private IndexMapper indexMapper;
    public void execute(){
        indexMapper.updateInvalidOrder();
    }
}
