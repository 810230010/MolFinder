package com.mol.controller;

import com.mol.common.Exception.MyException.UnknownAccountException;
import com.mol.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.Map;

/**
 * Created by 江建平 on 2017/7/9.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private static Logger log = Logger.getLogger(UserController.class);
    @Autowired
    private UserService userService;


}
