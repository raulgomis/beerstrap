package com.app.core.security

import grails.plugin.springsecurity.userdetails.GrailsUserDetailsService
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.security.core.authority.SimpleGrantedAuthority
import com.app.admin.domain.security.User

/**
 * Custom User Details Service for Spring Security
 *
 * @author Raúl Gomis
 */
class CustomUserDetailsService implements GrailsUserDetailsService {

    static final List NO_ROLES = [new SimpleGrantedAuthority(SpringSecurityUtils.NO_ROLE)]
    //static final List NO_ROLES = [new GrantedAuthorityImpl(Role.)]

    UserDetails loadUserByUsername(String username, boolean loadRoles) throws UsernameNotFoundException {
        return loadUserByUsername(username)
    }

    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User.withTransaction { status ->

            User user = User.findByUsernameIlikeOrEmailIlike(username, username)
            if (!user) {
                throw new UsernameNotFoundException('User not found', username)
            }
            user.lastLogin = new Date()
            if (!user.save()) {
                log.error("Failed to save user data")
            }

            def authorities = user.authorities.collect {
                new SimpleGrantedAuthority(it.authority)
            }

            return new CustomUserDetails(user.username, user.password, user.enabled, !user.accountExpired, !user.passwordExpired, !user.accountLocked, (authorities) ?: NO_ROLES, user.id, user.name, user.email)
        }
    }

}

