package com.mol.test;

import com.mol.service.UserService;
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
 @ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class UserServiceTest {
     @Autowired
     private UserService userService;
     @Test
       public void userServiceTest1(){
           Assert.assertNotNull(userService.getUserById(1));
       }
}
