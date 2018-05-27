package com.mol.dao.admin;

import com.mol.dto.AdminCertificationTableDTO;
import com.mol.entity.admin.AdminMemberDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by usher on 2018/5/23.
 */
public interface AdminCertificationMapper {
    List<AdminCertificationTableDTO> listCertificated(@Param("searchKey") String searchKey,
                                                      @Param("orderColumn") String orderColumn,
                                                      @Param("orderType") String orderType);

    List<AdminCertificationTableDTO> listCertificating(@Param("searchKey") String searchKey,
                                                       @Param("orderColumn") String orderColumn,
                                                       @Param("orderType") String orderType);

    int updateCertificationState(@Param("certificateId") Integer certificateId, @Param("state") String state);
}
