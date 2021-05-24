defmodule Importer.Constants do
  def xml_fields do
    [
      "parties"
    ]
    |> Enum.map(&String.to_atom(&1))
  end

  def headers do
    [
      "activityid",
      "ownerid",
      "actualstart",
      "activitytypecode",
      "statecode",
      "subject",
      "scheduledend",
      "owneridname",
      "prioritycode",
      "scheduleddurationminutes",
      "actualdurationminutes",
      "description",
      "regardingobjectid",
      "regardingobjectidname",
      "scheduledstart",
      "statuscode",
      "regardingobjecttypecode",
      "actualend",
      "new_origincampaignid",
      "appointment_isalldayevent",
      "appointment_location",
      "appointment_new_sourcecontact",
      "appointment_new_contactactivity",
      "appointment_new_activitytype",
      "appointment_new_activitytypefollowup",
      "appointment_new_followupstartingdate",
      "appointment_new_openfollowup",
      "appointment_new_responsecode",
      "appointment_ivc_checkinlatitude",
      "appointment_ivc_checkinlongitude",
      "appointment_ivc_checkoutlatitude",
      "appointment_ivc_checkoutlongitude",
      "appointment_ivc_checkindatetime",
      "vehicledelivery_new_activitytype",
      "vehicledelivery_new_activitytypefollowup",
      "vehicledelivery_new_contactactivity",
      "vehicledelivery_new_followupstartingdate",
      "vehicledelivery_new_location",
      "vehicledelivery_new_openfollowup",
      "vehicledelivery_new_sourcecontact",
      "email_new_sourcecontact",
      "email_new_activitytype",
      "email_new_contactactivity",
      "email_new_responsecode",
      "task_new_activitytype",
      "task_new_contactactivity",
      "task_new_sourcecontact",
      "task_new_responsecode",
      "letter_address",
      "letter_new_sourcecontact",
      "letter_new_activitytype",
      "letter_new_contactactivity",
      "letter_new_responsecode",
      "phonecall_phonenumber",
      "phonecall_new_activitytype",
      "phonecall_new_contactactivity",
      "phonecall_new_sourcecontact",
      "phonecall_new_responsecode",
      "fax_coverpagename",
      "fax_faxnumber",
      "fax_new_contactactivity",
      "fax_new_activitytype",
      "fax_new_sourcecontact",
      "fax_new_responsecode",
      "emailvision_new_contactactivity",
      "emailvision_new_sourcecontact",
      "emailvision_new_activitytype",
      "emailvision_new_responsecode",
      "sms_new_activitytype",
      "sms_new_contactactivity",
      "sms_new_sourcecontact",
      "sms_new_responsecode",
      "telemarketing_new_contactactivity",
      "telemarketing_new_sourcecontact",
      "telemarketing_new_activitytype",
      "telemarketing_new_responsecode",
      "testdrive_new_activitytype",
      "testdrive_new_activitytypefollowup",
      "testdrive_new_checkindate",
      "testdrive_new_checkoutdate",
      "testdrive_new_contactactivity",
      "testdrive_new_followupstartingdate",
      "testdrive_new_location",
      "testdrive_new_numberofvehicle",
      "testdrive_new_openfollowup",
      "testdrive_new_sourcecontact",
      "testdrive_new_typology",
      "testdrive_new_responsecode",
      "parties",
      "attachments",
      "notes"
    ]
    |> Enum.map(&String.to_atom(&1))
  end

  @doc """
  The field charachter delimiter
  """
  def field_delimiter do
    <<226, 149, 153>>
  end

  @doc """
  The line charachter delimiter
  """
  def line_delimiter do
    <<226, 149, 165>>
  end
end
