package com.petrodata.pms.core
 //基本角色表
class BaseRole { // implements org.activiti.engine.identity.Group {
	//uuid的唯一性主键 兼容 activiti工作流
	String id
	//角色名称
	String name
	//角色权限（与名称相同）
	String authority
	//类型 （目前未使用，设为null）
	String type


	static mapping = {
		cache true
		id generator: 'assigned'
	}

	static constraints = {
		authority blank: false, unique: true
		name blank: false
		type nullable: true
	}
	String toString(){
		return name;
	}
}
