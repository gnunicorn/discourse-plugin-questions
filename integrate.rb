# Create and Register new Archetype
class QuestionArchetype < RegularTopicArchetype; end
arch = QuestionArchetype.new('question', {capabilities: [:searchable, :shown_publicly, :linkable, :creatible]})
Archetype.register('question', { archetype: arch })
