package com.app.security

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUserDetailsService
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException
import com.app.admin.domain.security.User

/**
 *
 * @author raul.gomis
 */
class CustomUserDetailsService implements GrailsUserDetailsService {

    static final List NO_ROLES = [new GrantedAuthorityImpl(SpringSecurityUtils.NO_ROLE)]
    //static final List NO_ROLES = [new GrantedAuthorityImpl(Role.)]

    UserDetails loadUserByUsername(String username, boolean loadRoles) throws UsernameNotFoundException {
        return loadUserByUsername(username)
    }

    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User.withTransaction { status ->

            User user = User.findByUsername(username)
            if (!user) {
                throw new UsernameNotFoundException('User not found', username)
            }
            user.lastLogin = new Date()
            if (!user.save()) {
                log.error("Failed to save user data")
            }

            def authorities = user.authorities.collect {
                new GrantedAuthorityImpl(it.authority)
            }

            return new CustomUserDetails(user.username, user.password, user.enabled, !user.accountExpired, !user.passwordExpired, !user.accountLocked, (authorities) ?: NO_ROLES, user.id, user.name, user.email)
        }
    }

}

