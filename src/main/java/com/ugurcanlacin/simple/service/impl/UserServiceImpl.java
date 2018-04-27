package com.ugurcanlacin.simple.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ugurcanlacin.simple.dao.UserDao;
import com.ugurcanlacin.simple.model.User;
import com.ugurcanlacin.simple.model.MyUserPrincipal;
import com.ugurcanlacin.simple.repository.UserRepository;
import com.ugurcanlacin.simple.service.UserService;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

@Service("userService")
public class UserServiceImpl implements UserService, UserDetailsService {

    @Autowired
    UserDao userDao;

    @Transactional
    public void persistUser(User user) {
        userDao.persistUser(user);

    }

    @Transactional
    public User findUserById(int id) {

        return userDao.findUserById(id);
    }

    @Transactional
    public void updateUser(User user) {
        userDao.updateUser(user);

    }

    @Transactional
    public void deleteUser(User user) {
        userDao.deleteUser(user);

    }

    @Transactional
    @Override
    public User findByUserName(String username) {
        return userDao.findByUserName(username);
    }

    @Transactional
    @Override
    public boolean isPaswordCorrect(User user, String password) {
        User userFromDb = findUserById(user.getId());
        return password.equals(userFromDb.getPassword());
    }

    @Transactional
    @Override
    public UserDetails loadUserByUsername(String username) {
        User user = userDao.findByUserName(username);
        if (user == null) {
            throw new UsernameNotFoundException(username);
        }
        return new MyUserPrincipal(user);
    }

}
