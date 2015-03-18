QUESTION_ARCHETYPE_NAME = "question"

class QuestionArchetype < RegularTopicArchetype
  ## regular topic offers thread-driven sorting
end

arch = QuestionArchetype.new(QUESTION_ARCHETYPE_NAME, {
  capabilities: [:searchable, :shown_publicly, :linkable, :creatible]})

Archetype.register(QUESTION_ARCHETYPE_NAME, { archetype: arch })
