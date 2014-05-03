package com.app.core.security

import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.core.GrantedAuthority

/**
 * Custom User Details for Spring Security
 *
 * @author Raúl Gomis
 */
class CustomUserDetails extends GrailsUser {

    final String name
    final String email

    CustomUserDetails(String username, String password, boolean enabled, boolean accountNonExpired,
                      boolean credentialsNonExpired, boolean accountNonLocked, Collection<GrantedAuthority> authorities,
                      long id, String name, String email) {

        super(username, password, enabled, accountNonExpired, credentialsNonExpired,
                accountNonLocked, authorities, id)

        this.name = name
        this.email = email
    }
}
