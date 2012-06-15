# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "Commission", :force => true do |t|
    t.integer "memberCount", :null => false
    t.string  "name",        :null => false
    t.string  "searchName",  :null => false
    t.string  "type",        :null => false
  end

  add_index "commission", ["name", "type"], :name => "name", :unique => true

  create_table "CommissionMembership", :force => true do |t|
    t.string  "role",                       :null => false
    t.integer "commission_id", :limit => 8, :null => false
  end

  add_index "commissionmembership", ["commission_id"], :name => "FK7AAB2B41B5E79273"

  create_table "Diputado", :force => true do |t|
    t.string "hcdnId", :null => false
  end

  add_index "diputado", ["hcdnId"], :name => "hcdnId", :unique => true
  add_index "diputado", ["id"], :name => "FK1003F02241ED9140"

  create_table "Diputado_elements", :id => false, :force => true do |t|
    t.integer "Diputado_id", :limit => 8, :null => false
    t.integer "amount"
    t.string  "value"
  end

  add_index "diputado_elements", ["Diputado_id"], :name => "FK941108748248E265"

  create_table "Diputado_yearsWithDj", :id => false, :force => true do |t|
    t.integer "Diputado_id", :limit => 8, :null => false
    t.integer "element"
  end

  add_index "diputado_yearswithdj", ["Diputado_id"], :name => "FK11157EC58248E265"

  create_table "DiputadosProject", :force => true do |t|
  end

  add_index "diputadosproject", ["id"], :name => "FK311AB9489C8765D0"

  create_table "DiputadosRevision", :force => true do |t|
    t.string "law"
    t.string "revisionFile", :null => false
    t.string "who"
  end

  add_index "diputadosrevision", ["id"], :name => "FK1E380F8C7D14D168"
  add_index "diputadosrevision", ["revisionFile"], :name => "revisionFile", :unique => true

  create_table "District", :force => true do |t|
    t.string  "name",                           :null => false
    t.string  "searchName",                     :null => false
    t.integer "summarizedCountSignedProjects",  :null => false
    t.integer "countAbsence",                   :null => false
    t.float   "countAbsencePercentage"
    t.integer "countLicense",                   :null => false
    t.float   "countLicensePercentage"
    t.integer "countOfficialMission",           :null => false
    t.float   "countOfficialMissionPercentage"
    t.integer "countPresent",                   :null => false
    t.float   "countPresentPercentage"
  end

  add_index "district", ["name"], :name => "name", :unique => true

  create_table "ExecutiveProject", :force => true do |t|
  end

  add_index "executiveproject", ["id"], :name => "FK1672663150BAA0D1"

  create_table "Legislador", :force => true do |t|
    t.binary  "active",                         :limit => 1, :null => false
    t.binary  "dj"
    t.integer "summarizedCountSignedProjects"
    t.integer "countAbsence",                                :null => false
    t.float   "countAbsencePercentage"
    t.integer "countLicense",                                :null => false
    t.float   "countLicensePercentage"
    t.integer "countOfficialMission",                        :null => false
    t.float   "countOfficialMissionPercentage"
    t.integer "countPresent",                                :null => false
    t.float   "countPresentPercentage"
    t.integer "absent",                                      :null => false
    t.integer "abstention",                                  :null => false
    t.integer "afirmative",                                  :null => false
    t.integer "negative",                                    :null => false
  end

  add_index "legislador", ["id"], :name => "FK4D31931A389CA30A"

  create_table "LegisladorProject", :force => true do |t|
  end

  add_index "legisladorproject", ["id"], :name => "FKD41A7E9F50BAA0D1"

  create_table "LegisladorProject_Legislador", :id => false, :force => true do |t|
    t.integer "LegisladorProject_id", :limit => 8, :null => false
    t.integer "signatories_id",       :limit => 8, :null => false
  end

  add_index "legisladorproject_legislador", ["LegisladorProject_id"], :name => "FK3C7060BAD126C330"
  add_index "legisladorproject_legislador", ["signatories_id"], :name => "FK3C7060BAAFFBF1FB"

  create_table "Mandato", :force => true do |t|
    t.string   "endCause"
    t.datetime "fromMandato"
    t.datetime "toMandato"
    t.integer  "district_id",       :limit => 8, :null => false
    t.integer  "legislador_id",     :limit => 8, :null => false
    t.integer  "politicalParty_id", :limit => 8, :null => false
  end

  add_index "mandato", ["district_id"], :name => "FK9502EFF269F1EA59"
  add_index "mandato", ["legislador_id"], :name => "FK9502EFF22E5D24A5"
  add_index "mandato", ["politicalParty_id"], :name => "FK9502EFF2CC49AB99"

  create_table "Mandato_CommissionMembership", :id => false, :force => true do |t|
    t.integer "Mandato_id",     :limit => 8, :null => false
    t.integer "commissions_id", :limit => 8, :null => false
  end

  add_index "mandato_commissionmembership", ["Mandato_id"], :name => "FK2B51216ED394470"
  add_index "mandato_commissionmembership", ["commissions_id"], :name => "FK2B51216E9F83454C"

  create_table "Mandato_Period", :id => false, :force => true do |t|
    t.integer "Mandato_id", :limit => 8, :null => false
    t.integer "periods_id", :limit => 8, :null => false
  end

  add_index "mandato_period", ["Mandato_id"], :name => "FKC036FACED394470"
  add_index "mandato_period", ["periods_id"], :name => "FKC036FACE660513B3"

  create_table "MinisterProject", :force => true do |t|
  end

  add_index "ministerproject", ["id"], :name => "FKF5327F9450BAA0D1"

  create_table "Minute", :force => true do |t|
    t.datetime "minute_date",              :null => false
    t.integer  "number",                   :null => false
    t.integer  "reunion_id",  :limit => 8
  end

  add_index "minute", ["reunion_id"], :name => "FK896092348E242F30"

  create_table "ParticularProject", :force => true do |t|
  end

  add_index "particularproject", ["id"], :name => "FKB37E166450BAA0D1"

  create_table "Period", :force => true do |t|
    t.datetime "extending_from"
    t.datetime "extending_to"
    t.datetime "extraordinary_from"
    t.datetime "extraordinary_to"
    t.datetime "ordinary_from"
    t.datetime "ordinary_to"
    t.integer  "periodId",           :limit => 8, :null => false
  end

  add_index "period", ["periodId"], :name => "periodId", :unique => true

  create_table "Period_mandatos", :id => false, :force => true do |t|
    t.integer "Period_id",                      :limit => 8, :null => false
    t.integer "countAbsence",                                :null => false
    t.float   "countAbsencePercentage"
    t.integer "countLicense",                                :null => false
    t.float   "countLicensePercentage"
    t.integer "countOfficialMission",                        :null => false
    t.float   "countOfficialMissionPercentage"
    t.integer "countPresent",                                :null => false
    t.float   "countPresentPercentage"
    t.integer "mapkey_id",                      :limit => 8, :null => false
  end

  add_index "period_mandatos", ["Period_id"], :name => "FK9807073F70D44664"
  add_index "period_mandatos", ["mapkey_id"], :name => "FK9807073F41C66F5F"

  create_table "PoliticalParty", :force => true do |t|
    t.string  "mail"
    t.string  "name",                                        :null => false
    t.string  "searchName",                                  :null => false
    t.integer "summarizedCountSignedProjects",               :null => false
    t.integer "countAbsence",                                :null => false
    t.float   "countAbsencePercentage"
    t.integer "countLicense",                                :null => false
    t.float   "countLicensePercentage"
    t.integer "countOfficialMission",                        :null => false
    t.float   "countOfficialMissionPercentage"
    t.integer "countPresent",                                :null => false
    t.float   "countPresentPercentage"
    t.string  "type",                                        :null => false
    t.integer "president_id",                   :limit => 8
  end

  add_index "politicalparty", ["name", "type"], :name => "name", :unique => true
  add_index "politicalparty", ["president_id"], :name => "FKC6680E09E11D401F"

  create_table "Politician", :force => true do |t|
    t.binary  "blog"
    t.binary  "blogRSSFeed"
    t.binary  "cv"
    t.binary  "facebook",        :limit => 255
    t.string  "lastName",                       :null => false
    t.string  "mail"
    t.string  "name",                           :null => false
    t.string  "intern"
    t.string  "number"
    t.string  "photoPath"
    t.binary  "profile"
    t.string  "searchLastName",                 :null => false
    t.string  "searchName",                     :null => false
    t.integer "sex"
    t.string  "twitterUserName"
    t.binary  "webSite"
  end

  create_table "Project", :force => true do |t|
    t.binary   "documentURL"
    t.string   "file",          :limit => 20, :null => false
    t.datetime "initiated",                   :null => false
    t.string   "projectSource",               :null => false
    t.binary   "summary"
    t.text     "title"
    t.integer  "minute_id",     :limit => 8
  end

  add_index "project", ["file"], :name => "file", :unique => true
  add_index "project", ["minute_id"], :name => "FK50C8E2F9ECC5A004"

  create_table "ProjectStatistics", :force => true do |t|
    t.integer  "amount", :null => false
    t.datetime "date",   :null => false
  end

  add_index "projectstatistics", ["date"], :name => "date", :unique => true

  create_table "Project_Vote", :id => false, :force => true do |t|
    t.integer "Project_id", :limit => 8, :null => false
    t.integer "voters_id",  :limit => 8, :null => false
  end

  add_index "project_vote", ["Project_id"], :name => "FK41BE90907A9684E"
  add_index "project_vote", ["voters_id"], :name => "FK41BE9090A9718F53"
  add_index "project_vote", ["voters_id"], :name => "voters_id", :unique => true

  create_table "Project_elements", :id => false, :force => true do |t|
    t.integer "Project_id", :limit => 8, :null => false
    t.integer "amount"
    t.string  "value"
  end

  add_index "project_elements", ["Project_id"], :name => "FK866A577D7A9684E"

  create_table "Reunion", :force => true do |t|
    t.integer "number"
    t.integer "session_id", :limit => 8, :null => false
  end

  add_index "reunion", ["session_id"], :name => "FKA4BCC85C2EEC23F0"

  create_table "Senador", :force => true do |t|
  end

  add_index "senador", ["id"], :name => "FKD93A638241ED9140"

  create_table "SenadoresProject", :force => true do |t|
  end

  add_index "senadoresproject", ["id"], :name => "FKD60045499C8765D0"

  create_table "Session", :force => true do |t|
    t.integer "number"
    t.integer "type"
    t.integer "period_id", :limit => 8, :null => false
  end

  add_index "session", ["period_id"], :name => "FKD9891A7670D44664"

  create_table "SignableProject", :force => true do |t|
    t.string "type"
  end

  add_index "signableproject", ["id"], :name => "FKD36B46627D14D168"

  create_table "SignableProject_Commission", :id => false, :force => true do |t|
    t.integer "SignableProject_id", :limit => 8, :null => false
    t.integer "commissions_id",     :limit => 8, :null => false
  end

  add_index "signableproject_commission", ["SignableProject_id"], :name => "FKE54FF7087CD9F38E"
  add_index "signableproject_commission", ["commissions_id"], :name => "FKE54FF70820271156"

  create_table "SignableProject_unknown", :id => false, :force => true do |t|
    t.integer "SignableProject_id", :limit => 8, :null => false
    t.string  "element"
  end

  add_index "signableproject_unknown", ["SignableProject_id"], :name => "FK2C8D176D7CD9F38E"

  create_table "VariousOfficersProject", :force => true do |t|
  end

  add_index "variousofficersproject", ["id"], :name => "FKC539391150BAA0D1"

  create_table "Vote", :force => true do |t|
    t.string  "voteType",                   :null => false
    t.integer "legislador_id", :limit => 8, :null => false
  end

  add_index "vote", ["legislador_id"], :name => "FK28C70A2E5D24A5"

end
