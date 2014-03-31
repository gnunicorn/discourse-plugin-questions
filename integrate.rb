
class QuestionArchetype < Archetype
end


arch = QuestionArchetype.new("question", {
    capabilities: [:searchable, :shown_publicly, :linkable]})


puts arch.options
Archetype.register("question", { archetype: arch })
