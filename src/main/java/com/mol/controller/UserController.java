package com.mol.controller;

import com.mol.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 江建平 on 2017/7/9.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private static Logger log = Logger.getLogger(UserController.class);
    @Autowired
    private UserService userService;
    @RequestMapping("/registerPage")
    public String view2register(){
        return "registery";
    }

}
