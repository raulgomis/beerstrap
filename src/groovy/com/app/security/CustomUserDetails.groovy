package com.app.security

/**
 *
 * @author raul.gomis
 */
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.security.core.GrantedAuthority

//import org.springframework.security.core.userdetails.User

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
