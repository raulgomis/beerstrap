package com.app.taglib

import grails.plugin.springsecurity.SpringSecurityUtils

class SecurityTagLib {
	static namespace = 'bs'

	def showRole = {
		String ret = ""
		def authorities = SpringSecurityUtils.getPrincipalAuthorities()
		def rolesNames = SpringSecurityUtils.authoritiesToRoles(authorities)
		if(rolesNames.size()>0) ret = rolesNames.toArray()[0]
		out << g.message(code:"app.roles."+ret+".label",default:ret)
	}
}
