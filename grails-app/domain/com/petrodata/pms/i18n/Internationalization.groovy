package com.petrodata.pms.i18n
//字符国际化
class Internationalization {

    String name
    String lang
    String domain
    String domainId
    String column

    static constraints = {
        name(size:0..4000)
        lang(size:0..50,blank: true,nullable: false,
        inList: ['','cs_CZ','da','de','es','fr','it','ja','nb','nl','pl','pt_BR','pt_PT','ru','sv','th','zh_CN'])
        domain(size:0..100);
        domainId(size:0..50);
        column(size:0..50);
    }

    static mapping = {
        column column: "colName"
    }
}
