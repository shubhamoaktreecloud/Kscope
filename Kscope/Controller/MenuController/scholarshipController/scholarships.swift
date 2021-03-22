//
//  scholarships.swift
//  Kscope
//
//  Created by Mac on 27/01/21.
//

import Foundation

struct ApplicantJsonObject:Codable{
    var persona_branding:persona_brandingApplicant
    var account:applicantAccountModel
    var applicants:[applicantsAccountModels]
}

//struct PeopleMainJson:Codable {
//    var persona_branding:persona_bradingPeople
//    var account:peopleAccountModel
//    var all_members:[peopleAllMemberModel]
//}

struct persona_bradingPeople: Codable{
    
    var primary_tabs__c : String?
    var scholarship_subtabs__c : String?
    var application_subtabs__c : String?
    var sub_tabs:persona_brandingPeoplesApplicant
}

struct persona_brandingPeoplesApplicant:Codable {
//    var primary_tabs__c:String?
//    var scholarship_subtabs__c:String?
//    var application_subtabs__c:String?
   // var enable_notifications__c:Bool?
   // var enable_messaging__c:Bool?
   // var enable_scholarship_builder__c:Bool?
    var sub_tabs:PeopleModelOne
}

struct PeopleModelOne:Codable {
//    var subtab_name__c:String?
//    var status_for_api_call__c:String?
//    var order__c:String?
//    var table_headers:[Scholarships]
    var Applicant:[applicantsModel]
}


struct peopleAccountModel: Codable {
    
}

struct applicantAccountModel:Codable {
    
}

struct applicantsAccountModels:Codable {
//    var id : Int? = nil
//    var sfid : String? = nil
    var name : String?
    var email_address__c : String?
    var first_name__c : String?
    var last_name__c : String?
//    var gpa__c : Int? = nil
//    var score__c : Int? = nil
//    var status__c : String? = nil
    var gender__c : String?
//    var race__c : String? = nil
//    var draft_status_in_time__c : String? = nil
//    var submitted_status_date__c : String? = nil
//    var application_total_score__c : Int?? = nil
//    var mailing_state_province__c : String? = nil
}

struct persona_brandingApplicant:Codable {
//    var primary_tabs__c:String?
//    var scholarship_subtabs__c:String?
//    var application_subtabs__c:String?
   // var enable_notifications__c:Bool?
   // var enable_messaging__c:Bool?
   // var enable_scholarship_builder__c:Bool?
    var sub_tabs:ApplicantModelOne
}

struct ApplicantModelOne:Codable {
//    var subtab_name__c:String?
//    var status_for_api_call__c:String?
//    var order__c:String?
//    var table_headers:[Scholarships]
    var Applicant:[applicantsModel]
}

struct applicantsModel:Codable {
    var subtab_name__c:String?
//    var status_for_api_call__c:String? = nil
//    var order__c:Int? = nil
    var table_headers:[table_headersModel]
}

struct AccountResponseModel:Codable {
    var accounts:[Accounts]
}

struct MainJsonObject:Codable{
    var persona_branding:persona_branding
    var account:accountModel
    var scholarship_count_based_on_status:scholarship_count_based_on_statusModel
    var scholarships:[scholarshipsModelNw]
}

struct scholarshipsModelNw:Codable{
    
    var id : Int? = nil
    var sfid : String? = nil
    var name : String? = nil
    var url_name__c : String? = nil
    var open_date__c : String? = nil
    var status__c : String? = nil
    var description__c : String? = nil
    var ready_to_apply__c : String? = nil
    var progress__c : String? = nil
    var minimum_gpa__c : Int? = nil
    var moredetails__c : String? = nil
    var qualifications__c : String? = nil
    var total_reviewers : Int? = nil
    var lastmodifieddate : String? = nil
    var deadline_date_time__c : String? = nil
    var day_remaining__c : String? = nil
    var scholarshiplogourl__c : String? = nil
    var scholarship_fund_amount__c : Int? = nil
    var total_number_of_applicants__c : Int? = nil
    var header_scholarship_title__c : String? = nil
    var listing_scholarship_title__c : String? = nil
    var main_page_scholarship_title__c : String? = nil
    var number_of_submitted_applications__c : Int? = nil
    var application_percentage_change_this_week__c : Int? = nil
    var citizenship__c : String? = nil
    
}

struct scholarship_count_based_on_statusModel:Codable {
    
}

struct accountModel:Codable {
    
//    var sfid : String?
//    var name : String?
}

struct persona_branding:Codable {
    
    var primary_tabs__c:String?
    var scholarship_subtabs__c:String?
    var application_subtabs__c:String?
   // var enable_notifications__c:Bool?
   // var enable_messaging__c:Bool?
   // var enable_scholarship_builder__c:Bool?
    var sub_tabs:ScholarshipsModelOne
}

struct ScholarshipsModelOne:Codable {
//    var subtab_name__c:String?
//    var status_for_api_call__c:String?
//    var order__c:String?
//    var table_headers:[Scholarships]
    var Applicant:[applicantsModel]
    var  Scholarships:[ScholarshipsModel]
}

struct ScholarshipsModel:Codable {
    
    var subtab_name__c:String?
    var status_for_api_call__c:String?
    var order__c:Int?
    var table_headers:[table_headersModel]
}

struct table_headersModel:Codable {
   // var field_api_name__c:String?
    var column_name__c:String?
//    var enable_sort__c:Bool?
//    var enable_search__c:Bool?
//    var order__c:Int?
//    var enable_filter__c:Bool?
//    var field_data_type__c:String?
//    var operator__c:String? = nil
}
