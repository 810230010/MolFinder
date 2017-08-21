package com.mol.service;

import com.mol.dao.MaterialBuyMapper;
import com.mol.entity.MaterialBuy;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by usher on 2017/8/20.
 */
public interface MaterialService {

    /**
     * 发布原料求购
     * @param material
     * @return
     */
    int publishMeterialBuyRecord(MaterialBuy material);

}
