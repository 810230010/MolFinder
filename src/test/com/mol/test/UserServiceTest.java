package com.mol.test;

import com.mol.service.UserService;
import org.apache.log4j.Logger;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author
 * @description
 * @create 2017-07-06 16:24
 **/
 @RunWith(SpringJUnit4ClassRunner.class)
 @ContextConfiguration(locations = {"classpath:spring-context.xml"})
public class UserServiceTest {
    private static Logger logger = Logger.getLogger(UserServiceTest.class);
     @Autowired
     private UserService userService;
     @Test
       public void userServiceTest1(){
         logger.info(userService.getUserById(1).getPhone());
         Assert.assertNotNull(userService.getUserById(1));
       }
}
