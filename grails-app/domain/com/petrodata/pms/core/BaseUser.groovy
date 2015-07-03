package com.petrodata.pms.core

import com.petrodata.pms.team.Position

//用户表
class BaseUser { //implements org.activiti.engine.identity.User {

	/*add by activiti*/
	String id
	String email
	String firstName
	String lastName
	String skin //

	transient springSecurityService

	String username
	String password
	//是否启用
	boolean enabled
	//是否账户过期
	boolean accountExpired
	//是否账户锁定
	boolean accountLocked
	//是否密码过期
	boolean passwordExpired
	//隶属部门
	BaseDepartment baseDepartment

	//隶属班次岗位
	Position position

	static constraints = {
		username blank: false, unique: true
		password blank: false

		email email: true, blank: false, unique: true
		firstName blank: false
		lastName blank: false
		baseDepartment nullable: false;
		position  nullable: true;
		skin size: 0..50,nullable: true,blank:true
	}

	static mapping = {
		password column: '`password`'
		id generator: 'uuid'
	}

	Set<BaseRole> getAuthorities() {
		BaseUserBaseRole.findAllByBaseUser(this).collect { it.baseRole } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	String toString(){
		return username;
	}
}
