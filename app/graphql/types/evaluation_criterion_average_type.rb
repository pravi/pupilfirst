module Types
  class EvaluationCriterionAverageType < Types::BaseObject
    field :id, ID, null: false
    field :average_grade, Float, null: false
  end
end
