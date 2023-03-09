class SurveyResponder < ApplicationRecord
  belongs_to :survey
  belongs_to :responder, class_name: "User"
end
